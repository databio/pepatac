""" Tests for command constructor. """

import os
import random
import string
import sys
import pytest

TEST_PATH = os.path.dirname(__file__)
ATAC_PATH = os.path.join(TEST_PATH, "..", "pipelines")
sys.path.append(ATAC_PATH)
from ATACseq import build_command


__author__ = "Vince Reuter"
__email__ = "vreuter@virginia.edu"



class TestBasicBuildCommand:
    """ Tests for basic construction of a command from its parts. """


    @pytest.mark.parametrize(argnames="chunks", argvalues=[None, "", []])
    def test_no_command_parts(self, chunks):
        """ Fail loudly to halt processing if no command parts are there. """
        with pytest.raises(ValueError):
            build_command(chunks)


    def test_basic_raw_string(self):
        """ Single raw text command is returned as such. """
        text = "".join(random.choice(string.letters))
        assert text == build_command(text)


    def test_single_wrapped_string(self):
        """ Raw command within contained type is returned as the command. """
        digits_string = "".join(random.choice(string.digits))
        assert digits_string == build_command(digits_string)


    @pytest.mark.parametrize(
        argnames="option", argvalues=["python", "-V", "--help"])
    def test_single_tuple_null_argument(self, option):
        """ Null-valued option is excluded from command. """
        assert "" == build_command([(option, None)])


    @pytest.mark.parametrize(
        argnames=["option", "argument"],
        argvalues=[("java", "-version"), ("python", "--help"), ("-q", True), ("--CO", 550)])
    def test_single_tuple_non_null_argument(self, option, argument):
        """ Non-null-valued option is included in command, single-spaced. """
        assert "{} {}".format(option, argument) == build_command([(option, argument)])


    @pytest.mark.parametrize(
        argnames="text",
        argvalues=[" left", "right ", "  2left", "3right   ", "  wacky    "])
    def test_trims_spaces_raw_string(self, text):
        """ Space characters are trimmed from text ends. """
        assert text.strip(" ") == build_command([text])


    @pytest.mark.parametrize(
        argnames="expected_opt", argvalues=["-O", "-output", "--outdir"])
    def test_trims_spaces_from_optarg(self, expected_opt):
        """ Space characters are trimmed from option and argument. """
        expected_arg = "output_dir"
        opt_template = "  {}   "
        arg_template = " {}  "
        opt_input = opt_template.format(expected_opt)
        arg_input = arg_template.format(expected_arg)
        expected = "{} {}".format(expected_opt, expected_arg)
        observed = build_command([(opt_input, arg_input)])
        assert expected == observed


    @pytest.mark.parametrize(
        argnames=["option", "argument"],
        argvalues=[("--delimiter", "\n"), ("--sep", "\t")])
    def test_retains_non_space_whitespace(self, option, argument):
        """ Command builder retains non-space whitespace (e.g., delimiter). """
        assert "{} {}".format(option, argument) == build_command([(option, argument)])


    @pytest.mark.parametrize(
        argnames="chunks",
        argvalues=[["program", ("--opt", )],
                   [("program", ), ("--opt", "arg")],
                   [("program", "subcommand"), ("opt", "arg"), ("bad_positional", )]])
    def test_prohibits_single_item_container_element(self, chunks):
        """ Only raw strings and two-tuples are allowed. """
        with pytest.raises(ValueError):
            build_command(chunks)


    @pytest.mark.parametrize(
        argnames="chunks",
        argvalues=[[("program", "subcommand", "positional")],
                   ["program", ("pos1", "pos2", "pos3")]])
    def test_prohibits_container_element_with_more_than_two_items(self, chunks):
        """ Only raw strings and two-tuples are allowed. """
        with pytest.raises(ValueError):
            build_command(chunks)



class TestBuildCommandHolistic:
    """ Tests for single, more complex command construction cases. """


    def test_associativity(self):
        """ Command construction satisfies associativity. """
        expected = "fseq -d input_folder -o output -of npf input_file"
        assert expected == build_command(expected.split())
        assert expected == build_command(["fseq", ("-d", "input_folder"), "-o", ("output", "-of"), "npf", "input_file"])
        assert expected == build_command([("fseq", "-d"), ("input_folder", "-o"), "output", "-of", ("npf", "input_file")])


    @pytest.mark.parametrize(
        argnames="arg_by_opt",
        argvalues=[{"--gsize": "4B"}, {"--qvalue": 0.01}, {"--gsize": 4000000000, "-qvalue": 0.005}],
        ids=lambda arg_by_opt: " arg_by_opt = {} ".format(arg_by_opt))
    def test_conditional_argument_specification(self, arg_by_opt):
        """ Null-valued options are ignored. """
        optnames = ["--gsize", "--qvalue"]
        program = "macs2 callpeak"
        opts_text = "-f BED --nomodel"
        options = [(opt, arg_by_opt[opt] if opt in arg_by_opt else None) for opt in optnames]
        cmd = build_command([program] + [opts_text] + options)
        for opt in optnames:
            if opt in arg_by_opt:
                assert "{} {}".format(opt, arg_by_opt[opt]) in cmd
            else:
                assert opt not in cmd
        expected_num_spaces = sum(len(command_section) for command_section in [program.split(" "), opts_text.split(" "), options]) - 1
        print("Expecting {} spaces in command: {}".format(expected_num_spaces, cmd))
        assert expected_num_spaces == cmd.count(" ")


# Run this script to build and deploy the mkdocs docs in /docs

JUPYTER_SOURCE=""
JUPYTER_BUILD=""
AUTODOC_MODULES=()
AUTODOC_BUILD=""
USAGE_TEMPLATE="docs/usage_template.md"
USAGE_CMDS=("python pipelines/pepatac.py --help")
RENDERED_DIR="$CODEBASE/code.databio.org/PEPATAC"

# Build jupyter source documents into markdown
if [ ! -z "$JUPYTER_SOURCE" ]
then
  for NB in `ls "$JUPYTER_SOURCE"/*.ipynb`
  do
    jupyter nbconvert --to markdown "$NB" --output-dir "$JUPYTER_BUILD"
  done
else
  echo "No JUPYTER_SOURCE provided."
fi


# Build python autodocs into markdown
if [ ! -z "$AUTODOC_MODULES" ]
then
  for MODULE in $AUTODOC_MODULES
  do
    $CODEBASE/gendocs.py $MODULE > $AUTODOC_BUILD/$MODULE.md
  done
else
  echo "No AUTODOC_MODULES provided."
fi


# Build an auto-usage page in markdown
if [ ! -z "$USAGE_CMDS" ]
then
  cp $USAGE_TEMPLATE usage_template.md
  for cmd in "$USAGE_CMDS"; do
    echo $cmd
    echo -e "\n\`$cmd\`" >> usage_template.md
    echo -e '```{console}' >> usage_template.md
    $cmd >> usage_template.md 2>&1
    echo -e '```' >> usage_template.md
  done
  mv usage_template.md  docs/usage.md
  cat docs/usage.md
else
  echo "No USAGE_CMDS provided."
fi


# Render completed docs into output folder with `mkdocs`

mkdocs build -f mkdocs.yml -d "$RENDERED_DIR"

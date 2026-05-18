"""PEPATAC plot theme and color utilities."""

import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Agg')


def apply_pepatac_theme(ax):
    """Apply PEPATAC styling to an axes object."""
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['left'].set_linewidth(0.5)
    ax.spines['bottom'].set_linewidth(0.5)
    ax.tick_params(width=0.5, length=4)


def get_color_gradient(n: int, low: str, high: str, mid: str = None) -> list[str]:
    """Generate a color gradient with n colors."""
    if n == 1:
        return [low]

    from matplotlib.colors import LinearSegmentedColormap, to_hex
    import numpy as np

    if mid:
        colors = [low, mid, high]
        positions = [0, 0.5, 1]
    else:
        colors = [low, high]
        positions = [0, 1]

    cmap = LinearSegmentedColormap.from_list("custom", list(zip(positions, colors)))
    return [to_hex(cmap(i / max(1, n - 1))) for i in range(n)]


ALIGNMENT_COLORS = {
    "unaligned": "#1a1a1a",
    "duplicates": "#FC1E25",
}

PREALIGNMENT_COLORS = ["#FFE595", "#F6CAA6", "#F6F2A6"]

GENOME_COLORS_BASE = ["#4876FF", "#94D9CE", "#7648FF"]

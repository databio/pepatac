"""Allow running as: python -m pepatac_summarizer"""

from .cli import main

if __name__ == "__main__":
    import sys
    sys.exit(main())

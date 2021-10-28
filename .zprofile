# Is this file called after Homebrew's initialization?

# Created by `pipx` on 2021-07-09 15:45:45
export PATH="$PATH:/Users/rhozen/.local/bin"

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH

# From Homebrew docs: configuring completions in zsh
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

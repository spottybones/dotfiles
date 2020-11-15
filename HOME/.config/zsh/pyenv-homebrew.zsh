# HOMEBREW Environment Variables
export HOMEBREW_INSTALL_CLEANUP=TRUE
export HOMEBREW_PREFIX=$(brew --prefix)

export PATH="$HOMEBREW_PREFIX/opt/tcl-tk/bin:$PATH"

# Use PyEnv to set Python Environment
export PYENV_SHELL=zsh
export PYENV_ROOT=$(pyenv root)
# export PYENV_VERSION=$(pyenv version-name)
export PYTHONPATH=$PYENV_ROOT/shims

# PyEnv & HOMEBREW Build variables
PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I$HOMEBREW_PREFIX/opt/tcl-tk/include'"
export PYTHON_CONFIGURE_OPTS="$PYTHON_CONFIGURE_OPTS --with-tcltk-libs='-L$HOMEBREW_PREFIX/opt/tcl-tk/lib -ltcl8.6 -ltk8.6'"
export CFLAGS="-O2 -I$HOMEBREW_PREFIX/include"
CPPFLAGS="-I$HOMEBREW_PREFIX/opt/sqlite/include -I$HOMEBREW_PREFIX/opt/tcl-tk/include"
CPPFLAGS="$CPPFLAGS -I$HOMEBREW_PREFIX/opt/zlib/include"
CPPFLAGS="$CPPFLAGS -I$HOMEBREW_PREFIX/opt/bzip2/include"
export CPPFLAGS="$CPPFLAGS -I$HOMEBREW_PREFIX/opt/openssl@1.1/include"
LDFLAGS="-L$HOMEBREW_PREFIX/opt/sqlite/lib -L$HOMEBREW_PREFIX/opt/tcl-tk/lib"
LDFLAGS="$LDFLAGS -L$HOMEBREW_PREFIX/opt/zlib/lib"
LDFLAGS="$LDFLAGS -L$HOMEBREW_PREFIX/opt/bzip2/lib"
export LDFLAGS="$LDFLAGS -L$HOMEBREW_PREFIX/opt/openssl@1.1/lib -L$HOMEBREW_PREFIX/opt/readline/lib"
PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/sqlite/lib/pkgconfig:$HOMEBREW_PREFIX/opt/tcl-tk/lib/pkgconfig"
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOMEBREW_PREFIX/opt/zlib/lib/pkgconfig"
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOMEBREW_PREFIX/opt/bzip2/lib/pkgconfig"
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOMEBREW_PREFIX/opt/openssl@1.1/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$PYENV_ROOT/versions/$PYENV_VERSION/lib/pkgconfig"

# Version: 0.0.3
FROM debian
MAINTAINER YupiRex
RUN apt update && apt install -y \
    ncurses-dev build-essential mercurial python3-dev shellcheck cmake golang-any git
WORKDIR /tmp
RUN git clone https://github.com/vim/vim.git
WORKDIR /tmp/vim/src 
RUN ./configure --with-features=huge \
    --disable-darwin \
    --disable-selinux \
    --enable-luainterp \
    --enable-perlinterp \
    --enable-pythoninterp \
    --enable-python3interp \
    --enable-tclinterp \
    --enable-rubyinterp \
    --enable-cscope \
    --enable-multibyte \
    --enable-xim \
    --enable-fontset \
    --enable-gui=gnome2
RUN make
RUN make install
WORKDIR /
RUN rm -rf /tmp/vim
RUN apt purge -y \
    ncurses-dev build-essential mercurial python3-dev shellcheck cmake golang-any git
# Install vimrc config


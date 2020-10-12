# Version: 0.0.3
FROM debian
MAINTAINER YupiRex
#install bash-completion
RUN apt update && apt install -y bash-completion && \
        sed -i '/# enable bash completion/,/^$/ {/enable bash/!s/^#//}' /etc/bash.bashrc
#source /etc/bash.bashrc
#download & compile vim 8.2
WORKDIR /tmp
RUN apt install -y \
        ncurses-dev build-essential mercurial && \
    apt install -y \
        python3-dev shellcheck golang-any cmake git curl && \
    git clone https://github.com/vim/vim.git
WORKDIR /tmp/vim/src 
RUN ./configure \
        --with-features=huge \
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
        --enable-gui=gnome2 && \
    make && \
    make install
# Install vimrc config
#copy config
WORKDIR /root
RUN git clone https://github.com/yupirex/vimrc.git && \
    ln -s /root/vimrc/.vim* /root
RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN vim "+PlugInstall" "+qa!"    
RUN (python3 /root/.vim/bundle/YouCompleteMe/install.py --all || true)
RUN rm -rf /tmp/vim && \
    apt purge -y ncurses-dev build-essential mercurial \
        golang-1.11-go cmake
ENTRYPOINT git clone --mirror  https://github.com/yupirex/vimrc.git && bash

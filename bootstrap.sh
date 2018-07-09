#!/usr/bin/env bash

## Configure user home

if [ ! -d ~/.git ] || [ -z "$(git -C ~ rev-parse HEAD)" ]; then
    git -C ~ init \
        && git -C ~ remote add origin https://github.com/macosx/home.git \
        && git -C ~ fetch --all --progress \
        && git -C ~ checkout master --progress \
        && git submodule update --init --recursive \
        && ~/.vim/bundle/vim-powerline-fonts/install.sh
fi

## Install HomeBrew

if [ ! -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

## Install GNU packages

GNU_PACKAGES="gawk grep gnu-sed"

for pkg in $GNU_PACKAGES; do
    if [ ! "$(brew ls --versions $pkg)" ]; then
        brew install -v $pkg --with-default-names
    fi
done

## Install core packages

TERM_PACKAGES="$TERM_PACKAGES aria2"
TERM_PACKAGES="$TERM_PACKAGES bash-completion"
TERM_PACKAGES="$TERM_PACKAGES carthage"
TERM_PACKAGES="$TERM_PACKAGES cocoapods"
TERM_PACKAGES="$TERM_PACKAGES coreutils"
TERM_PACKAGES="$TERM_PACKAGES git"
TERM_PACKAGES="$TERM_PACKAGES gpg"
TERM_PACKAGES="$TERM_PACKAGES gpg-agent"
TERM_PACKAGES="$TERM_PACKAGES html-xml-utils"
TERM_PACKAGES="$TERM_PACKAGES htop"
TERM_PACKAGES="$TERM_PACKAGES iftop"
TERM_PACKAGES="$TERM_PACKAGES jq"
TERM_PACKAGES="$TERM_PACKAGES p7zip"
TERM_PACKAGES="$TERM_PACKAGES pngquant"
TERM_PACKAGES="$TERM_PACKAGES terminal-notifier"
TERM_PACKAGES="$TERM_PACKAGES tmux"
TERM_PACKAGES="$TERM_PACKAGES tree"
TERM_PACKAGES="$TERM_PACKAGES wget"

JAVA_PACKAGES="$JAVA_PACKAGES antlr"
JAVA_PACKAGES="$JAVA_PACKAGES aspectj"
JAVA_PACKAGES="$JAVA_PACKAGES cfr-decompiler"
JAVA_PACKAGES="$JAVA_PACKAGES gradle"
JAVA_PACKAGES="$JAVA_PACKAGES groovy"
JAVA_PACKAGES="$JAVA_PACKAGES maven"
JAVA_PACKAGES="$JAVA_PACKAGES apktool"
JAVA_PACKAGES="$JAVA_PACKAGES dex2jar"
JAVA_PACKAGES="$JAVA_PACKAGES jadx"
JAVA_PACKAGES="$JAVA_PACKAGES smali"

NODE_PACKAGES="$NODE_PACKAGES babel"
NODE_PACKAGES="$NODE_PACKAGES webpack"

for pkg in $TERM_PACKAGES $JAVA_PACKAGES $NODE_PACKAGES; do
    if [ ! "$(brew ls --versions $pkg)" ]; then
        brew install -v $pkg
    fi
done

## Install cask packages

brew tap macosx/cask

CASK_PACKAGES="$CASK_PACKAGES android-file-transfer"
CASK_PACKAGES="$CASK_PACKAGES android-platform-tools"
CASK_PACKAGES="$CASK_PACKAGES android-sdk"
CASK_PACKAGES="$CASK_PACKAGES android-studio"
CASK_PACKAGES="$CASK_PACKAGES aria2gui"
CASK_PACKAGES="$CASK_PACKAGES charles"
CASK_PACKAGES="$CASK_PACKAGES dash"
CASK_PACKAGES="$CASK_PACKAGES etcher"
CASK_PACKAGES="$CASK_PACKAGES google-chrome"
CASK_PACKAGES="$CASK_PACKAGES google-drive-file-stream"
CASK_PACKAGES="$CASK_PACKAGES iina"
CASK_PACKAGES="$CASK_PACKAGES intellij-idea-ce"
CASK_PACKAGES="$CASK_PACKAGES iterm2"
CASK_PACKAGES="$CASK_PACKAGES java"
CASK_PACKAGES="$CASK_PACKAGES shadowsocksx-ng-r8"
CASK_PACKAGES="$CASK_PACKAGES sketch"
CASK_PACKAGES="$CASK_PACKAGES sublime-text"
CASK_PACKAGES="$CASK_PACKAGES typora"
CASK_PACKAGES="$CASK_PACKAGES wechat"
CASK_PACKAGES="$CASK_PACKAGES xmind-zen"

for pkg in $CASK_PACKAGES; do
    if [ ! "$(brew cask ls --versions $pkg)" ]; then
        brew cask install -v $pkg
    fi
done

brew cleanup --force && rm -rf /Library/Caches/Homebrew/*


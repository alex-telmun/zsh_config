Z-shell configuration files
===========================

Install
-------

    sudo rm -rf /etc/zsh/* && git clone https://github.com/alex-telmun/zsh_config.git $HOME/.zsh_config
    sudo ln -s $HOME/.zsh_config/zshrc /etc/zsh/zshrc
    sudo ln -s $HOME/.zsh_config/zshrc.d /etc/zsh/zshrc.d

Dependencies
------------

* `pkgfile`
* `pastebinit`
* `xclip`
* `zsh-syntax-highlighting`
* `zsh-autosuggestions`
* `kubectx`
* `kubens`

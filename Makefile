
%.m4: %.mi5
	awk -f bin/mi5.awk < $< > $@

EMAIL:=email@gmail.com
CREDENTIAL_HELPER:=osxkeychain
# ejemplo: SIGNING_KEY='47DA2914E83D398A'
SIGNING_KEY:=VACIO
GPG_PROGRAM:=gpg

install: install-tmux install-git install-vim 
	@echo 'Instalación completa'	

TMUX_PLUGIN_DIR=$(HOME)/.tmux/plugins/tpm

install-tmux: tmux/tmux.conf
	test -d $(TMUX_PLUGIN_DIR) && rm -Rf $(TMUX_PLUGIN_DIR) || true
	git clone https://github.com/tmux-plugins/tpm $(TMUX_PLUGIN_DIR)
	cp -p -- tmux/tmux.conf $(HOME)/.tmux.conf
	mkdir -p -- $(HOME)/.tmux
	cp -p -- tmux/extra/* $(HOME)/.tmux/

install-vim: vim/vimrc
	cp -p -- vim/vimrc $(HOME)/.vimrc
	vim +'PlugInstall --sync' +qa

install-git: git/gitconfig
	cp -p -- git/gitconfig $(HOME)/.gitconfig

git/gitconfig: git/gitconfig.m4
	m4 \
	    -D EMAIL=$(EMAIL) \
	    -D SIGNING_KEY=$(SIGNING_KEY) \
	    -D CREDENTIAL_HELPER=$(CREDENTIAL_HELPER) \
	    -D GPG_PROGRAM=$(GPG_PROGRAM) \
	    git/gitconfig.m4 > $@

clean:
	rm -f -- \
	    git/gitconfig \
	    git/gitconfig.m4

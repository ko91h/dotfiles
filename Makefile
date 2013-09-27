VIMI_DIR = ~/.dotfiles/vimi
VIMRC = vimrc
VUNDLE_DIR = bundle/vundle
TIMESTAMP = `date +%s`
BACKUP_PREFIX  = .dotfiles.bak
VIM_DIR = vim

DOTFILES_DIR = ~/.dotfiles
TMUX = tmux.conf
SSH_DIR  = ssh
SSH  = config
GIT  = gitconfig
BASH = bashrc

vimi: echostart bundle-install
	@echo "\nVimi successfully installed.\nRun Vim and write something awesome."

echostart:
	@echo "Start installing Vimi...\n"

bundle-install: vimi_symlinks vundle
	-vim +BundleInstall +quitall

vimi_symlinks: vimi_backup
	@ln -fs ${VIMI_DIR}/${VIMRC} ~/.${VIMRC} && \
	ln -fs ${VIMI_DIR}/${VIM_DIR} ~/.${VIM_DIR} && \
	echo "Create symlinks:\n~/.${VIMRC} -> ${VIMI_DIR}/${VIMRC}\n~/.${VIM_DIR} -> ${VIMI_DIR}/${VIM_DIR}\n"

vimi_backup: mkbackupdir prepare_vimi_backup
	@test ! -e ~/.${VIM_DIR} || \
	(\
		mv ~/.${VIM_DIR} ~/${BACKUP_PREFIX}/${VIM_DIR}; \
		echo "Vimi makes backup of your current ~/.${VIM_DIR} directory to ~/${BACKUP_PREFIX}/${VIM_DIR}\n" \
	)
	@test ! -e ~/.${VIMRC} || \
	(\
		mv ~/.${VIMRC} ~/${BACKUP_PREFIX}/${VIMRC}; \
		echo "Vimi makes backup of your current ~/.${VIMRC} to ~/${BACKUP_PREFIX}/${VIMRC}\n" \
	)

prepare_vimi_backup:
	@test ! -e ~/${BACKUP_PREFIX}/${VIM_DIR} || \
	rm -fr ~/${BACKUP_PREFIX}/${VIM_DIR}
	@test ! -e ~/${BACKUP_PREFIX}/${VIMRC} || \
	rm -fr ~/${BACKUP_PREFIX}/${VIMRC}

vundle:
	@test ! -e ${VIMI_DIR}/${VIM_DIR}/${VUNDLE_DIR} || \
	rm -rf ${VIMI_DIR}/${VIM_DIR}/${VUNDLE_DIR}

	@echo "Clone Vundle from github.com..."
	@git clone git://github.com/gmarik/vundle.git ${VIMI_DIR}/${VIM_DIR}/${VUNDLE_DIR} > /dev/null
	@echo "Done.\n"

dotfiles: dotfiles_backup
	@echo "Creating dotfiles symlinks..."
	@test -d ~/.${SSH_DIR} || \
	(\
		mkdir ~/.${SSH_DIR}; \
		chmod 700 ~/.${SSH_DIR} \
	)
	@ln -s ${DOTFILES_DIR}/${SSH_DIR}/${SSH} ~/.${SSH_DIR}/${SSH}
	@ln -s ${DOTFILES_DIR}/${TMUX} ~/.${TMUX}
	@ln -s ${DOTFILES_DIR}/${GIT}  ~/.${GIT}
	@ln -s ${DOTFILES_DIR}/${BASH} ~/.${BASH}

dotfiles_backup: mkbackupdir prepare_dotfiles_backup
	@echo "Backup your config files..."
	@test ! -e ~/.${SSH_DIR}/${SSH} || \
	(\
		mkdir ~/${BACKUP_PREFIX}/${SSH_DIR}; \
		mv ~/.${SSH_DIR}/${SSH} ~/${BACKUP_PREFIX}/${SSH_DIR}/${SSH}; \
		echo "making backup of your current ~/.${SSH_DIR}/${SSH} config to ~/${BACKUP_PREFIX}/${SSH_DIR}/${SSH}\n" \
	)
	@test ! -e ~/.${TMUX} || \
	(\
		mv ~/.${TMUX} ~/${BACKUP_PREFIX}/${TMUX}; \
		echo "making backup of your current ~/.${TMUX} config to ~/${BACKUP_PREFIX}/${TMUX}\n" \
	)
	@test ! -e ~/.${GIT} || \
	(\
		mv ~/.${GIT} ~/${BACKUP_PREFIX}/${GIT}; \
		echo "making backup of your current ~/.${GIT} config to ~/${BACKUP_PREFIX}/${GIT}\n" \
	)
	@test ! -e ~/.${BASH} || \
	(\
		mv ~/.${BASH} ~/${BACKUP_PREFIX}/${BASH}; \
		echo "making backup of your current ~/.${BASH} config to ~/${BACKUP_PREFIX}/${BASH}\n" \
	)

prepare_dotfiles_backup:
	@test ! -e ~/${BACKUP_PREFIX}/${SSH_DIR} || \
	rm -fr ~/${BACKUP_PREFIX}/${SSH_DIR}
	@test ! -e ~/${BACKUP_PREFIX}/${TMUX} || \
	rm -fr ~/${BACKUP_PREFIX}/${TMUX}
	@test ! -e ~/${BACKUP_PREFIX}/${GIT} || \
	rm -fr ~/${BACKUP_PREFIX}/${GIT}
	@test ! -e ~/${BACKUP_PREFIX}/${BASH} || \
	rm -fr ~/${BACKUP_PREFIX}/${BASH}

mkbackupdir:
	@test -d ~/${BACKUP_PREFIX} || mkdir ~/${BACKUP_PREFIX}
	@echo "Making backup dir..."

ubuntu: rename_default_dirs make_look
	@echo "Your default home dirs was renamed"

rename_default_dirs:
	@mv ~/Видео ~/video
	@mv ~/Документы ~/docs
	@mv ~/Загрузки ~/downloads
	@mv ~/Изображения ~/images
	@mv ~/Музыка ~/music
	@mv ~/Общедоступные ~/share
	@mv ~/Шаблоны ~/templates
	@cp ~/.dotfiles/ubuntu/config/user-dirs.dirs ~/.config/user-dirs.dirs
	@cp ~/.gtk-bookmarks ~/${BACKUP_PREFIX}/gtk-bookmarks
	@cp ${DOTFILES_DIR}/ubuntu/gtk-bookmarks ~/.gtk-bookmarks

make_look:
	@test -d ~/.themes || mkdir ~/.themes
	@tar -xf ${DOTFILES_DIR}/ubuntu/numix-theme.tgz ~/.themes/
	@test -d ~/.icons  || mkdir ~/.icons
	@tar -xf ${DOTFILES_DIR}/ubuntu/elementary-icons.tgz ~/.icons/
	@sudo cp ${DOTFILES_DIR}/ubuntu/Blueprint.jpg /usr/share/backgrounds/Blueprint.jpg
	@sh ${DOTFILES_DIR}/ubuntu/gsettings

fonts:
	@echo "Set up patched fonts..."
	@test -d ~/.fonts || mkdir ~/.fonts
	@cp ${DOTFILES_DIR}/ubuntu/fonts/* ~/.fonts/
	@fc-cache -vf ~/.fonts/


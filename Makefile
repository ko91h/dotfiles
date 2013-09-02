VIMI_DIR = ~/.dotfiles/vimi
VIMRC = vimrc
VUNDLE_DIR = bundle/vundle
BACKUP_PREFIX = .vimi.bak
VIM_DIR = vim

vimi: echostart bundle-install
	@echo "\nVimi successfully installed.\nRun Vim and write something awesome."

echostart:
	@echo "Start installing Vimi...\n"

bundle-install: symlinks vundle
	-vim +BundleInstall +quitall

symlinks: backup
	@ln -s $(VIMI_DIR)/$(VIMRC) ~/.$(VIMRC) && \
	ln -s $(VIMI_DIR)/$(VIM_DIR) ~/.$(VIM_DIR) && \
	echo "Create symlinks:\n~/.$(VIMRC) -> $(VIMI_DIR)/$(VIMRC)\n~/.$(VIM_DIR) -> $(VIMI_DIR)/$(VIM_DIR)\n"

backup: remove-prev-backup
	@test ! -e ~/.$(VIM_DIR) || \
	(\
		mv ~/.$(VIM_DIR) ~/.$(VIM_DIR)$(BACKUP_PREFIX); \
		echo "Vimi makes backup of your current ~/.$(VIM_DIR) directory to ~/.$(VIM_DIR)$(BACKUP_PREFIX)\n" \
	)

	@test ! -e ~/.vimrc || \
	( \
		mv ~/.$(VIMRC) ~/.$(VIMRC)$(BACKUP_PREFIX); \
		echo "Vimi makes backup of your current ~/.$(VIMRC) to ~/.$(VIMRC)$(BACKUP_PREFIX)\n" \
	)

remove-prev-backup:
	@test ! -e ~/.$(VIM_DIR)$(BACKUP_PREFIX) || \
	rm -fr ~/.$(VIM_DIR)$(BACKUP_PREFIX)

	@test ! -e ~/.$(VIMRC)$(BACKUP_PREFIX) || \
	rm -f ~/.$(VIMRC)$(BACKUP_PREFIX)

vundle:
	@test ! -e $(VIMI_DIR)/$(VIM_DIR)/$(VUNDLE_DIR) || \
	rm -rf $(VIMI_DIR)/$(VIM_DIR)/$(VUNDLE_DIR)

	@echo "Clone Vundle from github.com..."
	@git clone git://github.com/gmarik/vundle.git $(VIMI_DIR)/$(VIM_DIR)/$(VUNDLE_DIR) > /dev/null
	@echo "Done.\n"

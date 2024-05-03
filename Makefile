dotfiles := asdfrc tmate.conf tmux.conf tmux-tmate.conf vimrc zlogin zlogout zpreztorc zprofile zshenv zshrc vim asdf prezto

TARGETS := $(dotfiles:%=$(HOME)/.%)
CWD := $(shell pwd)

# Symlink pattern rule for both files and directories
$(HOME)/.%: %
	@if [ -d $(CWD)/$< ]; then \
		echo "Linking directory $< to $@"; \
		if [ -e $@ ]; then mv $@ $@.bak; fi; \
		ln -sfn $(CWD)/$< $@; \
	elif [ -f $(CWD)/$< ]; then \
		echo "Linking file $< to $@"; \
		if [ -e $@ ]; then mv $@ $@.bak; fi; \
		ln -sfn $(CWD)/$< $@; \
	fi

# Main targets
install: $(TARGETS)
	bash config
	bash osx

uninstall:
	@echo "Removing linked files and directories..."
	@rm -rf $(TARGETS)

update:
	bash config
	bash osx

.PHONY: install uninstall update

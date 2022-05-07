.PHONY: all
all:
	@stow --verbose --target=$$HOME --restow --dir=HOME tmux
	@stow --verbose --target=$$HOME --restow --dir=HOME bash

macos:
	./setup.sh

get-gpg-key:
	  gpg --armor --export $$(gpg --list-secret-keys --keyid-format LONG | awk 'FNR==3{print $$2}' | cut -d/ -f2) | pbcopy

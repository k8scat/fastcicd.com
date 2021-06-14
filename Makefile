HUGO = hugo
GIT = git
PORT = 6664

POST =

dev:
	$(HUGO) server -D --port $(PORT) --bind 0.0.0.0

build: update-submodule
	$(HUGO) --buildDrafts --gc --verbose --minify

update-submodule: download-submodule
	$(GIT) submodule update --remote --merge

download-submodule:
	$(GIT) submodule update --init --recursive

new:
ifneq "$(POST)" ""
	$(HUGO) new posts/$(POST).md
else
	@echo "usage: make new POST=post_name"
endif

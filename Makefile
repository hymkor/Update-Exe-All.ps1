ifeq ($(OS),Windows_NT)
    SHELL=CMD.EXE
    DEL=del
    NUL=nul
else
    DEL=rm
    NUL=/dev/null
endif

NAME:=$(notdir $(CURDIR))
VERSION:=$(shell git describe --tags 2>$(NUL) || echo v0.0.0)
dist:
	zip -9 $(NAME)-$(VERSION).zip $(NAME)

clean:
	$(DEL) $(NAME)-*.zip

manifest:
	make-scoop-manifest -binpattern "*.ps1" -anycpu $(NAME)-*.zip > $(NAME).json

release:
	gh release create -d --notes "" -t $(VERSION) $(VERSION) $(wildcard $(NAME)-$(VERSION)*.zip)

.PHONY: all test dist _dist clean manifest release

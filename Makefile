.PHONY: help themes html serve clean
.DEFAULT_GOAL := help

help:
	@grep ": ##" Makefile | grep -v grep | tr -d '#'

themes/scientific-python-hugo-theme:
	@if [ ! -d "$<" ]; then \
	  echo "*** ERROR: missing theme" ; \
	  echo ; \
	  echo "It looks as though you are missing the themes directory."; \
	  echo "You need to add the scientific-python-hugo-theme as a submodule."; \
	  echo ; \
	  echo "Please see https://theme.scientific-python.org/getstarted/"; \
	  echo ; \
	  exit 1; \
	fi

themes: themes/scientific-python-hugo-theme

html: ## Build site in `./public`
html: themes
	hugo

serve: ## Serve site, typically on http://localhost:1313
serve: themes
	@hugo --i18n-warnings server

clean: ## Remove built files
clean:
	rm -rf public

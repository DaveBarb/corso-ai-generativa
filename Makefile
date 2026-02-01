.PHONY: install serve build clean

install:
	pip install -r requirements.txt

serve:
	mkdocs serve

build:
	mkdocs build

clean:
	rm -rf site/

deploy:
	mkdocs gh-deploy

BUILD = build
BOOKNAME = hivemed
BROWSER = google-chrome
TITLE = title.md
METADATA = metadata.xml
CHAPTERDIR = chapters
CHAPTERS = $(CHAPTERDIR)/001-sympdiag.md $(CHAPTERDIR)/002-diagalg.md
TOC = --toc --toc-depth=2
COVER_IMAGE = images/caduceus.png
LATEX_CLASS = report

all: book

book: epub html pdf

clean:
	rm -fr $(BUILD)/epub
	rm -fr $(BUILD)/html/*
	rm -fr $(BUILD)/pdf

epub: $(BUILD)/epub/$(BOOKNAME).epub

html: $(BUILD)/html/$(BOOKNAME).html

pdf: $(BUILD)/pdf/$(BOOKNAME).pdf

$(BUILD)/epub/$(BOOKNAME).epub: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/epub
	pandoc $(TOC) -S --epub-metadata=$(METADATA) --epub-cover-image=$(COVER_IMAGE) -o $@ $^

$(BUILD)/html/$(BOOKNAME).html: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/html
	mkdir -p $(BUILD)/html/assets
	cp assets/* $(BUILD)/html/assets
	pandoc $(TOC) --standalone --to=html5 --template templates/template.html --css assets/template.css -o $@ $^
	ln -fs $(BOOKNAME).html $(BUILD)/html/index.html

$(BUILD)/pdf/$(BOOKNAME).pdf: $(TITLE) $(CHAPTERS)
	mkdir -p $(BUILD)/pdf
	pandoc $(TOC) --latex-engine=xelatex -V documentclass=$(LATEX_CLASS) -o $@ $^

preview: html
	$(BROWSER) $(BUILD)/html/$(BOOKNAME).html

gh-pages: html
	./deploy-gh-pages.sh

.PHONY: all book clean epub html pdf preview gh-pages

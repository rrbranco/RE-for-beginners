all:    RU EN DE FR

clean:
	rm -f *.aux
	rm -f *.fls
	rm -f *.swp
	rm -f *.pdf
	rm -f *.out
	rm -f *.toc
	rm -f *.stackdump
	rm -f *.bbl
	rm -f *.blg
	rm -f *.fdb_latexmk
	rm -f *.idx
	rm -f *.ilg
	rm -f *.ind
	rm -f *.html
	rm -f *.tmp
	rm -f *-2k
	rm -f *.4ct
	rm -f *.4tc
	rm -f *.dvi
	rm -f *.glg
	rm -f *.glo
	rm -f *.gls
	rm -f *.idv
	rm -f *.ist
	rm -f *.xref
	rm -f *.torrent
	rm -f RE_for_beginners-*.log
	rm -f Reverse_Engineering_for_Beginners-*.log
	rm -f RE4B-*.log
	rm -f *~
	rm -f *.log
	rm -f *.lyx
	rm -f *.ni
	rm -f *.odt
	rm -f *.rtf

# there are two xelatex invocations at the end, because \myref{} doesn't show pages correctly otherwise
define compile
	rm -f *.fls
	rm -f *.bbl
	rm -f *.aux
	xelatex $1
	makeindex $1
	makeglossaries $1
	xelatex $1
	xelatex $1
endef

RU:
	$(call compile,RE4B-RU)

EN:
	$(call compile,RE4B-EN)

ES:
	$(call compile,RE4B-ES)

PTBR:	
	$(call compile,RE4B-PTBR)

PL:
	$(call compile,RE4B-PL)

IT:
	$(call compile,RE4B-IT)

DE:
	$(call compile,RE4B-DE)

TH:
	$(call compile,RE4B-TH)

NL:
	$(call compile,RE4B-NL)

FR:
	$(call compile,RE4B-FR)


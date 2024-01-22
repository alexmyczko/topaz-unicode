all: topaz_unicode_ks13_regular.bdf topaz_unicode_ks13_bold.bdf

topaz_unicode_ks13_regular.bdf: src/regular-glyphs.bdf src/regular-metadata.bdf
	bdflib-merge $^ $@

tmp/bold-%.bdf: src/regular-%.bdf
	bdflib-embolden --ignore-spacing $^ $@

topaz_unicode_ks13_bold.bdf: tmp/bold-glyphs.bdf src/bold-metadata.bdf
	bdflib-merge $^ $@

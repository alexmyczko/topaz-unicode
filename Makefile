all: topaz_unicode_ks13_regular.bdf topaz_unicode_ks13_bold.bdf

topaz_unicode_ks13_regular.bdf: regular-glyphs.bdf regular-metadata.bdf
	bdflib-merge $^ $@

bold-glyphs.bdf: regular-glyphs.bdf
	bdflib-embolden --ignore-spacing $^ $@

topaz_unicode_ks13_bold.bdf: bold-glyphs.bdf bold-metadata.bdf
	bdflib-merge $^ $@

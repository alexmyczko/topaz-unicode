all: topaz_unicode_ks13_regular.ttf topaz_unicode_ks13_bold.ttf

tmp/topaz_unicode_ks13_regular.bdf: src/regular-glyphs.bdf src/regular-metadata.bdf
	bdflib-merge $^ $@

tmp/bold-%.bdf: src/regular-%.bdf
	bdflib-embolden --ignore-spacing $^ $@

tmp/topaz_unicode_ks13_bold.bdf: tmp/bold-glyphs.bdf src/bold-metadata.bdf
	bdflib-merge $^ $@

%.ttf: tmp/%.bdf
	java -jar BitsNPicas.jar convertbitmap -o $@ -f ttf $<

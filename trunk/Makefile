#!/usr/bin/make -f


all:
	@ echo
	@ echo "Possible targets:"
	@ echo
	@ echo "  * distribution - prepares gzipped tar file"
	@ echo

distribution:
	tar czvf soluble_adhesion_markers.tar.gz soluble_adhesion_markers.html soluble_adhesion_markers.php soluble_adhesion_markers.xml soluble.xsd soluble.xsl

.PHONY: distribution


SPEXS_OPTIONS=-cf stransmem.charclass -max_gap_nr 1 -wildcards 3 -goodratio 4 -showratio 4 -minstrings 5 -maxgrp 5
patterns: adam10.vs.adam17.spexs
adam10.vs.adam17.spexs: adam10.complete.fasta adam17.complete.fasta
	spexs -f adam10.complete.fasta -f adam17.complete.fasta \
		$(SPEXS_OPTIONS)  > adam10.vs.adam17.spexs

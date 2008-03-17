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

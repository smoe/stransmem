<?php
	$parser = xslt_create();
	$html = xslt_process($parser,'soluble_adhesion_markers.xml','soluble.xsl');
	xslt_free($parser);
	echo $html;
?>

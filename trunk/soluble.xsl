<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:sol="http://master.dermacloud.uni-luebeck.de/~moeller/stransmem"
>
 <xsl:output method="html" encoding="ISO-8859-1"/>
 <xsl:template match="/" >
 <html>
   <head>
    <title>Soluble variants</title>
    <META NAME="description" CONTENT="Portal and reference of soluble variants of transmembrane proteins presumed relevant for autoimmune diseases and associated proteins." />
    <META NAME="keywords" CONTENT="soluble,adhesion,markers,marker,surface,protein,proteins,ICAM,VCAM,selectin,autoimmune,immune,disease,diseases,convertase,convertases,shed,shedding,metallo,protease,proteases,metalloproteases,SolubleMaker,prediction" />
   </head>
   <body>
    <h1 align="center">Soluble variants of membrane proteins</h1>
    <p>
    This work is described in a <a href="http://www.bioinfo.de/isb/2005/05/0028/">paper</a>
    that recently appeared in In Silico Biology.
    </p>
    <h2><a href="soluble_maker.pl.gz">SolubleMaker</a>: Predicted soluble variants from UniProt</h2>
    <p>
    In order to determine soluble variants in your local set of
    mass spectra please consider to feed your peptide identification
    tool with the sequences derived from the tool
    <a href="soluble_maker.pl.gz">soluble_maker.pl</a>.
    It cleaves the protein sequence before or after the transmembrane
    region in dependence of the sidedness of the insertion into the
    membrane. The tool can be used to return the extracellular or the
    intracellular products of the cleavage.
    </p>
    <h2><a href="soluble_variants_of_membrane_proteins/">Predicted soluble splice-variants of transmembrane proteins</a></h2>
    <p>
    A program available for download <a href="soluble_variants_of_membrane_proteins/human.pl.gz">here</a> created the <a
    href="soluble_variants_of_membrane_proteins/">following list</a>
    of putative soluble splice-variants of proteins predicted to be
    transmembrane.
    </p>

     <xsl:apply-templates />

    <p>
    Please also see:
    <ul>
      <li><a href="activity.xml">Activity</a>- measurable effects of these inhibitors</li>
      <li><a href="modulators.xml">Modulators</a> of these biological processes/functions</li>
    </ul>
    </p>

    <h2>Acknowledgements</h2>
    Dr. Harald Illges is thanked for his contribution to sCD21, Dr. Dr. Eilhard Mix is thanked for a couple of entries he initiated. Dr. Melissa Cline is thanked for her pointer to the related work in Chris Lee's group. 
    Them all, Dr. Saleh Ibrahim and Prof. Dr. Gudrun Brockmann is thanked for their positive and stimulating feedback.
    <hr/>
    <a href="http://www.inb.uni-luebeck.de/">Steffen Moeller</a>

    <a href="mailto:steffen.moeller@uksh.de">steffen.moeller@uksh.de</a><br/>
    <small>
    <a href="http://www.derma.uni-luebeck.de">Dermatology, Luebeck, Germany</a>
    </small><br/>
    This page lives at: <a href="http://master.dermacloud.uni-luebeck.de/~moeller/stransmem/soluble_adhesion_markers.xml">http://bioinformatics.pzr.uni-rostock.de/~moeller/soluble_adhesion_markers.xml</a>
   </body>
  </html>
 </xsl:template>

 <xsl:template match="sol:variantlist">
    <h2>List of Variants</h2>
    <table width="80%" border="1" cellpadding="2" align="center" >
    <tr bgcolor="orange"><th>Gene / Gene Product</th><th>References</th></tr>
    <xsl:apply-templates select="sol:variant"/>
    </table>
 
</xsl:template>
 	<!-- <xsl:if test="not($uniprot='none')&$empty_string=$uniprot">  -->

 <xsl:template match="sol:variant">
  <xsl:variable name="uniprot" select="@UniProt" />
  <xsl:variable name="shedby" select="@shedBy" />
  <xsl:variable name="notshedby" select="@notshedBy" />
  <xsl:variable name="shedgroup" select="@shedGroup" />
  <tr>
      <td bgcolor="yellow" valign="top">
  	<xsl:value-of select="@gene" />
	<a name="{$uniprot}" />
	<xsl:variable name="empty_string" select="''" />
	<br/>	
	<small>
 	<xsl:if test="$empty_string!=$uniprot"> 
		<a href="http://www.expasy.org/cgi-bin/niceprot.pl?{$uniprot}">UniProt</a><br/>
		<a href="http://www.pdg.cnb.uam.es/UniPub/iHOP/in?dbrefs_1=SWISSPROT__AC|{$uniprot}">iHOP</a>
	</xsl:if>  
	<xsl:if test="$empty_string!=$shedby">
		<br />
		shedBy: <xsl:value-of select="@shedBy" />
	</xsl:if> 	
	<xsl:if test="$empty_string!=$shedgroup">
		(<a href="{$shedgroup}"><xsl:value-of select="@shedGroup" /></a>)
	</xsl:if> 	
	<xsl:if test="$empty_string!=$notshedby">
		<br />
		Not shedBy: <xsl:value-of select="@notshedBy" /> 
	</xsl:if>
        </small>
      </td>
      <td>
	<table cellpadding="5">
          <xsl:apply-templates select="sol:reference"/>
	</table>
      </td>
  </tr>
  </xsl:template>    

 <xsl:template match="sol:reference">
  <xsl:variable name="url" select="@href" />
  <tr>
   <td>
      <xsl:variable name="type" select="@type" />
      <xsl:choose> 
       <xsl:when test="'pubmed'=$type"> 
        <xsl:variable name="pmid" select="@pmid" />
    	<a href='http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&amp;db=pubmed&amp;dopt=Abstract&amp;list_uids={$pmid}'>
        <xsl:value-of select="@title" /></a> (<xsl:value-of select="@year" />)
       </xsl:when>
       <xsl:when test="'personal-communication'=$type">
  <xsl:variable name="name" select="@name" />
  <xsl:variable name="email" select="@email" />
	  Communicated by <xsl:value-of select="@name" />
	  (<i><xsl:value-of select="@email" /></i>)
       </xsl:when>
       <xsl:otherwise>
         <a href="{$url}">
         <xsl:value-of select="@title" /></a>
       </xsl:otherwise>
      </xsl:choose>
   </td>
  </tr>
 </xsl:template>
</xsl:stylesheet>

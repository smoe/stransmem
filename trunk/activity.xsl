<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:sol="http://master.dermacloud.uni-luebeck.de/~moeller/stransmem"
>
 <xsl:output method="html" encoding="ISO-8859-1"/>
 <xsl:template match="/" >
 <html>
   <head>
    <title>Groups of shedding enzymes of membrane proteins</title>
    <META NAME="description" CONTENT="Portal and reference of soluble variants of transmembrane proteins presumed relevant for autoimmune diseases and associated proteins." />
    <META NAME="keywords" CONTENT="soluble,adhesion,markers,marker,surface,protein,proteins,ICAM,VCAM,selectin,autoimmune,immune,disease,diseases,convertase,convertases,shed,shedding,metallo,protease,proteases,metalloproteases,SolubleMaker,prediction" />
   </head>
   <body>
    <h1 align="center">Groups of proteins affected by a modulatory compound</h1>

    Particularly so for the ADAM family of metalloproteinases one knows about
    subgroups of sheddases that are affected by individual compounds. Those
    chemical modulators are listed <a href="modulators.xml">separately</a>.
    The table with modulators may reference this table, which again may
    reference those proteins that one knows to be directly affected by the
    compound. The original motivation was to cluster sheddases together.
     <xsl:apply-templates />

    Please also see:
    <ul>
      <li /><a href="modulators.xml">Modulators</a> of these biological processes/functions
      <li /><a href="soluble_adhesion_markers.xml">Soluble Adhesion Markers</a>
    </ul>

    <h2>Acknowledgements</h2>
    This work was supported by the DFG Graduate College "<a href="http://www.genes-environment-inflammation.de/">Genes Environment Inflammation</a>".
    <hr/>
Steffen M&#246;ller <a href="mailto:steffen.moeller@uksh.de">steffen.moeller@uksh.de</a><br/> <small><a href="http://www.derma.uni-luebeck.de">Dermatology, L&#252;beck, Germany</a></small>
<br />
Karina Rei&#223; and coworkers <a href="mailto:steffen.moeller@uksh.de">karina.reiss@uksh.de</a><br/> <small><a href="http://www.derma.uni-kiel.de">Dermatology, Kiel, Germany</a></small>
    <br/>
    This page lives at <a href="http://code.google.com/p/stransmem/">http://code.google.com/p/stransmem/</a>.
   </body>
  </html>
 </xsl:template>

 <xsl:template match="sol:activitygrouplist">
    <h2>Groups of Effects</h2>
    <table width="80%" border="1" cellpadding="2" align="center" >
    <tr bgcolor="orange"><th>Group</th><th>Members</th><th>Subgroup</th></tr>
    <xsl:apply-templates select="sol:activitygroup"/>
    </table>
 </xsl:template>
 	<!-- <xsl:if test="not($uniprot='none')&$empty_string=$uniprot">  -->

 <xsl:template match="sol:activitygroup">
  <xsl:variable name="name" select="@name" />
  <xsl:variable name="wikipedia" select="@wikipedia" />
  <xsl:variable name="empty_string" select="''" />
  <tr>
      <td bgcolor="yellow" valign="top">
  	<xsl:value-of select="@name" />
	<a name="{$name}" />

	<xsl:if test="$empty_string!=$wikipedia">
	 wikipedia: 
	 <xsl:element name="a">
	   <xsl:attribute name="href">
	      <xsl:value-of select="concat('http://en.wikipedia.org/wiki/',$wikipedia)" />
	   </xsl:attribute>
	   <xsl:value-of select="@wikipedia" /> 
	 </xsl:element>
	 <br />
	</xsl:if>

      </td>
      <td>
         <xsl:apply-templates select="sol:activity"/>
      </td>
      <td>
         <xsl:apply-templates select="sol:activitysubgroup"/>
      </td>
  </tr>
 </xsl:template>    

 <xsl:template match="sol:activity">
  <xsl:variable name="empty_string" select="''" />
  <xsl:variable name="spid" select="@spid" />
  <xsl:variable name="uniprot" select="@uniprot" />
  <xsl:value-of select="@name" />
  <xsl:if test="$empty_string!=$spid or $empty_string!=$uniprot">
  </xsl:if>
  <xsl:if test="$empty_string!=$spid">
  	; spid: <xsl:value-of select="@spid" /> 
  </xsl:if>
  <xsl:if test="$empty_string!=$uniprot">
  	; uniprot:
	 <xsl:element name="a">
	  <xsl:attribute name="href">
	   <xsl:value-of select="concat('http://www.uniprot.org/uniprot/',$uniprot)" />
	  </xsl:attribute>
	  <xsl:value-of select="@uniprot" /> 
	 </xsl:element>
  </xsl:if>
  <br />
 </xsl:template>

 <xsl:template match="sol:activitysubgroup">
  <xsl:variable name="empty_string" select="''" />
  <xsl:variable name="name" select="@name" />
  <xsl:element name="a">
   <xsl:attribute name="href">
    <xsl:value-of select="concat('http:activity.xml#',$name)" />
   </xsl:attribute>
   <xsl:value-of select="@name" /> 
  </xsl:element>
  <br />
 </xsl:template>


</xsl:stylesheet>

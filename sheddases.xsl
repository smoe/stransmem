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
    <h1 align="center">Groups of shedding enzymes of membrane proteins</h1>

    Technically, this collects is to allow cross-references to sheddases
    <ul>
     <li>from a protein that may be cleaved by more than a single protease
     <li>from biochemical compound lists
    </ul>

     <xsl:apply-templates />

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

 <xsl:template match="sol:targetgrouplist">
    <h2>Groups of Sheddases</h2>
    <table width="80%" border="1" cellpadding="2" align="center" >
    <tr bgcolor="orange"><th>Group</th><th>Members</th></tr>
    <xsl:apply-templates select="sol:targetgroup"/>
    </table>
 </xsl:template>
 	<!-- <xsl:if test="not($uniprot='none')&$empty_string=$uniprot">  -->

 <xsl:template match="sol:targetgroup">
  <xsl:variable name="name" select="@name" />
  <xsl:variable name="empty_string" select="''" />
  <tr>
      <td bgcolor="yellow" valign="top">
  	<xsl:value-of select="@name" />
      </td>
      <td>
         <xsl:apply-templates select="sol:sheddase"/>
         <xsl:apply-templates select="sol:targetsubgroup"/>
      </td>
  </tr>
  </xsl:template>    

 <xsl:template match="sol:sheddase">
  <xsl:variable name="empty_string" select="''" />
  <xsl:variable name="spid" select="@spid" />
  <xsl:variable name="uniprot" select="@uniprot" />
  <xsl:value-of select="@name">
  <xsl:if test="$empty_string!=$spid or $empty_string!=$uniprot">
  	<br />
  </xsl:if>
  
  <xsl:if test="$empty_string!=$spid">
  	spid:<xsl:value-of select="@spid" /> 
  </xsl:if>
  <xsl:if test="$empty_string!=$uniprot">
  	uniprot:<xsl:value-of select="@uniprot" /> 
  </xsl:if>
 </xsl:template>

 <xsl:template match="sol:targetsubgroup">
  <xsl:variable name="empty_string" select="''" />
  <xsl:variable name="name" select="@name" />
  <br /><xsl:value-of select="@name">
 </xsl:template>


</xsl:stylesheet>

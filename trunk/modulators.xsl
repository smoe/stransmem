<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:sol="http://master.dermacloud.uni-luebeck.de/~moeller/stransmem"
>
 <xsl:output method="html" encoding="ISO-8859-1"/>
 <xsl:template match="/" >
 <html>
   <head>
    <title>Modulators of solubility of membrane proteins</title>
    <META NAME="description" CONTENT="Portal and reference of soluble variants of transmembrane proteins presumed relevant for autoimmune diseases and associated proteins." />
    <META NAME="keywords" CONTENT="soluble,adhesion,markers,marker,surface,protein,proteins,ICAM,VCAM,selectin,autoimmune,immune,disease,diseases,convertase,convertases,shed,shedding,metallo,protease,proteases,metalloproteases,SolubleMaker,prediction" />
   </head>
   <body>
    <h1 align="center">Modulators of solubility of membrane proteins</h1>

    This table summarises current techniques to inhibit or activate shedding enzymes. Those compounds may possibly not be given alone but in combination with others that act e.g. as cofactors to see differences between activated and non-activated sheddases.

     <xsl:apply-templates />

    <h2>Acknowledgements</h2>
    <hr/>
Steffen Moeller <a href="mailto:steffen.moeller@uksh.de">steffen.moeller@uksh.de</a><br/> <small> <a href="http://www.derma.uni-luebeck.de">Dermatology, Luebeck, Germany</a>
    </small><br/>
    This page lives at <a href="http://code.google.com/p/stransmem/">http://code.google.com/p/stransmem/</a>.
   </body>
  </html>
 </xsl:template>

 <xsl:template match="sol:modulatorlist">
    <h2>List of Modulators</h2>
    <table width="80%" border="1" cellpadding="2" align="center" >
    <tr bgcolor="orange"><th>Modulator</th><th>Target</th><th>References</th></tr>
    <xsl:apply-templates select="sol:variant"/>
    </table>
 
 </xsl:template>
 	<!-- <xsl:if test="not($uniprot='none')&$empty_string=$uniprot">  -->

 <xsl:template match="sol:modulator">
  <xsl:variable name="name" select="@name" />
  <xsl:variable name="targetgroup" select="@targetgroup" />
  <tr>
      <td bgcolor="yellow" valign="top">
  	<xsl:value-of select="@name" />
      </td>
      <td>
  	<xsl:value-of select="@targetgroup" />
      </td>
  </tr>
  </xsl:template>    

</xsl:stylesheet>

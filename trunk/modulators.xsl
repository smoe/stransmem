<xsl:stylesheet version='1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	xmlns:fn='http://www.w3.org/2005/xpath-functions'
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
    <p>
    This table summarises current techniques to inhibit or activate
    shedding enzymes. Those compounds may possibly not be given alone
    but in combination with others that act e.g. as cofactors to see
    differences between activated and non-activated sheddases.
    </p>

     <xsl:apply-templates />
    <p>
    Please also see:
    <ul>
      <li><a href="activity.xml">Activity</a> - measurable effects of these inhibitors</li>
      <li><a href="soluble_adhesion_markers.xml">Soluble Adhesion Markers - transmembrane proteins with known soluble variants</a></li>
    </ul>
    </p>

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

 <xsl:template match="sol:modulatorlist">
    <h2>List of Modulators</h2>
    <table width="80%" border="1" cellpadding="2" align="center" >
    <tr bgcolor="orange"><th>Modulator</th><th>Target Group<br />(effect)</th><th>Protocol</th><th>Source</th></tr>
    <xsl:apply-templates select="sol:modulator"/>
    </table>
 
 </xsl:template>
 	<!-- <xsl:if test="not($uniprot='none')&$empty_string=$uniprot">  -->

 <xsl:template match="sol:modulator">
  <xsl:variable name="long" select="@long" />
  <xsl:variable name="short" select="@short" />
  <xsl:variable name="activitygroup" select="@activitygroup" />
  <xsl:variable name="effect" select="@effect" />
  <xsl:variable name="concentration" select="@concentration" />
  <xsl:variable name="incubationtime" select="@incubationtime" />
  <xsl:variable name="wikipedia" select="@wikipedia" />
  <xsl:variable name="empty_string" select="''" />
  <tr>
      <td bgcolor="yellow" valign="top">
  	<xsl:value-of select="@long" />
	<a name="{$long}" />
	<xsl:if test="$empty_string!=$short">
		(<xsl:value-of select="@short" />)
	</xsl:if>

	<xsl:if test="$empty_string!=$wikipedia">
	 <br />wikipedia:<xsl:element name="a">
	   <xsl:attribute name="href">
	      <xsl:value-of select="concat('http://en.wikipedia.org/wiki/',$wikipedia)" />
	   </xsl:attribute>
	   <xsl:value-of select="@wikipedia" /> 
	 </xsl:element>
	 <br />
	</xsl:if>

      </td>
      <td>
	<xsl:if test="$empty_string!=$activitygroup">
	 <xsl:element name="a">
	  <xsl:attribute name="href">
	   <xsl:value-of select="concat('http:activity.xml#',$activitygroup)" />
	  </xsl:attribute>
  	  <xsl:value-of select="@activitygroup" />
	 </xsl:element>
	 <br />
	</xsl:if>
	<xsl:if test="$empty_string!=$effect">
  	 (<xsl:value-of select="@effect" />)
	</xsl:if>
      </td>
      <td>
	<xsl:if test="$empty_string!=$concentration">
		Concentration: <xsl:value-of select="@concentration" /> 
	</xsl:if>
	<xsl:if test="$empty_string!=$concentration">
		<br />
		Incubation time: <xsl:value-of select="@incubationtime" /> 
	</xsl:if>
      </td>
      <td>
         <xsl:apply-templates select="sol:modulatorsource"/>
         <xsl:apply-templates select="sol:labroutine"/>
      </td>
  </tr>
  </xsl:template>    

 <xsl:template match="sol:modulatorsource">
  <xsl:variable name="empty_string" select="''" />
  <xsl:variable name="concentration" select="@concentration" />
  <xsl:variable name="dillute" select="@dillute" />
  <xsl:variable name="solvent" select="@solvent" />
  <xsl:variable name="vendor" select="@vendor" />
  <xsl:variable name="id" select="@id" />
  <xsl:variable name="labroutine" select="@labroutine" />
  <xsl:variable name="url" select="@url" />
  <xsl:if test="$empty_string!=$concentration">
  	Concentration: <xsl:value-of select="@concentration" /> 
  </xsl:if>
  <xsl:if test="$empty_string!=$dillute">
  	<br />
  	Dillute: <xsl:value-of select="@dillute" /> 
  </xsl:if>
  <xsl:if test="$empty_string!=$solvent">
  	<br />
  	Solvent: <xsl:value-of select="@solvent" /> 
  </xsl:if>
  <xsl:choose>
      <xsl:when test="$empty_string!=$vendor and $empty_string!=$id">
  	<br />
  	Vendor: <xsl:value-of select="@vendor" /> 
      </xsl:when>
      <xsl:otherwise>
         <xsl:if test="$empty_string!=$id">
  	       <br />
         	ID: <xsl:value-of select="@id" /> 
         </xsl:if>
      </xsl:otherwise>
  </xsl:choose>
  <xsl:if test="$empty_string!=$labroutine">
       <br />
    	Routine: <xsl:value-of select="@labroutine" /> 
  </xsl:if>
 </xsl:template>


</xsl:stylesheet>

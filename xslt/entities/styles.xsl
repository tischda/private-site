<xsl:template name="stylesheet" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<link type="text/css" rel="stylesheet">
		<xsl:attribute name="href"><xsl:value-of select="@src" /></xsl:attribute>
		<xsl:apply-templates select="@media" />
		<xsl:apply-templates select="@title" />
  </link>
</xsl:template>


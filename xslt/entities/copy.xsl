<xsl:template match="@*|node()" priority="-1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:copy>
         <xsl:apply-templates select="@*|node()" />
     </xsl:copy>
</xsl:template>
<xsl:template match="nox:section" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:choose>
  <!-- sometimes we need wrapper DIVs with unique IDs, e.g. for RSS feeds -->
  <xsl:when test="@id">
    <div>
      <xsl:apply-templates select="@*|node()"/>
    </div>
  </xsl:when>
  <xsl:otherwise>
    <div id="id-{position()}" class="section">
      <xsl:apply-templates/>
    </div>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

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
      <xsl:if test="$mode='edit'">
        <div class="right" style="margin: 0; padding: 0">
          <form method="post" id="func{position()}" action="">
             <p>
            <input type="hidden" name="section" value="{position()}"/>
            <input type="image" src="{$prefix}/images/icons/edit.gif" onclick="confirmAction({position()}, '{$nox_srcname}-edit', false)"/>&#160;
            <input type="image" src="{$prefix}/images/icons/plus.png" onclick="confirmAction({position()}, '{$nox_srcname}-add-section', false)"/>&#160;
            <xsl:if test="position()&gt;1 or count(//nox:section)&gt;1">
              <input type="image" src="{$prefix}/images/icons/minus.png" onclick="confirmAction({position()}, '{$nox_srcname}-delete-section', true)"/>
            </xsl:if>
             </p>
          </form>
        </div>
      </xsl:if>
      <xsl:apply-templates/>
    </div>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template name="footer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <div id="toplink">
        <a href="#header">Top ^</a>
    </div>
    <div id="footer">
        <p>&#169;&#160;Daniel Tischer -
            <xsl:value-of select="$nox_filedate"/>
        </p>
    </div>
</xsl:template>

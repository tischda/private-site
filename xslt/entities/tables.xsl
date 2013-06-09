<xsl:template match="th[ancestor::table[@class='preformat']]" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <th>
        <xsl:apply-templates select="@*"/>
        <div class="tableheader">
            <xsl:apply-templates select="node()"/>
        </div>
    </th>
</xsl:template>


<xsl:template match="td[position()=1 and ancestor::table[@class='preformat']]" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:choose>
        <xsl:when test="@class">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:when>
        <xsl:otherwise>
            <td class="tablefirstcol">
                <xsl:apply-templates select="@*|node()"/>
            </td>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>


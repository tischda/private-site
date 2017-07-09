<!-- This template is used to process javascript in nox:page. Content is not allowed.

  Agent test based on: Roger Johansson's Valid downlevel-revealed conditional comments
  http://www.456bereastreet.com/archive/200511/valid_downlevelrevealed_conditional_comments/
-->
<xsl:template name="head_javascript" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:choose>
    <xsl:when test="@agent='ie5'"><xsl:comment>[if IE 5]&gt;</xsl:comment></xsl:when>
    <xsl:when test="@agent='ie6'"><xsl:comment>[if IE 6]&gt;</xsl:comment></xsl:when>
    <xsl:when test="@agent='ie7'"><xsl:comment>[if IE 7]&gt;</xsl:comment></xsl:when>
    <xsl:when test="@agent='notie'"><xsl:comment>[if !IE]&gt;</xsl:comment></xsl:when>
  </xsl:choose>

  <script type="text/javascript">
    <xsl:attribute name="src">
      <xsl:if test="starts-with(@src, '/')"><xsl:value-of select="$prefix"/></xsl:if><xsl:value-of select="@src"/></xsl:attribute>&#160;</script>

  <xsl:if test="@agent!='all'">
    <xsl:comment>&lt;![endif]</xsl:comment>
  </xsl:if>

</xsl:template>
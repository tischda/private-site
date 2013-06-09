<xsl:template name="header" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <div id="header">
        <div id="logo">&#160;</div>
        <div id="title">
            <p>d<span class="white">aniel </span>tischer</p>
        </div>
        <div id="breadcrumb">
            <p><xsl:value-of select="/nox:page/@title"/></p>
        </div>
        <div id="date">
            <p>&#160;</p>
            <p>
                <script type="text/javascript">document.write(dateString());</script>
            </p>
        </div>
        <xsl:if test="/nox:page/@lang">
            <div id="languages">
                <p>
                    <xsl:apply-templates select="document('languages.xi')"/>
                </p>
            </div>
        </xsl:if>
    </div>
</xsl:template>


<!-- Ignore langlist tag, it's just a container -->

<xsl:template match="langlist" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:apply-templates select="node()"/>
</xsl:template>


<!-- Create links to pages in each language -->

<xsl:template match="language" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:choose>
		<!-- do not translate page without language code -->
		<xsl:when test="not($pagelang)"/>
		<!-- we are coming from EN page -->
		<xsl:when test="$pagelang='en'">
			<xsl:choose>
				<!-- EN icon -->
				<xsl:when test="@code='en'">
					<!-- current page -->
					<span class="activelang">[<xsl:value-of select="@code"/>]</span>
				</xsl:when>
				<!-- LANG icons -->
				<xsl:otherwise>
					<!-- link to LANG page -->
					<a href="{$prefix}/{@code}/{$nox_filedir}/{$nox_dstname}" class="lang">[<xsl:value-of select="@code"/>]</a>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<!-- we are coming from LANG page -->
		<xsl:otherwise>
			<xsl:variable name="target">
				<xsl:value-of select="substring-after($nox_filedir,'/')"/>
			</xsl:variable>
			<xsl:choose>
				<!-- EN icon -->
				<xsl:when test="@code='en'">
					<!-- link to EN page -->
					<a href="{$prefix}/{$target}/{$nox_dstname}" class="lang">[<xsl:value-of select="@code"/>]</a>
				</xsl:when>
				<!-- LANG icons -->
				<xsl:otherwise>
					<xsl:choose>
						<!-- current lang -->
						<xsl:when test="@code=$pagelang">
							<!-- current page -->
							<span class="activelang">[<xsl:value-of select="@code"/>]</span>
						</xsl:when>
						<xsl:otherwise>
							<!-- link to LANG page -->
							<a href="{$prefix}/{@code}/{$target}/{$nox_dstname}" class="lang">[<xsl:value-of select="@code"/>]</a>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>&#160;</xsl:template>

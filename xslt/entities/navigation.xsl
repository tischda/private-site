<xsl:template match="a[@href]" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:copy>
    <xsl:if test="substring(@href, 1, 5) = 'http:'">
      <xsl:attribute name="rel">external</xsl:attribute>
    </xsl:if>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>


<xsl:template name="navigation" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:choose>
    <xsl:when test="not($pagelang) or $pagelang='en'">
      <xsl:apply-templates select="document(concat($src_rel, 'mainmenu.xi'))"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="document(concat($src_rel, $pagelang, '/', 'mainmenu.xi'))"/>
    </xsl:otherwise>
  </xsl:choose>

    <xsl:choose>
        <xsl:when test="$nox_filedir">
            <xsl:apply-templates select="document(concat($src_rel, $nox_filedir, '/menu.xi'))"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="document(concat($src_rel, 'menu.xi'))"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>


<xsl:template match="menu" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:choose>

        <!-- *********************************************************** -->
        <!--                                                             -->
        <!-- top menu, global : absolute paths, only one group           -->
        <!--                                                             -->
        <!-- *********************************************************** -->
        <xsl:when test="@type = 'main'">
            <div id="topnav">
                <p>
                    <xsl:for-each select="menugroup/menuitem">
                        <xsl:variable name="target">
                            <xsl:if test="$pagelang and $pagelang!='en'"><xsl:value-of select="$pagelang"/>/</xsl:if>
                            <xsl:if test="@dir"><xsl:value-of select="@dir"/>/</xsl:if>
                        </xsl:variable>
                        <a class="nav" href="{$prefix}/{$target}{@ref}">
                            <!-- check if this is the current menu -->
                            <xsl:if test="not(@dir or $nox_filedir) or @dir=$nox_filedir">
                                <xsl:attribute name="class">nav current</xsl:attribute>
                            </xsl:if>

                            <!-- display menu name -->
                            <xsl:value-of select="@name"/>
                        </a>
                        <span class="separator">|</span>
                    </xsl:for-each>
                </p>
                <p>&#160;</p>
            </div>
        </xsl:when>

        <!-- *********************************************************** -->
        <!--                                                             -->
        <!-- left menu, local : relative paths                           -->
        <!--                                                             -->
        <!-- *********************************************************** -->
        <xsl:otherwise>
            <div id="sidebar">
                <xsl:for-each select="menugroup">
                    <xsl:variable name="ulstyle">
                        <xsl:choose>
                            <xsl:when test="not(position()=last())">nav</xsl:when>
                            <xsl:otherwise>nav last</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <ul class="{$ulstyle}">
                        <xsl:for-each select="menuitem">
                            <li>
                                <xsl:variable name="target">
                                    <xsl:if test="@dir"><xsl:value-of select="@dir"/>/</xsl:if>
                                </xsl:variable>
                                <a href="{$target}{@ref}">

                                    <!-- check if this is the current menu -->
                                    <xsl:if test="not(@dir)">
                                        <xsl:choose>
                                            <xsl:when test="@match">
                                                <xsl:if test="@match=$nox_dstname">
                                                    <xsl:attribute name="class">nav current</xsl:attribute>
                                                </xsl:if>
                                            </xsl:when>
                                            <xsl:when test="@ref=$nox_dstname">
                                                <xsl:attribute name="class">nav current</xsl:attribute>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:if>

                                    <!-- add link attributes (for ex. external) -->
                                    <xsl:if test="@rel">
                                        <xsl:attribute name="rel">
                                            <xsl:value-of select="@rel"/>
                                        </xsl:attribute>
                                    </xsl:if>

                                    <!-- icon for the menuitem -->
                                    <xsl:if test="@image">
                                        <img src="{@image}" class="icon" alt="icon"/>&#160;
                                    </xsl:if>

                                    <!-- display menu name -->
                                    <xsl:value-of select="@name"/>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
                <xsl:for-each select="$menublock">
                    <div class="menublock">
                        <xsl:apply-templates/>
                    </div>
                </xsl:for-each>
            </div>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

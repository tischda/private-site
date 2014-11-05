<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY template_header SYSTEM "entities/header.xsl">
<!ENTITY template_footer SYSTEM "entities/footer.xsl">
<!ENTITY template_naviga SYSTEM "entities/navigation.xsl">
<!ENTITY template_sectio SYSTEM "entities/section.xsl">
<!ENTITY template_tables SYSTEM "entities/tables.xsl">
<!ENTITY template_script SYSTEM "entities/script.xsl">
<!ENTITY template_styles SYSTEM "entities/styles.xsl">
<!ENTITY template_copyit SYSTEM "entities/copy.xsl">
]>
<!-- $Id: common.xsl 171 2006-09-13 21:01:08Z dtischer $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nox="http://dtischer.free.fr/nox" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0" exclude-result-prefixes="nox rdf dc">

  <!-- stylesheet parameters -->
  <xsl:param name="title"/>
  <xsl:param name="prefix"/>
  <xsl:param name="mode"/>

  <!-- parameters set by nox -->
  <xsl:param name="nox_filedate"/>
  <xsl:param name="nox_filedir"/>
  <xsl:param name="nox_srcname"/>
  <xsl:param name="nox_dstname"/>

  <!-- output method, XML declaration added when post-processing -->
  <xsl:output method="xml" indent="no" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" omit-xml-declaration="yes" standalone="yes"/>

  <!-- prefix to file name parameter in document() function -->
  <xsl:variable name="src_rel">../xml/</xsl:variable>

  <!-- save elements for later usage -->
  <xsl:variable name="pagelang" select="/nox:page/@lang"/>
  <xsl:variable name="menublock" select="/nox:page/nox:menublock"/>

  <!-- do not process -->
  <xsl:template match="/nox:page/nox:menublock"/>

  <!-- document layout -->
  <xsl:template match="/nox:page">
    <html>
      <xsl:attribute name="lang">
        <xsl:choose>
          <xsl:when test="@lang">
            <xsl:value-of select="@lang"/>
          </xsl:when>
          <xsl:otherwise>en</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <head>
        <meta http-equiv="Content-Type" content="text/xhtml; charset=utf-8"/>
        <xsl:if test="/nox:page/rdf:RDF">
          <meta name="author" content="{/nox:page/rdf:RDF/rdf:Description/dc:creator}"/>
          <meta name="description" content="{/nox:page/rdf:RDF/rdf:Description/dc:description}"/>
          <meta name="keywords" content="{/nox:page/rdf:RDF/rdf:Description/dc:subject}"/>
        </xsl:if>
        <title>
          <xsl:value-of select="/nox:page/@title"/>
        </title>
        <link rel="icon" href="{$prefix}/favicon.ico" type="image/x-icon"/>
        <link rel="shortcut icon" href="{$prefix}/favicon.ico" type="image/x-icon"/>
        <xsl:for-each select="/nox:page/nox:javascript">
            <xsl:call-template name="head_javascript"/>
        </xsl:for-each>
        <link rel="stylesheet" type="text/css" media="all" href="{$prefix}/css/format.css"/>
        <link rel="stylesheet" type="text/css" media="all" href="{$prefix}/css/layout.css"/>
        <link rel="stylesheet" type="text/css" media="print" href="{$prefix}/css/print.css"/>
        <link rel="stylesheet" title="preferred" type="text/css" media="screen" href="{$prefix}/css/preferred.css"/>
        <xsl:for-each select="/nox:page/nox:stylesheet">
            <xsl:call-template name="stylesheet"/>
        </xsl:for-each>
      </head>
      <body>
        <xsl:call-template name="header"/>
        <xsl:call-template name="navigation"/>
        <div id="content">
          <xsl:apply-templates select="nox:section"/>
        </div>
        <xsl:call-template name="footer"/>
      </body>
    </html>
  </xsl:template>

  &template_sectio;
  &template_header;
  &template_footer;
  &template_naviga;
  &template_tables;
  &template_script;
  &template_styles;
  &template_copyit;

</xsl:stylesheet>

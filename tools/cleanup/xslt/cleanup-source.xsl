<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vra="http://www.vraweb.org/vracore4.htm" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:functx="http://www.functx.com" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes"/>
  
    <xsl:function name="functx:is-value-in-sequence" as="xs:boolean" xmlns:functx="http://www.functx.com">
        <xsl:param name="value" as="xs:anyAtomicType?"/>
        <xsl:param name="seq" as="xs:anyAtomicType*"/>

        <xsl:sequence select="$value = $seq"/>
    </xsl:function>

    <xsl:template match="*|text()|comment()">
        <xsl:copy>
            <xsl:copy-of select ="@*|text()|comment()"/>
            <xsl:apply-templates select="*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*[@source]">
        <xsl:copy>
            <xsl:copy-of select="@*[local-name() != 'source']"/>
            <xsl:choose>
                <xsl:when test="functx:is-value-in-sequence(@source,('getty', 'viaf', 'local', 'hra'))"/>
                <xsl:otherwise>
                    <xsl:copy-of select="@source"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:copy-of select="text()|comment()"/>
            <xsl:apply-templates select="*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="vra:relation[@relids = @href]">
        <xsl:copy>
            <xsl:copy-of select="@*[local-name() != 'href']"/>
            <xsl:copy-of select="text()|comment()"/>
            <xsl:apply-templates select="*"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>

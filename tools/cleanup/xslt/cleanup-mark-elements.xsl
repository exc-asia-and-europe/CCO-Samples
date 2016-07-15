<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vra="http://www.vraweb.org/vracore4.htm" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:functx="http://www.functx.com" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes"/>
    
     <xsl:template match="*|text()|comment()">
        <xsl:copy>
            <xsl:copy-of select ="@*|text()|comment()"/>
            <xsl:apply-templates select="*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="vra:earliestDate/vra:date|vra:earliestDate/vra:alternativeNotation|vra:latestDate/vra:date|vra:latestDate/vra:alternativeNotation">
        <xsl:choose>
            <xsl:when test="matches(text(),'^present|^(-)*[0-9]{1,12}(-[0-9]{2}(-[0-9]{2})*)*')">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{local-name()}" namespace="http://www.vraweb.org/vracore4.htm">
                    <xsl:attribute name="checkMe">xxx</xsl:attribute>                
                    <xsl:copy-of select="@*|text()|comment()"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="vra:earliestDate[not(vra:date|vra:alternativeNotation)]|vra:latestDate[not(vra:date|vra:alternativeNotation)]">
        <xsl:choose>
            <xsl:when test="matches(text(),'^present|^(-)*[0-9]{1,12}(-[0-9]{2}(-[0-9]{2})*)*')">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                 <xsl:element name="{local-name()}" namespace="http://www.vraweb.org/vracore4.htm">
                    <xsl:attribute name="checkMe">xxx</xsl:attribute>                
                    <xsl:copy-of select="@*|text()|comment()"/>
                 </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="vra:relation[starts-with(@relids, 'd1')]">
        <xsl:element name="{local-name()}" namespace="http://www.vraweb.org/vracore4.htm">
           <xsl:attribute name="checkMe">xxx</xsl:attribute>                
           <xsl:copy-of select="@*|text()|comment()"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

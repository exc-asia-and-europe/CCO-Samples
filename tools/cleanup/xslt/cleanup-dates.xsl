<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:vra="http://www.vraweb.org/vracore4.htm" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="*|text()|comment()">
        <xsl:copy>
            <xsl:copy-of select ="@*|text()|comment()"/>
            <xsl:apply-templates select="*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="vra:*[contains(local-name(), 'Set')][@dataDate]" priority="100">
         <xsl:copy>
            <xsl:copy-of select="@*[local-name() != 'dataDate']"/>
            <xsl:copy-of select="text()|comment()"/>
            <xsl:apply-templates select="*"/>
         </xsl:copy>
    </xsl:template>
    
    <xsl:template match="vra:date[@circa]" priority="100">
         <xsl:copy>
            <xsl:copy-of select="@*[local-name() != 'circa'][local-name() != 'dataDate']"/>
            <xsl:choose>
                <xsl:when test="@dataDate castable as xs:dateTime">
                    <xsl:attribute name="dataDate">
                        <xsl:value-of select="format-dateTime(@dataDate,'[Y0001]-[M01]-[D01]-[H01]-[m01]-[s01]')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@dataDate castable as xs:date">
                    <xsl:attribute name="dataDate">
                        <xsl:value-of select="format-date(@dataDate,'[Y0001]-[M01]-[D01]')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@dataDate eq 'present'">
                    <xsl:copy-of select="@dataDate"/>
                </xsl:when>
                <xsl:when test="matches(@dataDate,'present|(-)*[0-9]{1,12}(-[0-9]{2}(-[0-9]{2})*)*')">
                    <xsl:attribute name="dataDate">
                        <xsl:analyze-string select="@dataDate" regex="^(present|(-)*[0-9]{{1,12}}(-[0-9]{{2}}(-[0-9]{{2}})*)*)">
                            <xsl:matching-substring>
                               <xsl:value-of select="regex-group(1)"/> 
                            </xsl:matching-substring>
                        </xsl:analyze-string>                        
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
            <xsl:copy-of select="text()|comment()"/>
            <xsl:apply-templates select="*"/>
         </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*[@dataDate]">
        <xsl:copy>
            <xsl:copy-of select="@*[local-name() != 'dataDate']"/>
            <xsl:choose>
                <xsl:when test="@dataDate castable as xs:dateTime">
                    <xsl:attribute name="dataDate">
                        <xsl:value-of select="format-dateTime(@dataDate,'[Y0001]-[M01]-[D01]-[H01]-[m01]-[s01]')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@dataDate castable as xs:date">
                    <xsl:attribute name="dataDate">
                        <xsl:value-of select="format-date(@dataDate,'[Y0001]-[M01]-[D01]')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@dataDate eq 'present'">
                    <xsl:copy-of select="@dataDate"/>
                </xsl:when>
                <xsl:when test="matches(@dataDate,'present|(-)*[0-9]{1,12}(-[0-9]{2}(-[0-9]{2})*)*')">
                    <xsl:attribute name="dataDate">
                        <xsl:analyze-string select="@dataDate" regex="^(present|(-)*[0-9]{{1,12}}(-[0-9]{{2}}(-[0-9]{{2}})*)*)">
                            <xsl:matching-substring>
                               <xsl:value-of select="regex-group(1)"/> 
                            </xsl:matching-substring>
                        </xsl:analyze-string>                        
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="vra:latestDate[not(vra:date)]" priority="100">
        <xsl:choose>
            <xsl:when test=". = ''">  
                 <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:copy-of select="text()|comment()"/>
                    <xsl:apply-templates select="*"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>
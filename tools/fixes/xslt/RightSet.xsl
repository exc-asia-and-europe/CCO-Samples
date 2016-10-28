<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ext="http://exist-db.org/vra/extension" xmlns:vra="http://www.vraweb.org/vracore4.htm" version="2.0" exclude-result-prefixes="ext">
    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes"/>


    <xsl:template match="*|text()|comment()">
        <xsl:copy>
            <xsl:copy-of select ="@*|text()|comment()"/>
            <xsl:apply-templates select="*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="vra:image">
        <xsl:variable name="i-id" select="@id"/>
    
        <xsl:choose>
            <xsl:when test="not(//*:rightsSet)">
                <xsl:copy>
                    <xsl:copy-of select ="@*|text()|comment()"/>
                    <xsl:apply-templates select ="vra:agentSet"/>
                    <xsl:apply-templates select ="vra:culturalContextSet"/>
                    <xsl:apply-templates select ="vra:dateSet"/>
                    <xsl:apply-templates select ="vra:descriptionSet"/>
                    <xsl:apply-templates select ="vra:inscriptionSet"/>
                    <xsl:apply-templates select ="vra:locationSet"/>
                    <xsl:apply-templates select ="vra:materialSet"/>
                    <xsl:apply-templates select ="vra:measurementsSet"/>
                    <xsl:apply-templates select ="vra:relationSet"/>
                    <xsl:copy-of select="document(concat('../../../data_old/VRA_images/', $i-id, '.xml'))//*:rightsSet"/>
                    <xsl:apply-templates select ="vra:sourceSet"/>
                    <xsl:apply-templates select ="vra:stateEditionSet"/>
                    <xsl:apply-templates select ="vra:stylePeriodSet"/>
                    <xsl:apply-templates select ="vra:subjectSet"/>
                    <xsl:apply-templates select ="vra:techniqueSet"/>
                    <xsl:apply-templates select ="vra:textrefSet"/>
                    <xsl:apply-templates select ="vra:titleSet"/>
                    <xsl:apply-templates select ="vra:worktypeSet"/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>

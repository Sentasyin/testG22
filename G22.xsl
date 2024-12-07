<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Match the root of the XML document -->
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <title>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        line-height: 1.6;
                        margin: 20px;
                    }
                    h1, h2 {
                        color: #2e3b4e;
                    }
                    .section {
                        margin-bottom: 20px;
                    }
                    img {
                        max-width: 300px;
                        display: block;
                        margin-bottom: 10px;
                    }
                </style>
            </head>
            <body>
                <!-- Title -->
                <h1>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </h1>

                <!-- Metadata -->
                <div class="section">
                    <h2>Metadata</h2>
                    <p><strong>Editor:</strong> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:editor"/></p>
                    <p><strong>Funder:</strong> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:funder"/></p>
                    <p><strong>Authority:</strong> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:authority"/></p>
                    <p><strong>Publication URI:</strong> 
                        <a href="{tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno}">
                            <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno"/>
                        </a>
                    </p>
                </div>

                <!-- Historical Details -->
                <div class="section">
                    <h2>Historical Details</h2>
                    <p><strong>Mint Place:</strong> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:sourceDesc/tei:msDesc/tei:history/tei:origin/tei:origPlace"/></p>
                    <p><strong>Date:</strong> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:sourceDesc/tei:msDesc/tei:history/tei:origin/tei:origDate"/></p>
                </div>

                <!-- Physical Description -->
                <div class="section">
                    <h2>Physical Description</h2>
                    <p><strong>Material:</strong> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:material"/></p>
                    <p><strong>Type:</strong> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:objectType"/></p>
                    <p><strong>Diameter:</strong> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:dim[@type='diameter']"/></p>
                    <p><strong>Weight:</strong> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:dim[@type='weight']"/></p>
                    <p><strong>Condition:</strong> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition"/></p>
                </div>

                <!-- Images -->
                <div class="section">
                    <h2>Images</h2>
                    <p><strong>Obverse:</strong></p>
                    <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="tei:TEI/tei:facsimile/tei:surface[@type='obverse']/tei:graphic/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">Obverse Image</xsl:attribute>
                    </img>
                    <p><xsl:value-of select="tei:TEI/tei:facsimile/tei:surface[@type='obverse']/tei:graphic/tei:desc"/></p>

                    <p><strong>Reverse:</strong></p>
                    <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="tei:TEI/tei:facsimile/tei:surface[@type='reverse']/tei:graphic/@url"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">Reverse Image</xsl:attribute>
                    </img>
                    <p><xsl:value-of select="tei:TEI/tei:facsimile/tei:surface[@type='reverse']/tei:graphic/tei:desc"/></p>
                </div>

                <!-- Inscriptions -->
                <div class="section">
                    <h2>Inscriptions</h2>
                    <p><strong>Obverse:</strong> <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:div[@type='edition']/tei:div[@n='obv']/tei:ab"/></p>
                    <p><strong>Reverse:</strong> <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:div[@type='edition']/tei:div[@n='rev']/tei:ab"/></p>
                    <p><strong>Exergue:</strong> <xsl:value-of select="tei:TEI/tei:text/tei:body/tei:div[@type='edition']/tei:div[@n='exe']/tei:ab"/></p>
                </div>

                <!-- Commentary -->
                <div class="section">
                    <h2>Commentary</h2>
                    <p><xsl:value-of select="tei:TEI/tei:text/tei:body/tei:div[@type='commentary' and @xml:lang='zh']/tei:p"/></p>
                </div>

                <!-- Bibliography -->
                <div class="section">
                    <h2>Bibliography</h2>
                    <p><xsl:value-of select="tei:TEI/tei:text/tei:body/tei:div[@type='bibliography']/tei:listBibl/tei:bibl"/></p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

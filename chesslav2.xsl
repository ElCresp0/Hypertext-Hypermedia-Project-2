<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Chesslav</title>
				<link href="chesslav.css" type="text/css" rel="stylesheet" />
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			</head>
			<div id="page">
				<body>
					<header>
						<xsl:apply-templates select="chesslav/wstep/pic"/>
						<h1>
							<xsl:value-of select="//wstep/naglowek"/>
						</h1>
					</header>
					<div id="content">
						<section>
							<xsl:apply-templates select="//segment[@id='3']"/>
						</section>
						<xsl:apply-templates select="chesslav/stopka"/>
					</div>
				</body>
			</div>
		</html>
	</xsl:template>
	<xsl:template match="tresc/segment[@id='3']">
		<h2>
			<xsl:value-of select="naglowek"/>
		</h2>
		<xsl:apply-templates select="galeria"/>
	</xsl:template>
	<xsl:template match="//linki">
		<xsl:for-each select="link">
			<xsl:sort select="@href" order="descending"/>
			<a target="_blank">
				<xsl:call-template name="link"/>
				<xsl:number value="position()" format="1"/>
				<xsl:value-of select="txt"/>
			</a>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="link">
		<xsl:attribute name="href">
			<xsl:value-of select="@href"/>
		</xsl:attribute>
	</xsl:template>
	<xsl:template match="//galeria">
		<xsl:for-each select="figure">
			<div class="galeria">
				<figure>
					<xsl:apply-templates select="pic"/>
					<figcaption>
						<xsl:value-of select="podpis"/>
					</figcaption>
				</figure>
			</div>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="//pic">
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="@src"/>
			</xsl:attribute>
			<img style="width:100%;">
				<xsl:attribute name="src">
					<xsl:value-of select="@src"/>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="picTitle"/>
				</xsl:attribute>
			</img>
		</a>
	</xsl:template>
	<xsl:template match="stopka">
		<p>
			<xsl:value-of select="autor"/>
		</p>
	</xsl:template>

</xsl:stylesheet>
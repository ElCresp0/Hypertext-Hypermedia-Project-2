<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Chesslav</title>
				<link href="chesslav.css" type="text/css" rel="stylesheet"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			</head>
			<div id="page">
				<body>
					<header>
						<xsl:apply-templates select="chesslav/wstep/pic"/>
						<h1>
							<xsl:value-of select="//wstep/naglowek"/>
						</h1>
						<div class="navbar">
							<xsl:apply-templates select="//linki"/>
						</div>
					</header>
					<div id="content">
						<section>
							<xsl:apply-templates select="//segment[@id='1']"/>
						</section>
						<section>
							<xsl:apply-templates select="//segment[@id='2']"/>
						</section>
						<section>
							<xsl:apply-templates select="//segment[@id='3']"/>
						</section>
						<section>
							<xsl:apply-templates select="//mistrzowie"/>
						</section>
					</div>
					<xsl:apply-templates select="chesslav/stopka"/>
				</body>
			</div>
		</html>
	</xsl:template>
	<xsl:template match="//segment[@id&lt;'3']">
		<h2>
			<xsl:value-of select="naglowek"/>
		</h2>
		<p>
			
			<xsl:if test="tekst/@rodzaj='secret'">
				<xsl:attribute name="hidden"/>
			</xsl:if>
			<xsl:value-of select="tekst"/>
		</p>
		<xsl:if test="link">
			<xsl:call-template name="link"/>
		</xsl:if>
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
			<a>
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
		<img style="width:100%;">
			<xsl:attribute name="src">
				<xsl:value-of select="@src"/>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="picTitle"/>
			</xsl:attribute>
		</img>
	</xsl:template>

	<xsl:variable name="mistrzRN">
		<li>
			(obecny)
			<xsl:apply-templates select="//mistrz[last()]"/>
			ranking fide po rzymsku:
			<xsl:variable name="rating" select="//mistrz[last()]/rating"/>
			<xsl:number value="$rating" format="I"/>
		</li>
	</xsl:variable>
	
	<xsl:template match="tresc/segment/mistrzowie">
		<h2>
			<xsl:value-of select="../naglowek"/>
		</h2>
		<ul>
			<li>
				<xsl:value-of select="mistrz[1]"/>
			</li>
			<li>
				<xsl:value-of select="mistrz[2]"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[3]"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[4]"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[@id='5']"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[@id='6']"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[@id='7']"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[@id='8']"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[@id='9']"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[@id='11']"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[@id='12']"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[@id='13']"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[@id='14']"/>
			</li>
			<li>
				<xsl:apply-templates select="mistrz[@id='15']"/>
				<xsl:choose>
					<xsl:when test="mistrz[@id='15']/rating">
						<xsl:value-of select="mistrz[@id='15']/rating"/>
					</xsl:when>
					<xsl:otherwise>
						<a href="https://ratings.fide.com/profile/5000017"> ranking</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>
			<xsl:copy-of select="$mistrzRN"/>
		</ul>
	</xsl:template>
	<xsl:template match="stopka">
		<p>
			<xsl:value-of select="autor"/>
		</p>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="link/@*"/>
			</xsl:attribute>
			<xsl:value-of select="link/txt"/>
		</a>
	</xsl:template>
	
</xsl:stylesheet>
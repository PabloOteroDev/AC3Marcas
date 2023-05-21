<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" /> <!--Para que quede todo tabulado-->

<!--Mantendremos el valor inicial en empresa y telefono-->
  <xsl:template match="/">
    <ite>
      <empresa>
        <xsl:value-of select="ite/empresa" />
      </empresa>

      <telefono>
        <xsl:value-of select="ite/telefono" />
      </telefono>

      <!--Ahora definiremos la estructura que queremos tener en el nuevo XML-->

      <personal>
        <xsl:apply-templates select="ite/profesores/profesor" />
        <empleado puesto="dirección">
          <xsl:apply-templates select="ite/director" />
        </empleado>
        <empleado puesto="jefatura de estudios">
          <xsl:apply-templates select="ite/jefe_estudios" />
        </empleado>
      </personal>
      <xsl:copy-of select="ite/ciclos" />
      </ite>
    </xsl:template>
    <!--He creado el selector <personal> y generado los selectores <empleado> con el atributo de puesto="valor" que 
    corresponde a cada uno.
    El selector ciclos ha sido mantenido tal como aparece en el XML de entrada.-->

    <!--Se define la plantilla para cada elemento que ha de cambiarse, y se extrae contenido de cada uno-->

    <!--Para el elemento profesor-->
    <xsl:template match="profesor">
      <empleado puesto="profesorado">
        <id>
          <xsl:value-of select="id" />
        </id>
        <nombre>
          <xsl:value-of select="nombre" />
        </nombre>
      </empleado>
    </xsl:template>

    <!--Para ambos elementos director y jefe de estudios-->
    <xsl:template match="director | jefe_estudios"> <!--La barra vertical para incluir a ambos-->
      <nombre>
        <xsl:value-of select="nombre" />
      </nombre>
      <despacho>
        <xsl:value-of select="despacho" />
      </despacho>
    </xsl:template>
   </xsl:template>
</xsl:stylesheet>

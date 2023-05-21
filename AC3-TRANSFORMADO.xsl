<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Instituto Tecnológico Edix</title>
        <link rel="stylesheet" type="text/css" href="styles.css"/>
      </head>
      <body>
        <ul> <!--He decidido que la lista sea todo el documento, con cada parte como un
        item, y cada uno en forma de carta-->
          <li class="card">
            <h1><xsl:value-of select="ite/empresa"/></h1>
            <p>Teléfono de contacto <xsl:value-of select="ite/telefono"/> ✆</p>
          </li>

          <li class="card">
           <h3>Director</h3>
           <p>Nombre: <xsl:value-of select="/ite/director/nombre"/></p>
           <p>Despacho: <xsl:value-of select="/ite/director/despacho"/></p>
          </li>
          <li class="card">
            <h3>Jefe de Estudios</h3>
            <p>Nombre: <xsl:value-of select="/ite/jefe_estudios/nombre" /></p>
            <p>Despacho: <xsl:value-of select="/ite/jefe_estudios/despacho" /></p>
          </li>
          <li class="card">
            <h2>Profesores</h2>
            <table>
              <tr>
                <th>Identificador</th>
                <th>Nombre</th>
              </tr>
              <xsl:for-each select="ite/profesores/profesor">
                <tr>
                  <td><xsl:value-of select="id"/></td>
                  <td><xsl:value-of select="nombre"/></td>
                </tr>
              </xsl:for-each>
            </table>
          </li>
          <li class="card">
            <h2>Ciclos ofertados</h2>
            <table>
              <tr>
                <th>Acrónimo</th>
                <th>Nombre completo</th>
                <th>Nivel del grado</th>
                <th>Año de implantación</th>
              </tr>
              <xsl:for-each select="/ite/ciclos/ciclo">
              <tr>
                 <td><xsl:value-of select="@id"/></td> <!--La arroba selecciona atributo-->
                 <td><xsl:value-of select="nombre"/></td>
                 <td><xsl:value-of select="grado"/></td>
                 <td><xsl:value-of select="decretoTitulo/@año"/></td>
              </tr>
              </xsl:for-each>
            </table>
          </li>
          <li class="card">
            <h2>Contacta con nosotros</h2>
            <form>
              <div class="piezaformulario">
                <label for="name">Nombre y apellidos:</label>
                <input type="text" id="name" name="name"/>
              </div>
              <div class="piezaformulario">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email"/>
              </div>
              <div class="piezaformulario">
                <label for="telefono">Teléfono:</label>
                <input type="telefono" id="telefono" name="telefono"/>
              </div>
              <div class="piezaformulario">
                <label>¿Cómo prefieres que te contactemos?:</label>
                <label>
                  <input type="radio" name="contacto" value="correo"/>
                  Por correo
                </label>
                <label>
                  <input type="radio" name="contacto" value="telefono"/>
                  Por teléfono
                </label>
              </div>
              <div class="piezaformulario">
                <label for="ciclo">¿En qué ciclo estás interesado?</label>
                <select id="ciclo" name="ciclo">
                  <option value="ASIR">ASIR</option>
                  <option value="DAW">DAW</option>
                  <option value="DAM">DAM</option>
                </select>
              </div>
              <div class="piezaformulario">
                <label>
                  <input type="checkbox" name="terminos"/>
                  Acepto los términos y condiciones legales.
                </label>
              </div>
              <div class="piezaformulario">
                <input type="submit" value="Contactar"/>
              </div>
            </form>
          </li>
          <li class="card">
            <h3>Enlaces de interés</h3>
            <ol>
              <li><a href="https://www.edix.com/es/">Nuestra página oficial</a></li>
              <li><a href="https://unirfp.unir.net/ingenieria/fp-grado-asir/">Grado de ASIR</a></li>
              <li><a href="https://unirfp.unir.net/ingenieria/fp-grado-desarrollo-aplicaciones-multiplataforma-dam/">Grado de DAM</a></li>
              <li><a href="https://unirfp.unir.net/ingenieria/fp-grado-daw-desarrollo-de-aplicaciones-web/">Grado de DAW</a></li>
            </ol>
          </li>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

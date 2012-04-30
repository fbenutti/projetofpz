package org.apache.jsp.formulario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class cadastroPalestrante_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"../bootstrap/css/bootstrap.min.css\" type=\"text/css\" rel=\"stylesheet\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"jQueryUI/js/jquery-1.7.1.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"bootstrap/js/bootstrap-modal.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            $(document).ready(function(){\n");
      out.write("                $('#EnviarTexto').click(function(){\n");
      out.write("                    $('#cadastroTex').fadeOut(\"slow\", function(){\n");
      out.write("                        $('#cadastroFoto').fadeIn(\"slow\");\n");
      out.write("                    });\n");
      out.write("\n");
      out.write("                });\n");
      out.write("\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"navbar navbar-fixed-top\">\n");
      out.write("            <div class=\"navbar-inner\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <a class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\".nav-collapse\">\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </a>\n");
      out.write("                    <a class=\"brand\" href=\"#\">fpzCongressos</a>\n");
      out.write("                    <div class=\"nav-collapse\">\n");
      out.write("                        <ul class=\"nav\">\n");
      out.write("                            <li class=\"active\"><a href=\"#\">Home</a></li>\n");
      out.write("                            <li><a href=\"#about\">Sobre</a></li>\n");
      out.write("                            <li><a href=\"#contact\">Contato</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div><!--/.nav-collapse -->  \n");
      out.write("                    <p class=\"navbar-text pull-right\">Autenticado como <a data-toggle=\"modal\" href=\"#cadastroModal\">Wellington</a></p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        <h3>Cadastro de Palestrante</h3>\n");
      out.write("        <br />\n");
      out.write("        <div id=\"cadastroTex\">\n");
      out.write("            <form id=\"cadastroPalestranteDados\" name=\"cadastro\" action=\"\" method=\"post\">\n");
      out.write("                <p><label>Nome: <input type=\"text\" name=\"nome\"></label></p>\n");
      out.write("                <p><label>Email: <input type=\"text\" name=\"email\"></label></p>\n");
      out.write("                <p><label>Cidade: <input type=\"text\" name=\"cidade\"></label></p>\n");
      out.write("                <p><label>Estado: <input type=\"text\" name=\"estado\"></label></p>\n");
      out.write("                <input id=\"EnviarTexto\" class=\"btn btn-primary\" type=\"button\" value=\"Enviar\"/>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\" id=\"cadastroFoto\">\n");
      out.write("            <form id=\"cadastroPalestranteFoto\" name=\"cadastro\" action=\"\" method=\"post\">\n");
      out.write("                <p><label>Foto: <input type=\"file\" name=\"upFoto\"></label></p>\n");
      out.write("                <p><label><input id=\"EnviarFoto\" class=\"btn btn-primary\" type=\"button\" value=\"Upload\"/></label></p>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n");
      out.write("        <title>Welcome - Inventory Management System</title>\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\"/>\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("       \r\n");
      out.write("        <form action=\"login.jsp\" method=\"post\">\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("       <section class=\"text-center text-lg-start\">\r\n");
      out.write("    <!-- Jumbotron -->\r\n");
      out.write("    <div class=\"container py-4\">\r\n");
      out.write("      <nav class=\"navbar navbar-expand-lg navbar-light bg-white\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("          <a class=\"navbar-brand d-flex justify-content-between\" href=\"index.html\">\r\n");
      out.write("          \r\n");
      out.write("          </a>\r\n");
      out.write("          <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarNav\"\r\n");
      out.write("            aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n");
      out.write("            <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("          </button>\r\n");
      out.write("          \r\n");
      out.write("        </div>\r\n");
      out.write("      </nav>\r\n");
      out.write("\r\n");
      out.write("      <div class=\"row g-0 align-items-center\">\r\n");
      out.write("        <div class=\"col-lg-6 mb-5 mb-lg-0\">\r\n");
      out.write("          <div class=\"card cascading-right\"\r\n");
      out.write("            style=\"background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);\">\r\n");
      out.write("            <div class=\"card-body p-5 shadow-5 text-center\">\r\n");
      out.write("              <h2 class=\"fw-bold mb-5\">Sign In</h2>\r\n");
      out.write("              <form>\r\n");
      out.write("                <!-- Email input -->\r\n");
      out.write("                <div class=\"form-outline mb-4\">\r\n");
      out.write("                  <input type=\"text\" id=\"emailInput\" name=\"username\" class=\"form-control\" placeholder=\"Username\" required/>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <!-- Password input -->\r\n");
      out.write("                <div class=\"form-outline mb-4\">\r\n");
      out.write("                  <input type=\"password\" id=\"passwordInput\" name=\"password\" class=\"form-control\" placeholder=\"Password\" required/>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <!-- Submit button -->\r\n");
      out.write("                <button type=\"submit\" class=\"btn btn-primary btn-block mb-4\">\r\n");
      out.write("                  Sign In\r\n");
      out.write("                </button>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"text-center\">\r\n");
      out.write("                  <p>Don't have an account? <a href=\"sign_up.jsp\">Sign up</a></p>\r\n");
      out.write("                </div>\r\n");
      out.write("              </form>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"col-lg-6 mb-5 mb-lg-0\">\r\n");
      out.write("          <img src=\"images/main-image.png\" class=\"w-100 d-none d-lg-block\" alt=\"\" />\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- Jumbotron -->\r\n");
      out.write("  </section>\r\n");
      out.write("  <!-- Section: Design Block -->\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  <!-- Bootstrap JS -->\r\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("    </form>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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

package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Add Product</title>        \n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <body class=\"container bg-dark text-center text-white\">\n");
      out.write("        <div>\n");
      out.write("            <h1>Add Product</h1>\n");
      out.write("        </div>\n");
      out.write("        <div>\n");
      out.write("            <form action=\"addProduct-Process.jsp\" method=\"POST\">\n");
      out.write("                <table>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"name\">Name : </label></td>\n");
      out.write("                        <td><input type=\"text\" name=\"name\" id=\"name\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"price\">Price : </label></td>\n");
      out.write("                        <td><input type=\"text\" name=\"price\" id=\"price\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"quantity\">Quantity : </label></td>\n");
      out.write("                        <td><input type=\"text\" name=\"quantity\" id=\"quantity\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td></td>\n");
      out.write("                        <td><input type=\"submit\" value=\"Submit\"></td>\n");
      out.write("                    </tr>\n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div>\n");
      out.write("            ");

                if (request.getParameter("add") != null) {
                    if (request.getParameter("add").equals("1")) {
                        out.println("Product Added to Inventory.");
                    } else if (request.getParameter("add").equals("0")) {
                        out.println("ERROR : Unable to save to database.");
                    } else if (request.getParameter("add").equals("2")) {
                        String id = request.getParameter("id");
                        out.println("ERROR : Product name exists in the product id : " + id);
                    }
                }
            
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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

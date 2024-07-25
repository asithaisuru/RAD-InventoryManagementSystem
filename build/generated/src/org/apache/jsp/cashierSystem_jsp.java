package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import Classes.Product;
import java.util.List;

public final class cashierSystem_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Cashier System</title>\n");
      out.write("        <!-- Latest compiled and minified CSS -->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Latest compiled JavaScript -->\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Cashier System</h1>\n");
      out.write("        <form action=\"CasherSystem-process.jsp\" method=\"POST\">\n");
      out.write("            <label for=\"id\">ID : </label>\n");
      out.write("            <input type=\"text\" name=\"id\" value=\"\" id=\"id\"/>\n");
      out.write("\n");
      out.write("            <label for=\"quantity\">Quantity : </label>\n");
      out.write("            <input type=\"text\" name=\"quantity\" value=\"\" id=\"quantity\"/>\n");
      out.write("\n");
      out.write("            <input type=\"submit\" value=\"Add\">\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <div>\n");
      out.write("            <table border=\"1\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>ID</th>\n");
      out.write("                        <th>Name</th>\n");
      out.write("                        <th>Quantity</th>\n");
      out.write("                        <th>Price</th>\n");
      out.write("                        <th>Total Price</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    ");

                        List<Product> productList = (List<Product>) session.getAttribute("productList");
                        if (productList == null) {
                            productList = new ArrayList<Product>();
                        }
                        double subTotal = 0;
                        for (Product product : productList) {
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
out.println(product.getId());
      out.write("</td>\n");
      out.write("                        <td>");
out.println(product.getName());
      out.write("</td>\n");
      out.write("                        <td>");
out.println(product.getQuantity());
      out.write("</td>\n");
      out.write("                        <td>");
out.println(product.getPrice());
      out.write("</td>\n");
      out.write("                        <td>");
out.println(product.getPrice() * product.getQuantity());
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                            subTotal += product.getPrice() * product.getQuantity();
                        }
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"4\">Sub Total</td>\n");
      out.write("                        <td>");
out.println(subTotal);
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <form action=\"saveBill.jsp\" method=\"POST\">\n");
      out.write("            <input type=\"submit\" value=\"Print\">\n");
      out.write("        </form>\n");
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

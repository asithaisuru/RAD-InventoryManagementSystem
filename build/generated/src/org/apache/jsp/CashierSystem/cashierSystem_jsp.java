package org.apache.jsp.CashierSystem;

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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Cashier System</title>\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body class=\"text-center bg-dark text-white mt-5\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <h1 class=\"h1 mb-4\">Cashier System</h1>\r\n");
      out.write("            <form action=\"CasherSystem-process.jsp\" method=\"POST\">\r\n");
      out.write("                <div class=\"row mb-4\">\r\n");
      out.write("                    <label for=\"id\" class=\"col-lg-1\">ID : </label>\r\n");
      out.write("                    <input type=\"text\" name=\"id\" value=\"\" id=\"id\" class=\"col-lg-4\" required/>\r\n");
      out.write("\r\n");
      out.write("                    <label for=\"quantity\" class=\"col-lg-1\">Quantity : </label>\r\n");
      out.write("                    <input type=\"number\" name=\"quantity\" value=\"\" id=\"quantity\" class=\"col-lg-4\" required=\"\"/>\r\n");
      out.write("\r\n");
      out.write("                    <input type=\"submit\" value=\"Add\" class=\"btn btn-success col-lg-1 ms-4\">\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"text-center\">\r\n");
      out.write("                <table class=\"table table-dark table-hover\">\r\n");
      out.write("                    <thead>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th>ID</th>\r\n");
      out.write("                            <th>Name</th>\r\n");
      out.write("                            <th>Quantity</th>\r\n");
      out.write("                            <th>Price</th>\r\n");
      out.write("                            <th>Total Price</th>\r\n");
      out.write("                            <th></th>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>\r\n");
      out.write("                    <tbody>\r\n");
      out.write("                        ");

                            List<Product> productList = (List<Product>) session.getAttribute("productList");
                            if (productList == null) {
                                productList = new ArrayList<Product>();
                            }
                            double subTotal = 0;
                            for (Product product : productList) {
                        
      out.write("\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>");
out.println(product.getId());
      out.write("</td>\r\n");
      out.write("                            <td>");
out.println(product.getName());
      out.write("</td>\r\n");
      out.write("                            <td>");
out.println(product.getQuantity());
      out.write("</td>\r\n");
      out.write("                            <td>");
out.println(product.getPrice());
      out.write("</td>\r\n");
      out.write("                            <td>");
out.println(product.getPrice() * product.getQuantity());
      out.write("</td>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <form action=\"removeProduct.jsp\" method=\"POST\" style=\"display:inline;\">\r\n");
      out.write("                                    <input type=\"hidden\" name=\"id\" value=\"");
      out.print( product.getId() );
      out.write("\"/>\r\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-danger\"><i class=\"fas fa-trash\"></i></button>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        ");

                                subTotal += product.getPrice() * product.getQuantity();
                            }
                        
      out.write("\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td colspan=\"4\">Sub Total</td>\r\n");
      out.write("                            <td class=\"bg-success\">");
out.println(subTotal);
      out.write("</td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </tbody>\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <form action=\"saveBill.jsp\" method=\"POST\">\r\n");
      out.write("                <input type=\"submit\" value=\"Print\" class=\"btn btn-warning col-lg-1\">\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
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

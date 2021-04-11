package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_set_var_value_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_set_var_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_set_var_value_nobody.release();
    _jspx_tagPool_c_if_test.release();
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <title>Login</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link href=\"http://netdna.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            body{\n");
      out.write("                background-image: -webkit-gradient(linear, left top, right top, from(#4e63d7), to(#76bfe9)) !important;\n");
      out.write("                background-image: linear-gradient(to right, #4e63d7 0%, #76bfe9 100%) !important;\n");
      out.write("                margin-top:20px;}\n");
      out.write("\n");
      out.write("            /* ===== LOGIN PAGE ===== */\n");
      out.write("            .login-box {\n");
      out.write("                -webkit-box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.1);\n");
      out.write("                box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.1);\n");
      out.write("                border-radius: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media (min-width: 992px) {\n");
      out.write("                .login-box {\n");
      out.write("                    margin: 40px 0;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-box .form-wrap {\n");
      out.write("                padding: 30px 25px;\n");
      out.write("                border-radius: 10px;\n");
      out.write("                -webkit-box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.1);\n");
      out.write("                box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media (min-width: 768px) {\n");
      out.write("                .login-box .form-wrap {\n");
      out.write("                    padding: 45px;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media (min-width: 992px) {\n");
      out.write("                .login-box .form-wrap {\n");
      out.write("                    margin-top: -40px;\n");
      out.write("                    margin-bottom: -40px;\n");
      out.write("                    padding: 60px;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-box .socials a {\n");
      out.write("                -webkit-box-shadow: 0 3px 2px 0 rgba(0, 0, 0, 0.12);\n");
      out.write("                box-shadow: 0 3px 2px 0 rgba(0, 0, 0, 0.12);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-section {\n");
      out.write("                position: relative;\n");
      out.write("                z-index: 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-section::after {\n");
      out.write("                position: absolute;\n");
      out.write("                content: '';\n");
      out.write("                right: 0;\n");
      out.write("                left: 0;\n");
      out.write("                bottom: 0;\n");
      out.write("                width: 100%;\n");
      out.write("                height: 100%;\n");
      out.write("                opacity: 0.15;\n");
      out.write("                z-index: -1;\n");
      out.write("                background-image: url(../img/shapes/login-wave2.svg);\n");
      out.write("                background-size: cover;\n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                background-position: top right;\n");
      out.write("                -webkit-animation-duration: 3s;\n");
      out.write("                animation-duration: 3s;\n");
      out.write("                -webkit-animation-direction: alternate;\n");
      out.write("                animation-direction: alternate;\n");
      out.write("                -webkit-animation-iteration-count: infinite;\n");
      out.write("                animation-iteration-count: infinite;\n");
      out.write("                -webkit-animation-name: pulse;\n");
      out.write("                animation-name: pulse;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-section::before {\n");
      out.write("                position: absolute;\n");
      out.write("                content: '';\n");
      out.write("                opacity: 0.10;\n");
      out.write("                right: 0;\n");
      out.write("                left: 0;\n");
      out.write("                bottom: 0;\n");
      out.write("                width: 100%;\n");
      out.write("                height: 100%;\n");
      out.write("                z-index: -1;\n");
      out.write("                background-image: url(../img/shapes/login-wave1.svg);\n");
      out.write("                background-size: cover;\n");
      out.write("                background-position: top right;\n");
      out.write("                -webkit-animation-duration: 6s;\n");
      out.write("                animation-duration: 6s;\n");
      out.write("                -webkit-animation-direction: alternate;\n");
      out.write("                animation-direction: alternate;\n");
      out.write("                -webkit-animation-iteration-count: infinite;\n");
      out.write("                animation-iteration-count: infinite;\n");
      out.write("                -webkit-animation-name: pulse;\n");
      out.write("                animation-name: pulse;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-section .content {\n");
      out.write("                padding: 45px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-group .zmdi {\n");
      out.write("                position: absolute;\n");
      out.write("                z-index: 1;\n");
      out.write("                color: #fff;\n");
      out.write("                background-color: #4e63d7;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                height: 100%;\n");
      out.write("                width: 45px;\n");
      out.write("                text-align: center;\n");
      out.write("                font-size: 20px;\n");
      out.write("                padding-top: 13px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-group input[type='text'], .form-group input[type='email'], .form-group input[type='password'] {\n");
      out.write("                padding-left: 60px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-control {\n");
      out.write("                border: 1px solid #e1e1e1;\n");
      out.write("                -webkit-box-shadow: none;\n");
      out.write("                box-shadow: none;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                -webkit-transition: all .3s ease;\n");
      out.write("                transition: all .3s ease;\n");
      out.write("                background-color: #fff;\n");
      out.write("                color: #858585;\n");
      out.write("                font-weight: 400;\n");
      out.write("                position: relative;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            .login-box .socials a {\n");
      out.write("                -webkit-box-shadow: 0 3px 2px 0 rgba(0, 0, 0, 0.12);\n");
      out.write("                box-shadow: 0 3px 2px 0 rgba(0, 0, 0, 0.12);\n");
      out.write("            }\n");
      out.write("            .socials a {\n");
      out.write("                width: 35px;\n");
      out.write("                height: 35px;\n");
      out.write("                background-color: #6893e1;\n");
      out.write("                border-radius: 50%;\n");
      out.write("                -webkit-box-shadow: 0 3px 2px 0 #516cd9;\n");
      out.write("                box-shadow: 0 3px 2px 0 #516cd9;\n");
      out.write("                text-align: center;\n");
      out.write("                color: #fff;\n");
      out.write("                padding-top: 10px;\n");
      out.write("                font-size: 16px;\n");
      out.write("                margin-right: 10px;\n");
      out.write("                -webkit-transition: all 0.3s ease;\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css\" integrity=\"sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=\" crossorigin=\"anonymous\" />\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-11 mt-60 mx-md-auto\">\n");
      out.write("                    <div class=\"login-box bg-white pl-lg-5 pl-0\">\n");
      out.write("                        <div class=\"row no-gutters align-items-center\">\n");
      out.write("                            <div class=\"col-md-6\">\n");
      out.write("                                <div class=\"form-wrap bg-white\">\n");
      out.write("                                    <h4 class=\"btm-sep pb-3 mb-5\">Login</h4>\n");
      out.write("                                    <form class=\"form\" method=\"post\" action=\"Login\">\n");
      out.write("                                        <div class=\"row\">\n");
      out.write("                                            <div class=\"col-12\">\n");
      out.write("                                                <div class=\"form-group position-relative\">\n");
      out.write("                                                    <span class=\"zmdi zmdi-account\"></span>\n");
      out.write("                                                    <input type=\"email\" name=\"txtEmail\" id=\"email\" class=\"form-control\" placeholder=\"Email Address\">\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"col-12\">\n");
      out.write("                                                <div class=\"form-group position-relative\">\n");
      out.write("                                                    <span class=\"zmdi zmdi-email\"></span>\n");
      out.write("                                                    <input type=\"password\" name=\"txtPassword\" id=\"password\" class=\"form-control\" placeholder=\"Password\">\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>      \n");
      out.write("                                            <div class=\"col-12 mt-30\">\n");
      out.write("                                                <button type=\"submit\" id=\"submit\" class=\"btn btn-lg btn-custom btn-dark btn-block\">Sign In\n");
      out.write("                                                </button>\n");
      out.write("                                            </div>\n");
      out.write("                                            ");
      if (_jspx_meth_c_set_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                                            ");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("                                                                                     \n");
      out.write("                                        </div>\n");
      out.write("                                    </form>\n");
      out.write("                                    \n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-md-6\">\n");
      out.write("                                <div class=\"content text-center\">\n");
      out.write("                                    <div class=\"border-bottom pb-5 mb-5\">\n");
      out.write("                                        <h3 class=\"c-black\">First time here ?</h3>\n");
      out.write("                                        <a href=\"register\" class=\"btn btn-custom\" style=\"color: blue\">Register</a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script src=\"http://code.jquery.com/jquery-1.10.2.min.js\"></script>\n");
      out.write("        <script src=\"http://netdna.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("        </script>\n");
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

  private boolean _jspx_meth_c_set_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_0.setPageContext(_jspx_page_context);
    _jspx_th_c_set_0.setParent(null);
    _jspx_th_c_set_0.setVar("error");
    _jspx_th_c_set_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.ERROR_LOGIN}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_0 = _jspx_th_c_set_0.doStartTag();
    if (_jspx_th_c_set_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
    return false;
  }

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty error}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                                                <div class=\"alert alert-danger\" style=\"margin-top: 10px\">\n");
        out.write("                                                <strong>Warning!</strong> ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("\n");
        out.write("                                            </div>\n");
        out.write("                                            ");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }
}

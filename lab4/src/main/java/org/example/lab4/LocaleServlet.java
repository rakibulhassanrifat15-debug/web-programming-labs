
package org.example.lab4;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.ResourceBundle;


public class LocaleServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String lang = request.getParameter("lang");

        Locale locale;

        if ("en".equalsIgnoreCase(lang)) {
            locale = Locale.ENGLISH;
        } else {
            locale = Locale.forLanguageTag("ru");
            lang = "ru";
        }

        ResourceBundle bundle =
                ResourceBundle.getBundle("messages", locale);

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String nextLang = "ru".equals(lang) ? "en" : "ru";

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>" + bundle.getString("title") + "</title>");
        out.println("</head>");

        out.println("<body style='font-family:Arial;"
                + "text-align:center;margin-top:100px;'>");

        out.println("<h1>" + bundle.getString("greeting") + "</h1>");

        out.println("<p>" + bundle.getString("description") + "</p>");

        out.println("<a href='?lang=" + nextLang + "'>"
                + bundle.getString("language_button") + "</a>");

        out.println("</body>");
        out.println("</html>");
    }
}

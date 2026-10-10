package org.example.lab3;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet for Laboratory Work 3.
 * Receives an initialization parameter and
 * a dynamic parameter from an HTTP request.
 */
public class HelloServlet extends HttpServlet {

    private String greeting;

    /**
     * Initializes the servlet.
     * The greeting value is read from web.xml.
     *
     * @param config servlet configuration
     * @throws ServletException if initialization fails
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        greeting = config.getInitParameter("greeting");

        if (greeting == null) {
            greeting = "Hello";
        }
    }

    /**
     * Processes a GET request.
     * Reads the dynamic parameter "name".
     *
     * @param request HTTP request
     * @param response HTTP response
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");

        if (name == null || name.isBlank()) {
            name = "Guest";
        }

        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>Lab 3 Servlet</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h1>" + greeting + ", " + name + "!</h1>");
        out.println("<p>Web Programming - Laboratory Work 3</p>");

        out.println("</body>");
        out.println("</html>");
    }

    /**
     * Processes a POST request.
     *
     * @param request HTTP request
     * @param response HTTP response
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws IOException {

        doGet(request, response);
    }
}
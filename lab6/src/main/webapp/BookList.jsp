<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="org.example.lab5.Book" %>
<%@ page import="java.util.List, java.util.Arrays" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Список книг читателя</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");

    // Check whether the reader's name is provided
    if (name == null || name.trim().isEmpty()) {
        request.getRequestDispatcher("/ErrorManager.jsp")
               .forward(request, response);
        return;
    }

    name = name.trim();

    // Prepare the book list
    List<Book> books = Arrays.asList(
        new Book("Булгаков", "Мастер и Маргарита", true),
        new Book("Пушкин", "Капитанская дочка", true),
        new Book("Толстой", "Война и мир", false)
    );

    request.setAttribute("books", books);

    // Escape HTML special characters in the entered name
    String safeName = name.replace("&", "&amp;")
                          .replace("<", "&lt;")
                          .replace(">", "&gt;")
                          .replace("\"", "&quot;")
                          .replace("'", "&#39;");
%>

<h1>Список книг читателя <%= safeName %></h1>

<jsp:include page="ListData.jsp" />

<p><a href="index.jsp">Вернуться на главную</a></p>

</body>
</html>

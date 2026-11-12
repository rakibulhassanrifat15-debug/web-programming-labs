<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="org.example.lab5.Book" %>
<%@ page import="java.util.List" %>

<%
    // Get the book list from BookList.jsp
    List<Book> books =
        (List<Book>) request.getAttribute("books");
%>

<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>Автор книги</th>
        <th>Название книги</th>
        <th>Прочитал</th>
    </tr>

    <% if (books != null) {
        for (Book book : books) { %>
    <tr>
        <td><%= book.getAuthor() %></td>
        <td><%= book.getTitle() %></td>
        <td><%= book.isRead() ? "Да" : "Нет" %></td>
    </tr>
    <% }
    } %>

</table>

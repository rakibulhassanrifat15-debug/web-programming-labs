<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="jakarta.servlet.http.Cookie" %>

<%
    // 1. Получение данных из Cookie
    String username = "Гость";
    String color = "lightblue";

    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {

            if ("lab7Name".equals(cookie.getName())) {
                username = URLDecoder.decode(
                        cookie.getValue(),
                        StandardCharsets.UTF_8
                );
            }

            if ("lab7Color".equals(cookie.getName())) {
                color = cookie.getValue();
            }
        }
    }

    // 2. Проверка цвета страницы
    if (!"lightblue".equals(color)
            && !"lightgreen".equals(color)
            && !"lightyellow".equals(color)) {
        color = "lightblue";
    }

    // 3. Подсчёт посещений с помощью HttpSession
    Integer visitCount =
            (Integer) session.getAttribute("lab7VisitCount");

    if (visitCount == null) {
        visitCount = 0;
    }

    visitCount++;

    session.setAttribute("lab7VisitCount", visitCount);

    // 4. Получение времени предыдущего посещения
    Long previousVisit =
            (Long) session.getAttribute("lab7LastVisit");

    String previousVisitText = "Первое посещение";

    if (previousVisit != null) {
        SimpleDateFormat format =
                new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");

        previousVisitText =
                format.format(new Date(previousVisit));
    }

    // Сохранение времени текущего посещения
    session.setAttribute(
            "lab7LastVisit",
            System.currentTimeMillis()
    );

    // 5. Безопасный вывод имени пользователя
    String safeUsername = username
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&#39;");
%>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Результаты — Лабораторная работа №7</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: <%= color %>;
            padding: 50px 20px;
        }

        .container {
            max-width: 650px;
            margin: auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px #00000015;
        }

        h2 {
            text-align: center;
        }

        h3 {
            margin-top: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            border: 1px solid #cccccc;
            padding: 12px;
        }

        td:first-child {
            font-weight: bold;
            width: 45%;
        }

        a {
            display: inline-block;
            margin-top: 25px;
            color: #2563eb;
        }
    </style>
</head>

<body>
<div class="container">

    <h2>Лабораторная работа №7</h2>
    <h3>Результаты работы приложения</h3>

    <p>Здравствуйте, <strong><%= safeUsername %></strong>!</p>

    <h3>Данные Cookie</h3>

    <table>
        <tr>
            <td>Имя пользователя</td>
            <td><%= safeUsername %></td>
        </tr>
        <tr>
            <td>Цвет страницы</td>
            <td><%= color %></td>
        </tr>
    </table>

    <h3>Данные сессии (HttpSession)</h3>

    <table>
        <tr>
            <td>Количество посещений</td>
            <td><%= visitCount %></td>
        </tr>
        <tr>
            <td>Предыдущее посещение</td>
            <td><%= previousVisitText %></td>
        </tr>
    </table>

    <a href="index.jsp">Вернуться к форме</a>

</div>
</body>
</html>

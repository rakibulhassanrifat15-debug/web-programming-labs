<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="jakarta.servlet.http.Cookie" %>

<%
    // Обработка данных формы
    request.setCharacterEncoding("UTF-8");

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String username = request.getParameter("username");
        String color = request.getParameter("color");

        if (username != null && !username.trim().isEmpty()) {

            username = username.trim();

            // Проверка выбранного цвета
            if (!"lightblue".equals(color)
                    && !"lightgreen".equals(color)
                    && !"lightyellow".equals(color)) {
                color = "lightblue";
            }

            // Сохранение данных в Cookie
            Cookie nameCookie = new Cookie(
                    "lab7Name",
                    URLEncoder.encode(username, StandardCharsets.UTF_8)
            );

            Cookie colorCookie = new Cookie("lab7Color", color);

            String cookiePath = request.getContextPath();
            if (cookiePath.isEmpty()) cookiePath = "/";

            nameCookie.setPath(cookiePath);
            colorCookie.setPath(cookiePath);

            // Срок хранения Cookie — 7 дней
            nameCookie.setMaxAge(7 * 24 * 60 * 60);
            colorCookie.setMaxAge(7 * 24 * 60 * 60);

            response.addCookie(nameCookie);
            response.addCookie(colorCookie);

            // Переход на вторую JSP-страницу
            response.sendRedirect(
                    request.getContextPath() + "/result.jsp"
            );
            return;
        }
    }
%>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа №7</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f5f9;
            padding: 50px 20px;
        }

        .container {
            max-width: 450px;
            margin: auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px #00000015;
        }

        h2 {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 18px;
            margin-bottom: 8px;
        }

        input, select, button {
            width: 100%;
            padding: 12px;
            box-sizing: border-box;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            margin-top: 25px;
            background: #2563eb;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }
    </style>
</head>

<body>
<div class="container">

    <h2>Лабораторная работа №7</h2>
    <h3>Настройки пользователя</h3>

    <form method="post" action="index.jsp">

        <label for="username">Введите ваше имя:</label>
        <input type="text"
               id="username"
               name="username"
               maxlength="40"
               required
               placeholder="Например, Rifat">

        <label for="color">Выберите цвет страницы:</label>

        <select id="color" name="color">
            <option value="lightblue">Голубой</option>
            <option value="lightgreen">Зелёный</option>
            <option value="lightyellow">Жёлтый</option>
        </select>

        <button type="submit">Показать результат</button>

    </form>
</div>
</body>
</html>

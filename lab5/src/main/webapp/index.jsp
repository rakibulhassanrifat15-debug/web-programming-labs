<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа №5</title>
</head>
<body>

<h1>Список книг</h1>
<p>Введите имя читателя:</p>

<form action="BookList.jsp" method="get">
    <label for="name">Имя:</label>
    <input type="text" id="name" name="name">

    <button type="submit">Показать книги</button>
</form>

</body>
</html>

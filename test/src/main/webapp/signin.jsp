<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html lang="tr">
<head>
    <title>Giriş Yap</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Giriş Yap</h1>

    <!-- Hata Mesajı -->
    <c:if test="${param.error == 'true'}">
        <div class="alert alert-danger mt-3">Geçersiz kullanıcı adı veya şifre!</div>
    </c:if>

    <!-- Giriş Formu -->
    <form action="signinServlet" method="post" class="mt-4">
        <div class="mb-3">
            <label for="username" class="form-label">Kullanıcı Adı</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Şifre</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Giriş Yap</button>
    </form>
</div>
</body>
</html>

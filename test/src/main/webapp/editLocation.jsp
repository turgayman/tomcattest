<%@ page session="true"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Giriş yapmamış kullanıcıları engelle --%>
<c:if test="${empty sessionScope.username}">
    <script>
        alert('Bu sayfayı görmeye yetkiniz yok. Lütfen giriş yapın.');
        window.location.href = 'signin.jsp';  // Giriş sayfasına yönlendir
    </script>
</c:if>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kutlay Serkan - Mezun Portal</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Mezun Portal</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Ana Sayfa</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Hakkımızda</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">İletişim</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="addStudent.jsp">Öğrenci
							Ekle</a></li>
					<li class="nav-item"><a class="nav-link" href="list">Öğrenciler</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="locationServlet">Harita</a></li>
					
					<!-- Kullanıcı adı oturumda varsa, Hoşgeldiniz mesajını göster -->
					<c:if test="${not empty sessionScope.username}">
						<li class="nav-item"><a class="nav-link">Hoşgeldiniz, ${sessionScope.username}!</a></li>
						<li class="nav-item"><a class="nav-link" href="logoutServlet">Çıkış
								Yap</a></li>
					</c:if>

					<!-- Kullanıcı adı oturumda yoksa, Giriş butonunu göster -->
					<c:if test="${empty sessionScope.username}">
					<li class="nav-item"><a class="nav-link" href="signupServlet">Kayıt</a>
					</li>
						<li class="nav-item"><a class="nav-link" href="signinServlet">Giriş</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	
	
	<div class="container">
		<h1>Konum Ekle/Düzenle</h1>
		<form action="saveLocationServlet" method="post">
			<!-- Öğrenci ID'sini gizli input olarak gönderiyoruz -->
			<input type="text" name="studentId" value="${student.id}">
			<!-- student.id yerine location.studentId olacak -->

			Şehir: <input type="text" name="city" value="${location.city}"
				required><br> Enlem: <input type="text" name="latitude"
				value="${location.latitude}" required><br> Boylam: <input
				type="text" name="longitude" value="${location.longitude}" required><br>

			<button type="submit">Kaydet</button>
		</form>
	</div>

	<footer class="bg-dark text-white text-center py-3 mt-5"> ©
		2024 Kutlay Serkan Mezun Portal. Tüm Hakları Saklıdır. </footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

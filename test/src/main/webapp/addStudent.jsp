<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Giriş yapmamış kullanıcıları engelle --%>
<c:if test="${empty sessionScope.username}">
    <script>
        alert('Bu sayfayı görmeye yetkiniz yok. Lütfen giriş yapın.');
        window.location.href = 'signin.jsp';  // Giriş sayfasına yönlendir
    </script>
</c:if>
<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Öğrenci Ekle</title>
<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
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
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="index.jsp">Ana Sayfa</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Hakkımızda</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">İletişim</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="addStudent.jsp">Öğrenci
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
		<h2 class="mt-5">Öğrenci Ekle</h2>
		<form action="addStudentServlet" method="post">
			<div class="mb-3">
				<label for="adi" class="form-label">Adı</label> <input type="text"
					class="form-control" id="adi" name="adi" required>
			</div>
			<div class="mb-3">
				<label for="soyadi" class="form-label">Soyadı</label> <input
					type="text" class="form-control" id="soyadi" name="soyadi" required>
			</div>
			<div class="mb-3">
				<label for="mezuniyetYili" class="form-label">Mezuniyet Yılı</label>
				<input type="number" class="form-control" id="mezuniyetYili"
					name="mezuniyetYili" required>
			</div>
			<button type="submit" class="btn btn-primary">Kaydet</button>
		</form>
	</div>
	<!-- Footer -->
	<footer class="bg-dark text-white text-center py-3 mt-5"> ©
		2024 Kutlay Serkan Mezun Portal. Tüm Hakları Saklıdır. </footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

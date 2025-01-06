<%@ page session="true"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
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
						aria-current="page" href="index.jsp">Ana Sayfa</a></li>
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

	<!-- Ana İçerik -->
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-12 text-center">
				<h1 class="mb-4 display-4">Kutlay Serkan - Mezun Portal</h1>
				<h4 class="text-muted">Mezunlar Portalına Hoşgeldiniz</h4>
			</div>
		</div>

		<!-- Kartlar -->
		<div class="row mt-5">
			<div class="col-md-4">
				<div class="card">
					<img src="https://via.placeholder.com/300x200" class="card-img-top"
						alt="Profil">
					<div class="card-body">
						<h5 class="card-title">Profil</h5>
						<p class="card-text">Profil bilgilerinizi görüntüleyebilir ve
							düzenleyebilirsiniz.</p>
						<a href="#" class="btn btn-primary">Profilim</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img src="https://via.placeholder.com/300x200" class="card-img-top"
						alt="Etkinlikler">
					<div class="card-body">
						<h5 class="card-title">Etkinlikler</h5>
						<p class="card-text">Geçmiş ve gelecek etkinlikleri inceleyin.</p>
						<a href="#" class="btn btn-success">Etkinlikler</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img src="https://via.placeholder.com/300x200" class="card-img-top"
						alt="Bağlantılar">
					<div class="card-body">
						<h5 class="card-title">Bağlantılar</h5>
						<p class="card-text">Diğer mezunlarla iletişim kurun.</p>
						<a href="#" class="btn btn-warning">Bağlantılarım</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<img src="https://via.placeholder.com/300x200" class="card-img-top"
						alt="Harita">
					<div class="card-body">
						<h5 class="card-title">Harita</h5>
						<p class="card-text">Öğrencilerin konumlarını haritada
							görüntüleyin.</p>
						<a href="locationServlet" class="btn btn-info">Haritayı Gör</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-dark text-white text-center py-3 mt-5"> ©
		2024 Kutlay Serkan Mezun Portal. Tüm Hakları Saklıdır. </footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

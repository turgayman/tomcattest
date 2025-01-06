<%@ page session="true"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


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
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="index.jsp">Ana Sayfa</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Hakkımızda</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">İletişim</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="addStudent.jsp">Öğrenci
							Ekle</a></li>
					<li class="nav-item"><a class="nav-link active" href="list">Öğrenciler</a>
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
		<h1>${greetingMessage}</h1>
		<h1>Öğrenci Listesi</h1>
		<table border="1">
			<thead>
				<tr>
					<th>Adı</th>
					<th>Soyadı</th>
					<th>Mezuniyet Yılı</th>
				</tr>
			</thead>
			<tbody>
				<!-- Öğrenciler listesi -->
				<c:forEach var="student" items="${students}">
					<tr>
						<td>${student.adi}</td>
						<td>${student.soyadi}</td>
						<td>${student.mezuniyetYili}</td>
						<td>
							<form action="editLocationServlet" method="get">
								<input type="hidden" name="studentId"
									value="${student.id.toString()}">
								<button type="submit">Konum Ekle/Düzenle</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<footer class="bg-dark text-white text-center py-3 mt-5"> ©
		2024 Kutlay Serkan Mezun Portal. Tüm Hakları Saklıdır. </footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

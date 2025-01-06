<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kutlay Serkan - Mezun Portal</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAn7G9F1CqcYB9fdy9sVYJOI4kEidY0jF4"></script>
<script>
        function initMap() {
            const map = new google.maps.Map(document.getElementById("map"), {
                center: { lat: 39.92077, lng: 32.85411 }, // Türkiye merkez koordinatları
                zoom: 6
            });

            const locations = [
                <c:forEach var="location" items="${locations}">
                    {
                    	city: '<c:out value="${location.city}" escapeXml="true" />',
                        lat: ${location.latitude},
                        lng: ${location.longitude}
                    },
                </c:forEach>
            ];

            locations.forEach(location => {
                const marker = new google.maps.Marker({
                    position: { lat: location.lat, lng: location.lng },
                    map: map,
                    title: location.city
                });

                const infoWindow = new google.maps.InfoWindow({
                    content: `Şehir: ${location.city}`
                });

                marker.addListener("click", () => {
                    infoWindow.open(map, marker);
                });
            });
            
            console.log(locations);
        }

    </script>
</head>
<body onload="initMap()">

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
					<li class="nav-item"><a class="nav-link" href="list">Öğrenciler</a>
					</li>
					<li class="nav-item"><a class="nav-link active"
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
		<h1>Öğrenci Haritası</h1>
		<div id="map" style="width: 100%; height: 500px;"></div>

	</div>

	<footer class="bg-dark text-white text-center py-3 mt-5"> ©
		2024 Kutlay Serkan Mezun Portal. Tüm Hakları Saklıdır. </footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

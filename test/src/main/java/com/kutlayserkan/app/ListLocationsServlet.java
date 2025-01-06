package com.kutlayserkan.app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/listLocationsServlet")
public class ListLocationsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // LocationService sınıfından tüm konumları alıyoruz
        LocationService locationService = new LocationService();
        List<StudentLocations> locations = locationService.getAllLocations(); // getAllLocations metodu, tüm konumları dönecek

        // Konumları request'e ekliyoruz ve listLocations.jsp'ye yönlendiriyoruz
        request.setAttribute("locations", locations);
        request.getRequestDispatcher("listLocations.jsp").forward(request, response);
    }
}

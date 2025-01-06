package com.kutlayserkan.app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.bson.types.ObjectId;

import java.io.IOException;

@WebServlet("/saveLocationServlet")
public class SaveLocationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Formdan gelen verileri alıyoruz
            ObjectId studentId = new ObjectId(request.getParameter("studentId"));
            String city = request.getParameter("city");
            double latitude = Double.parseDouble(request.getParameter("latitude"));
            double longitude = Double.parseDouble(request.getParameter("longitude"));

            // Konum bilgisini kaydetme işlemi
            LocationService locationService = new LocationService();
            locationService.saveLocation(new StudentLocations(studentId, city, latitude, longitude));

            // Ana sayfaya yönlendirme
            response.sendRedirect("listLocations.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error while saving location: " + e.getMessage());
        }
    }
}

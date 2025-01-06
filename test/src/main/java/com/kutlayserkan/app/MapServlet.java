package com.kutlayserkan.app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.bson.types.ObjectId;

import java.io.IOException;

@WebServlet("/mapServlet")
public class MapServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // studentId parametresini ObjectId olarak alıyoruz
        ObjectId studentId = new ObjectId(request.getParameter("studentId"));  // ObjectId kullanıyoruz

        // Öğrenci ve konum bilgilerini al
        LocationService locationService = new LocationService();
        StudentLocations location = locationService.getLocationByStudentId(studentId);

        // Eğer location null değilse, veriyi gönder
        if (location != null) {
            request.setAttribute("location", location);
            request.getRequestDispatcher("/map.jsp").forward(request, response);
        } else {
            // Konum bulunamadıysa, uygun bir hata mesajı gösterebiliriz
            response.getWriter().println("Öğrenci konumu bulunamadı.");
        }
    }
}

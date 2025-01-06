package com.kutlayserkan.app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import org.bson.types.ObjectId;

@WebServlet("/editLocationServlet")
public class EditLocationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gelen öğrenci ID'sini String olarak alıyoruz
        String studentIdString = request.getParameter("studentId");

        // ObjectId'yi oluşturuyoruz
        ObjectId studentId = new ObjectId(studentIdString); // ObjectId olarak dönüştürülür

        // Öğrenci bilgilerini al
        StudentService studentService = new StudentService();
        StudentModel student = studentService.getStudentById(studentId); // ObjectId ile öğrenci bilgilerini al

        // Öğrenci konumunu al
        LocationService locationService = new LocationService();
        StudentLocations location = locationService.getLocationByStudentId(studentId); // Öğrenci ID'si ile konum bilgisini al

        // Öğrenci ve konum bilgilerini request'e ekleyip yönlendirelim
        request.setAttribute("student", student);
        request.setAttribute("location", location);
        request.getRequestDispatcher("editLocation.jsp").forward(request, response);
    }
}

package com.kutlayserkan.app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/locationServlet")
public class LocationServlet extends HttpServlet {
    private StudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<StudentLocations> locations = studentService.getAllStudentLocations();
        req.setAttribute("locations", locations);
        req.getRequestDispatcher("/map.jsp").forward(req, resp);
    }
}
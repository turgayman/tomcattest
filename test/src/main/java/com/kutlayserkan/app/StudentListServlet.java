package com.kutlayserkan.app;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/list") // URL pattern
public class StudentListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Öğrencileri almak için StudentService kullan
        StudentService studentService = new StudentService();
        List<StudentModel> students = studentService.getAllStudents();
//        
//
//        // Öğrencileri request'e ekle
        request.setAttribute("students", students);
//
//        // JSP'yi yönlendir
        request.getRequestDispatcher("students.jsp").forward(request, response);
    	

    }
}
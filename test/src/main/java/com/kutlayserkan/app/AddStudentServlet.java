package com.kutlayserkan.app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addStudentServlet")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String adi = request.getParameter("adi");
        String soyadi = request.getParameter("soyadi");
        int mezuniyetYili = Integer.parseInt(request.getParameter("mezuniyetYili"));

        // Student nesnesi oluştur
        StudentModel student = new StudentModel(adi, soyadi, mezuniyetYili);

        // StudentService ile MongoDB'ye kaydet
        StudentService studentService = new StudentService();
        studentService.saveStudent(student);

        // Kullanıcıyı başka bir sayfaya yönlendir
        response.sendRedirect("studentSuccess.jsp"); // Başarı mesajı sayfasına yönlendir
    }
}

package com.kutlayserkan.app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/signupServlet")
public class SignUpServlet extends HttpServlet {

    private UserService userService = new UserService();

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("signup.jsp"); // Giriş sayfasına yönlendir
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kullanıcıyı kaydet
        userService.saveUser(username, password);

        // Başarılı olunca giriş sayfasına yönlendir
        response.sendRedirect("signin.jsp");
    }
    
    
}
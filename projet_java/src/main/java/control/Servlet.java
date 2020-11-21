package control;

import Utils.MyConstants;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

public class Servlet extends HttpServlet {
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("loginForm") == null) {
            request.getRequestDispatcher(MyConstants.LOGIN_JSP).forward(request, response);
        } else {
            User myUser = new User();
            myUser.setUsername(request.getParameter("loginForm"));
            myUser.setPassword(request.getParameter("passForm"));

            if (checkCredentials(myUser)) {
                request.setAttribute("keyUser", myUser);
                request.getRequestDispatcher(MyConstants.WELCOME_PAGE).forward(request, response);
            } else {
                request.setAttribute("keyErrMsg", MyConstants.ERROR_MESSAGE);
                request.getRequestDispatcher(MyConstants.LOGIN_JSP).forward(request, response);
            }
        }
    }
    
    
    private boolean checkCredentials(User myUser) {
        //fetch variables in the web.xml 
        String goodLogin = getServletConfig().getInitParameter("goodLogin");
        String goodPass = getServletConfig().getInitParameter("goodPass");
        return myUser.getUsername().equals(goodLogin) && myUser.getPassword().equals(goodPass);
    }
    
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}

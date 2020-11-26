package control;


import Utils.MyConstants;
import static database.DataServices.QUERY_SEL_ALL;
import model.User;
import model.Friend;    ///Classs Friend is for the moment used to test db requests

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Servlet extends HttpServlet {

    boolean DEBUGGING = true;
    
    
    ///Database connection & output
    private Connection conn;
    private ResultSet res;
    
    ///Get and display list of friends
    private ArrayList <Friend> listOfFriends;   ///Classs Friend is for the moment used to test db requests
    
    
    ///Connection to web app
    User myUser = new User();
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("loginForm") == null) {
            request.getRequestDispatcher(MyConstants.LOGIN_JSP).forward(request, response);
        } else {
            myUser.setUsername(request.getParameter("loginForm"));
            myUser.setPassword(request.getParameter("passForm"));

            if (checkCredentials(myUser)) {
                conn = ConnectToDB();
                res = SubmitQuery(conn, QUERY_SEL_ALL);

                try {
                    listOfFriends = new ArrayList <Friend> ();

                    ///Create and send list of friends
                    while (res.next()) {
                        /*Friend aFriend = new Friend();
                        
                        aFriend.setFirstName(res.getString("FIRSTNAME"));
                        aFriend.setLastName(res.getString("NAME"));
                        listOfFriends.add(aFriend);*/
                        listOfFriends.add(
                                new Friend(
                                        res.getString("FIRSTNAME"), 
                                        res.getString("NAME")));
                    }
                    request.setAttribute("keyListOfFriends", listOfFriends);
                    
                } catch (SQLException sqle) {
                    Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, sqle);
                }

                request.setAttribute("keyUser", myUser);
                request.getRequestDispatcher(MyConstants.WELCOME_PAGE).forward(request, response);
            } else {
                request.setAttribute("keyErrMsg", MyConstants.ERROR_MESSAGE);
                request.getRequestDispatcher(MyConstants.LOGIN_JSP).forward(request, response);
            }
        }
    }
    
    
    
    /**
     * Checks if the values entered by the user are valid credentials.
     * @param myUser Java Bean to store (box) the data entered by the user
     * @return boolean true or false if the values entered are valid credentials or not
     */
    private boolean checkCredentials(User myUser) {
        //fetch variables in the web.xml 
        String goodLogin = getServletConfig().getInitParameter("goodLogin");
        String goodPass = getServletConfig().getInitParameter("goodPass");
        
        return myUser.getUsername().equals(goodLogin) && myUser.getPassword().equals(goodPass);
    }
    
    
    
    private Properties getPropertiesFile()
            throws IOException {
        Properties dbProperties;
        InputStream dbInput;
        
        dbProperties = new Properties();
        dbInput = getServletContext().getResourceAsStream("/WEB-INF/database.properties");
        dbProperties.load(dbInput);
        
        return dbProperties;
    }
    
    
    
    
    
    public Connection ConnectToDB() {
        Connection connection = null;
        String db_URL;
        String db_login;
        String db_password;
        
        try {
            db_URL = getPropertiesFile().getProperty("DB_URL");
            db_login = getPropertiesFile().getProperty("DB_USERNAME");
            db_password = getPropertiesFile().getProperty("DB_PASSWORD");
            
            try {
                connection = DriverManager.getConnection(db_URL, db_login, db_password);
                
                return connection;
            } catch (SQLException sqle) {
                Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, sqle);
            }
            
            return connection;
            
        } catch (IOException IOe) {
            Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, IOe);
        }
        
        return connection;
    }
    
    public ResultSet SubmitQuery (Connection DBConnection, String query) {
        ResultSet res = null;
        Statement myStatement;
        
        try {
            myStatement = DBConnection.createStatement();
            res = myStatement.executeQuery(query);
            
            return res;
        } catch (SQLException sqle) {
            Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, sqle);
        }
        
        return res;
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

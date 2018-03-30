package com.database;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class editbookdetails
 */
@WebServlet("/editbookdetails")
public class editbookdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public int ss;
    /**
     * @see HttpServlet#HttpServlet()
     */
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		Connection con = Dbconnect.connect();
		PreparedStatement st = null;
		Statement stat = null;
		ResultSet res = null;
		
		String id = request.getParameter("id");
		
		  ss = Integer.parseInt(id);
		  
		
	
		try {
		
			stat = con.createStatement();
			
			
			String sql = "select * from books where bookId='"+ss+"'";
			res = stat.executeQuery(sql);

			while(res.next()){

//			String a = request.getParameter("title");
//			String b = request.getParameter("category");
//			String c = request.getParameter("keywords");
//			String d = request.getParameter("author");
//			String e = request.getParameter("language");
//			String f = request.getParameter("country");
//			String g = request.getParameter("publisher");
//			String h = request.getParameter("publishDate");
			
			String a = res.getString(1);
			String b = res.getString(2);
			String c = res.getString(3);
			String d = res.getString(4);
			String e = res.getString(5);
			String f = res.getString(6);
			String g = res.getString(7);
			String h = res.getString(8);
			String i = res.getString(9); 
			
			

//
			request.setAttribute("id",a);
			request.setAttribute("title",b);		
			request.setAttribute("category",c);
			request.setAttribute("keywords",d);
			request.setAttribute("author",e);
			request.setAttribute("language",f);
			request.setAttribute("country",g);
			request.setAttribute("publisher",h);
			request.setAttribute("publishDate",i);
			
			
			request.getRequestDispatcher("updatebookdetails.jsp").forward(request,response);
			}

						


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
		
		
		
	}

}

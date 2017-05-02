package com.kaishengit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class BaseServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public static void jsonRender(Object obj, HttpServletResponse resp) throws IOException{
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;UTF-8");
		
		PrintWriter out = resp.getWriter();
		String json = new Gson().toJson(obj);
		
		out.print(json);
		out.flush();
		out.close();
		
	}

}

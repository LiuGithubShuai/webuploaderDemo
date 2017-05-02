package com.kaishengit.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Part part = req.getPart("file");
		System.out.println("size！！>"+part.getSize());
		
		String contentType = part.getContentType();
		System.out.println("contentType！！>"+contentType);
		
		Map<String,Object> result = new HashMap<>();
		result.put("state", "success");
		result.put("data", "1234");
		
		jsonRender(result,resp);
	}

}

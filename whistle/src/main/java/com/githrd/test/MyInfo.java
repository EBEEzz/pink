package com.githrd.test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.githrd.test.dao.*;
import com.githrd.test.vo.*;

@WebServlet("/test/myInfo.pink")
public class MyInfo extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mid = req.getParameter("id");
		
		MemberDao mDao = new MemberDao();
		MemberVO mVO = mDao.getInfo(mid);
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter pw = resp.getWriter();
		pw.println("{");
		pw.println("\"mno\": \"" + mVO.getMno() + "\",");
		pw.println("\"name\": \"" + mVO.getName() + "\",");
		pw.println("\"id\": \"" + mVO.getId() + "\",");
		pw.println("\"mail\": \"" + mVO.getMail() + "\",");
		pw.println("\"tel\": \"" + mVO.getTel() + "\",");
		pw.println("\"gen\": \"" + mVO.getGen() + "\",");
		pw.println("\"savename\": \"" + mVO.getSavename() + "\",");
		pw.println("\"sdate\": \"" + mVO.getSdate() + "\"");
		pw.println("}");
	}

}

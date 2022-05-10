package com.githrd.test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.githrd.test.dao.*;

//@WebServlet("/test/loginAjax.pink")
public class LoginAjax extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//0. 세션 검사
		HttpSession session = req.getSession();
		if(session.getAttribute("SID") != null) {
			resp.sendRedirect("/whistle/");
			return;
		}
		//1. 파라미터 받기
		String pid = req.getParameter("id");
		String ppw = req.getParameter("pw");
		//임시비밀번호
		ppw = "12345";
		
		//2. 데이터베이스 작업하고 결과 받기
		MemberDao mDao = new MemberDao();
		int cnt = mDao.getLoginCnt(pid, ppw);
		//3. 결과에 따라 처리
		//문서 제작 도구 꺼내오기
		PrintWriter pw = resp.getWriter();
		pw.println("{");
		if(cnt == 1) {
			//로그인 처리
			session.setAttribute("SID", pid);
			pw.println("\"result\": \"OK\"");
		} else {
			pw.println("\"result\": \"NO\"");
		}
		pw.println("}");
	}

}

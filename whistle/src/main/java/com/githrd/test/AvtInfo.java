package com.githrd.test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.githrd.test.dao.*;
import com.githrd.test.vo.*;

@WebServlet("/test/avtInfo.pink")
public class AvtInfo extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 파라미터 꺼내기
		String sno = req.getParameter("ano");
		int ano = Integer.parseInt(sno);
		//2. 데이터베이스 작업해서 결과받기
		AvatarDao aDao = new AvatarDao();
		AvatarVO aVO = aDao.getAnoInfo(ano);
		//3. 응답문서 만들기(ano, savename, dir, gen)
		PrintWriter pw = resp.getWriter();	//응답문서도구 가져오기
		/*
		pw.println("{");
		pw.println("\"ano\": \"" + aVO.getAno() + "\",");
		pw.println("\"savename\": \"" + aVO.getSavename() + "\",");
		pw.println("\"dir\": \"" + aVO.getDir() + "\",");
		pw.println("\"gen\": \"" + aVO.getGen() + "\"");
		pw.println("}");
		*/
		pw.print(aVO.getJson());
	}

}

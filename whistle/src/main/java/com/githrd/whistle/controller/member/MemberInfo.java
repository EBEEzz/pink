package com.githrd.whistle.controller.member;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.githrd.whistle.controller.*;

public class MemberInfo implements BlpInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sno = req.getParameter("mno");
		// 출력
		System.out.println("#### param mno : " + sno);
		return null;
	}

}
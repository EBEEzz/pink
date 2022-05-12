package com.githrd.whistle.controller.member;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.githrd.whistle.controller.BlpInter;

public class JoinProc implements BlpInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("isRedirect", true);;
		String view = "/whistle/main.blp";
		return view;
	}

}

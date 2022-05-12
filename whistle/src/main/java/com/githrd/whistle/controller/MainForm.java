package com.githrd.whistle.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class MainForm implements BlpInter {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view ="/main";
		return view;
	}

}

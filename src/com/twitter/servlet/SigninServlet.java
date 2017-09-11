package com.twitter.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twitter.dao.SigninDao;
import com.twitter.dao.UsersDao;
import com.twitter.pojo.Signin;
import com.twitter.pojo.Users;
import com.twitter.util.Times;

@WebServlet("/signin.do")
public class SigninServlet extends HttpServlet {
	private UsersDao usersDao = new UsersDao();
	private SigninDao signinDao = new SigninDao();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String method = request.getParameter("method");

		if ("online".equals(method)) {
			toOnline(request, response);
		}
	}

	private void toOnline(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("index.jsp");
			return;
		}

		int uid = user.getUid();
		int n = usersDao.updateOnline(1, uid);

		Timestamp stime = Times.getSystemTime();
		int m = signinDao.addUp(uid, stime);

		Signin signin = signinDao.selSignal(uid, stime);
		int sid = signin.getSid();
		session.setAttribute("signinid", sid);
		response.sendRedirect("main.jsp");
	}
}

package com.twitter.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twitter.dao.AdloginDao;
import com.twitter.dao.AdminsDao;
import com.twitter.dao.SigninDao;
import com.twitter.dao.TweetsDao;
import com.twitter.dao.UsersDao;
import com.twitter.dao.UsersinfoDao;
import com.twitter.pojo.Adlogin;
import com.twitter.pojo.Admins;
import com.twitter.pojo.Signin;
import com.twitter.pojo.Usersall;
import com.twitter.pojo.Utweets;
import com.twitter.util.Times;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/admin.do")
public class AdminServlet extends HttpServlet {
	private AdminsDao adminsDao = new AdminsDao();
	private AdloginDao adloginDao = new AdloginDao();
	private TweetsDao tweetsDao = new TweetsDao();
	private UsersDao usersDao = new UsersDao();
	private UsersinfoDao usersinfoDao = new UsersinfoDao();
	private SigninDao signinDao = new SigninDao();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String method = request.getParameter("method");
		if ("checklogin".equals(method)) {
			doCheck(request, response);
		}

		if ("exit".equals(method)) {
			toExit(request, response);
		}

		if ("catnum".equals(method)) {
			toCatNum(request, response);
		}
		if ("getinfo".equals(method)) {
			toGetInfo(request, response);
		}
		if ("gettweet".equals(method)) {
			toGetTweet(request, response);
		}
		if ("deltweet".equals(method)) {
			toDelTweet(request, response);
		}
		if ("updatestate".equals(method)) {
			toUpdateState(request, response);
		}
	}

	private void toUpdateState(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String uid = request.getParameter("uid");
		String state = request.getParameter("state");
		int n = 0;
		if ("ting".equals(state.trim())) {
			n = usersDao.updateState(uid, "0");
		} else {
			n = usersDao.updateState(uid, "1");
		}
		if (n > 0) {
			response.sendRedirect("admin.do?method=getinfo");
		}
	}

	private void toDelTweet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tid = request.getParameter("tid");
		int n = tweetsDao.delTweet(tid);
		String uid = request.getParameter("uid");
		if (n > 0) {
			int m = usersinfoDao.delTweetsNum(Integer.parseInt(uid));
			if (m > 0)
				response.sendRedirect("admin.do?method=gettweet");
		}

	}

	private void toGetTweet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page = 1;
		int size = 16;

		String pageString = request.getParameter("page");
		if (pageString != null && pageString.trim().length() > 0) {
			page = Integer.parseInt(pageString);
		}
		String cn = request.getParameter("cn");
		if (page < 1) {
			page = 1;
		}
		int count = tweetsDao.getTwettNum(cn);
		int pageCount = count % size == 0 ? count / size : count / size + 1;

		if (page > pageCount) {
			page = pageCount;
		}
		List<Utweets> list = new ArrayList<Utweets>();
		if (page > 0) {
			list = tweetsDao.getAllTweets(page, size, cn);
		}
		Map map = new HashMap();
		map.put("list", list);
		map.put("page", page);
		map.put("pageCount", pageCount);
		map.put("count", count);

		request.setAttribute("map", map);

		request.getRequestDispatcher("tweet.jsp").forward(request, response);
	}

	private void toGetInfo(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int page = 1;
		int size = 16;

		String pageString = request.getParameter("page");

		String cn = request.getParameter("cn");
		if (pageString != null && pageString.trim().length() > 0) {
			page = Integer.parseInt(pageString);
		}

		if (page < 1) {
			page = 1;
		}
		int count = usersinfoDao.getCount(cn);
		int pageCount = count % size == 0 ? count / size : count / size + 1;

		if (page > pageCount) {
			page = pageCount;
		}
		List<Usersall> list = new ArrayList<Usersall>();
		if (page > 0) {
			list = usersinfoDao.fenye(page, size, cn);
			if (list != null) {
				for (Usersall usersall : list) {
					Signin signin = signinDao.getLastSignin(usersall.getUid());
					if (signin == null) {
						usersall.setLastTime(null);
					} else {
						usersall.setLastTime(signin.getStime());
					}
				}
			}

		}
		Map map = new HashMap();
		map.put("list", list);
		map.put("page", page);
		map.put("size", size);
		map.put("pageCount", pageCount);
		map.put("count", count);

		request.setAttribute("map", map);

		request.getRequestDispatcher("user.jsp").forward(request, response);
	}

	private void toCatNum(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ServletContext application = request.getSession().getServletContext();
		Integer onlineNum = (Integer) application.getAttribute("onlineNum");
		if (onlineNum == null) {
			onlineNum = 0;
		}
		int tweetsNum = tweetsDao.getTwettNum(null);
		int userNum = usersDao.getUserNum();
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String time = df.format(date);
		int fangwen = usersDao.getDayUp(time);
		response.getWriter().print(onlineNum + "-" + tweetsNum + "-" + userNum + "-" + fangwen);
	}

	private void toExit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		if (session.getAttribute("user") == null) {
			session.invalidate();
			response.sendRedirect("backend.jsp");
			return;
		}
		Object adid = session.getAttribute("adid");
		Admins admin = (Admins) session.getAttribute("admin");
		Timestamp sdtime = Times.getSystemTime();
		int aid = admin.getAid();
		adminsDao.updateOnline(0, aid);
		adloginDao.updateSignin((Integer) adid, sdtime);
		response.sendRedirect("backend.jsp");
	}

	private void doCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Admins admin = adminsDao.checkLogin(username, password);

		if (admin == null) {
			response.sendRedirect("backend.jsp");
			return;
		}

		HttpSession session = request.getSession();
		session.setAttribute("admin", admin);

		doAddLogin(request, response);
	}

	private void doAddLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Admins admin = (Admins) session.getAttribute("admin");
		if (admin == null) {
			response.sendRedirect("backend.jsp");
			return;
		}
		int aid = admin.getAid();
		Timestamp aditime = Times.getSystemTime();
		int m = adloginDao.addUp(aid, aditime);
		if (m > 0) {
			Adlogin adlogin = adloginDao.selSignal(aid, aditime);
			if (adlogin == null) {
				response.sendRedirect("backend.jsp");
				return;
			}
			int adid = adlogin.getAdid();
			adminsDao.updateOnline(1, aid);
			session.setAttribute("adid", adid);
			response.sendRedirect("page.jsp");
		}
	}
}

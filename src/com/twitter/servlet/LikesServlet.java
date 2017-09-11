package com.twitter.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twitter.dao.LikesDao;
import com.twitter.dao.NotificationDao;
import com.twitter.dao.TweetsDao;
import com.twitter.pojo.Users;
import com.twitter.util.Times;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/like.do")
public class LikesServlet extends HttpServlet {
	private LikesDao likesDao = new LikesDao();
	private TweetsDao tweetsDao = new TweetsDao();
	private NotificationDao notificationDao = new NotificationDao();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();
		Timestamp ltime = Times.getSystemTime();
		String method = request.getParameter("method");
		String tid = request.getParameter("tid");
		String uuid = request.getParameter("uid");
		int n = 0;
		if ("add".equals(method)) {
			n = likesDao.addLikes(uid, Integer.parseInt(tid), ltime);
			if (n > 0) {
				if (uid != Integer.parseInt(uuid))
					notificationDao.addNotify(uid, 2, Integer.parseInt(uuid), Integer.parseInt(tid), 0, 0, 0, 0, 0,
							null, ltime, 0);
				tweetsDao.addLikesNum(Integer.parseInt(tid), 1);
			}
		}

		if ("del".equals(method)) {
			n = likesDao.delLikes(uid, Integer.parseInt(tid));
			if (n > 0) {
				tweetsDao.addLikesNum(Integer.parseInt(tid), 0);
			}
		}
	}
}

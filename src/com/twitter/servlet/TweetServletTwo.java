package com.twitter.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twitter.dao.ConcernDao;
import com.twitter.dao.ForwardsDao;
import com.twitter.dao.LikesDao;
import com.twitter.dao.NotificationDao;
import com.twitter.dao.ReplysDao;
import com.twitter.dao.TweetsDao;
import com.twitter.dao.UsersinfoDao;
import com.twitter.pojo.Concern;
import com.twitter.pojo.Forwards;
import com.twitter.pojo.Users;
import com.twitter.pojo.Usersall;
import com.twitter.pojo.Usersinfo;
import com.twitter.pojo.Utweets;
import com.twitter.util.Times;
import com.twitter.util.Upload;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class TweetServlet
 */
@WebServlet("/tweettwo.do")
public class TweetServletTwo extends HttpServlet {

	private ConcernDao concernDao = new ConcernDao();
	private TweetsDao tweetsDao = new TweetsDao();
	private UsersinfoDao usersinfoDao = new UsersinfoDao();
	private ForwardsDao forwardsDao = new ForwardsDao();
	private LikesDao likesDao = new LikesDao();
	private NotificationDao notificationDao = new NotificationDao();
	private ReplysDao replysDao = new ReplysDao();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String method = request.getParameter("method");
		if ("newt".equals(method)) {
			try {
				toNew(request, response);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if ("gettweets".equals(method)) {
			try {
				toGetTweets(request, response);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		if ("gettweet".equals(method)) {
			try {
				toGetTweet(request, response);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		if ("delt".equals(method)) {
			delTweet(request, response);
		}

		if ("getnewtweets".equals(method)) {
			getNewTweets(request, response);
		}

		if ("zhuantui".equals(method)) {
			toZhuanTui(request, response);
		}

		if ("huifu".equals(method)) {
			toHuiFu(request, response);
		}
	}

	private void toHuiFu(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();
		String tid = request.getParameter("tid");
		String uuid = request.getParameter("uid");
		String neirong = request.getParameter("huifuneirong");
		Timestamp rtime = Times.getSystemTime();
		int n = replysDao.addReplys(Integer.parseInt(tid), neirong, uid, rtime);
		if (n > 0) {
			tweetsDao.addReplyNum(Integer.parseInt(tid), 1);
			if (uid != Integer.parseInt(uuid))
				notificationDao.addNotify(uid, 4, 0, 0, 0, 0, 0, Integer.parseInt(uuid), Integer.parseInt(tid), neirong,
						rtime, 0);
			response.getWriter().print("ok");
		}
	}

	private void toZhuanTui(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();

		String path = request.getSession().getServletContext().getRealPath("img/") + user.getUname();
		Map<String, String> map = Upload.upload(request, 100 * 1024 * 1024, path);
		String stid = map.get("zhuanfatid");
		String uuid = map.get("zhuanfauid");
		String tcontent = map.get("zhuanfaneirong");
		Timestamp ttime = Times.getSystemTime();
		tweetsDao.addTweet(uid, tcontent, ttime, 1);
		usersinfoDao.addTweetsNum(uid);
		tweetsDao.addForwardNum(Integer.parseInt(stid), 1);
		Usersinfo info = usersinfoDao.getInfos(uid);
		session.setAttribute("info", info);
		int tid = tweetsDao.getTid(uid, tcontent, ttime);
		if (tid > 0) {
			forwardsDao.addForward(tid, Integer.parseInt(stid), uid, ttime);
			if (uid != Integer.parseInt(uuid))
				notificationDao.addNotify(uid, 3, 0, 0, Integer.parseInt(uuid), Integer.parseInt(stid), 0, 0, 0, null,
						ttime, 0);
			response.getWriter().print("ok");
		}
	}

	private void getNewTweets(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String nowid = request.getParameter("nowid");
		if (nowid == null || "".equals(nowid)) {
			HttpSession session = request.getSession();
			Users user = (Users) session.getAttribute("user");

			if (user == null) {
				response.sendRedirect("index.jsp");
				return;
			}
			response.getWriter().write(0);
			return;
		}
		HttpSession session = request.getSession();
		String td = request.getParameter("td");
		Users user = (Users) session.getAttribute("user");

		if (user == null) {
			response.sendRedirect("index.jsp");
			return;
		}

		int uid = user.getUid();
		Usersinfo info = usersinfoDao.getInfos(uid);
		session.setAttribute("info", info);
		List<Concern> concernList = new ArrayList<Concern>();
		concernList = concernDao.getSuid(uid);
		List<Utweets> tweetsList = new ArrayList<Utweets>();

		if (concernList == null) {
			if ("top".equals(td)) {
				tweetsList = tweetsDao.getNewTweets(uid, null, nowid);
				if (tweetsList == null) {
					response.getWriter().write(0);
					return;
				}
				int tweetsNum = tweetsList.size();
				response.getWriter().write(tweetsNum + "");
				return;
			} else {
				tweetsList = tweetsDao.getNewTweets(uid, null, nowid);
				if (tweetsList == null) {
					response.getWriter().write(0);
					return;
				}
				response.getWriter().write(roll(tweetsList, uid));
				return;
			}
		}

		List<Integer> uidList = new ArrayList<Integer>();
		for (int i = 0; i < concernList.size(); i++) {
			uidList.add(concernList.get(i).getS_uid());
		}

		if ("top".equals(td)) {
			tweetsList = tweetsDao.getNewTweets(uid, uidList, nowid);
			if (tweetsList == null) {
				response.getWriter().write(0);
				return;
			}
			int tweetsNum = tweetsList.size();
			response.getWriter().write(tweetsNum + "");
		} else {
			tweetsList = tweetsDao.getNewTweets(uid, uidList, nowid);
			if (tweetsList == null) {
				response.getWriter().write(0);
				return;
			}
			response.getWriter().write(roll(tweetsList, uid));
		}

	}

	private void delTweet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String tid = request.getParameter("tid");
		int n = tweetsDao.delTweet(tid);
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();
		if (n > 0) {
			usersinfoDao.delTweetsNum(uid);
			Usersinfo info = usersinfoDao.getInfos(uid);
			session.setAttribute("info", info);
			response.getWriter().print("yes");
		}

	}

	private void toGetTweets(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		List<Concern> concernList = new ArrayList<Concern>();
		List<Utweets> tweetsList = new ArrayList<Utweets>();
		List<Utweets> tList = new ArrayList<Utweets>();
		String num = request.getParameter("num");
		String pageNum = request.getParameter("pagenum");
		int page = 0;
		int uid = user.getUid();
		Usersinfo info = usersinfoDao.getInfos(uid);
		session.setAttribute("info", info);
		String iswho = request.getParameter("who");
		if ("other".equals(iswho)) {
			Usersall who = (Usersall) session.getAttribute("who");
			int id = who.getUid();
			if (pageNum != null && pageNum.trim() != "") {
				page = Integer.parseInt(pageNum);
			}
			tweetsList = tweetsDao.getTweets(id, page);
			if (tweetsList.size() < 1) {
				return;
			}
			response.getWriter().write(roll(tweetsList, uid));
			return;
		}

		if (pageNum != null && pageNum.trim() != "") {
			page = Integer.parseInt(pageNum);
		}

		if (tList != null) {
			tweetsList = tList;
		}

		if ("one".equals(num)) {
			concernList = null;
		} else {
			concernList = concernDao.getSuid(uid);
		}
		if (concernList == null) {
			tweetsList = tweetsDao.getTweets(uid, page);
			if (tweetsList.size() < 1) {
				return;
			}
			response.getWriter().write(roll(tweetsList, uid));
			return;
		}

		List<Integer> uidList = new ArrayList<Integer>();
		for (int i = 0; i < concernList.size(); i++) {
			uidList.add(concernList.get(i).getS_uid());
		}

		tweetsList = tweetsDao.getAllTweets(uid, uidList, page);
		response.getWriter().write(roll(tweetsList, uid));
	}

	private void toNew(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException, ServletException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();

		String path = request.getSession().getServletContext().getRealPath("img/") + user.getUname();
		Map<String, String> map = Upload.upload(request, 100 * 1024 * 1024, path);
		String tuiwen = map.get("tuiwen");
		String tpic = map.get("tpic");
		Timestamp ttime = Times.getSystemTime();
		if (tpic == "") {
			tweetsDao.addTweet(uid, tuiwen, ttime, 0);
			usersinfoDao.addTweetsNum(uid);
			Usersinfo info = usersinfoDao.getInfos(uid);
			ServletContext application = session.getServletContext();
			Integer newTweetNum = (Integer) application.getAttribute("newTweetNum");
			if (newTweetNum == null) {
				newTweetNum = 1;
			} else {
				newTweetNum += 1;
			}
			application.setAttribute("newTweetNum", newTweetNum);
			session.setAttribute("info", info);
			return;
		}

		tweetsDao.addPicTweet(uid, tuiwen, ttime, tpic);
		usersinfoDao.addTweetsNum(uid);
		ServletContext application = session.getServletContext();
		Integer newTweetNum = (Integer) application.getAttribute("newTweetNum");
		if (newTweetNum == null) {
			newTweetNum = 1;
		} else {
			newTweetNum += 1;
		}
		application.setAttribute("newTweetNum", newTweetNum);
		Usersinfo info = usersinfoDao.getInfos(uid);
		session.setAttribute("info", info);

		toGetTweet(request, response);
	}

	private void toGetTweet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		List<Concern> concernList = new ArrayList<Concern>();
		List<Utweets> tweetsList = new ArrayList<Utweets>();
		List<Utweets> tList = new ArrayList<Utweets>();

		if (tList != null) {
			tweetsList = tList;
		}
		if (user == null) {
			response.sendRedirect("index.jsp");
			return;
		}
		int uid = user.getUid();
		Usersinfo info = usersinfoDao.getInfos(uid);
		session.setAttribute("info", info);

		concernList = concernDao.getSuid(uid);
		if (concernList == null) {
			tweetsList = tweetsDao.getTweet(uid);
			if (tweetsList.size() < 1) {
				return;
			}
			response.getWriter().write(roll(tweetsList, uid));
			return;
		}

		List<Integer> uidList = new ArrayList<Integer>();
		for (int i = 0; i < concernList.size(); i++) {

			uidList.add(concernList.get(i).getS_uid());
		}

		tweetsList = tweetsDao.getTweet(uid);

		response.getWriter().write(roll(tweetsList, uid));
	}

	public JSONObject getJsonObj(int tid, int uid, String tcontent, String tpic, String tvideo, int treply,
			int tforward, int tlike, String uname, String upwd, String urealname, String uaite, int uonline,
			String uabout, String ulogo, String ubg, int ufans, int utweet, int ufollow, String ucolor, String time,
			Utweets utweets, int tzhuan, int zaned, int zhuaned) {
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("tid", tid + "");
		jsonobj.put("uid", uid + "");
		jsonobj.put("tcontent", tcontent + "");
		jsonobj.put("tpic", tpic + "");
		jsonobj.put("tvideo", tvideo + "");
		jsonobj.put("treply", treply + "");
		jsonobj.put("tforward", tforward + "");
		jsonobj.put("tlike", tlike + "");
		jsonobj.put("urealname", urealname + "");
		jsonobj.put("uaite", uaite + "");
		jsonobj.put("uonline", uonline + "");
		if (uabout == null) {
			jsonobj.put("uabout", "");
		} else {
			jsonobj.put("uabout", uabout + "");
		}
		jsonobj.put("ulogo", ulogo + "");
		jsonobj.put("ubg", ubg + "");
		jsonobj.put("ufans", ufans + "");
		jsonobj.put("utweet", utweet + "");
		jsonobj.put("uname", uname + "");
		jsonobj.put("ufollow", ufollow + "");
		jsonobj.put("ucolor", ucolor + "");
		jsonobj.put("time", time + "");
		if (utweets != null && utweets.getTpic() != null) {
			jsonobj.put("utweets", "{\"urealname\":\"" + utweets.getUrealname() + "\",\"uaite\":\"" + utweets.getUaite()
					+ "\",\"tcontent\":\"" + utweets.getTcontent() + "\",\"tpic\":\"" + utweets.getTpic() + "\"}");
		} else if (utweets != null && utweets.getTpic() == null) {
			jsonobj.put("utweets", "{\"urealname\":\"" + utweets.getUrealname() + "\",\"uaite\":\"" + utweets.getUaite()
					+ "\",\"tcontent\":\"" + utweets.getTcontent() + "\"}");
		} else {
			jsonobj.put("utweets", utweets + "");
		}
		jsonobj.put("tzhuan", tzhuan + "");
		jsonobj.put("zaned", zaned + "");
		jsonobj.put("zhuaned", zhuaned + "");

		return jsonobj;
	}

	public String roll(List<Utweets> tweetsList, int uid) {
		JSONArray js = new JSONArray();
		for (Utweets utweets : tweetsList) {

			if (utweets.getTzhuan() > 0) {
				Forwards forward = forwardsDao.getForward(utweets.getTid(), utweets.getTtime());
				int id = forward.getStid();
				Utweets utweet = tweetsDao.getTweetsByTid(id);
				utweets.setUtweets(utweet);
			}

			int tid = utweets.getTid();
			boolean zhuaned = forwardsDao.selForward(uid, tid);
			if (zhuaned == true)
				utweets.setZhuaned(1);
			else
				utweets.setZhuaned(0);

			boolean zaned = likesDao.selLike(uid, tid);
			if (zaned == true)
				utweets.setZaned(1);
			else
				utweets.setZaned(0);

			Timestamp ttime = utweets.getTtime();
			SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日 HH:mm");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
			SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm");
			Calendar cal = Calendar.getInstance();
			int day = cal.get(Calendar.DATE);
			int month = cal.get(Calendar.MONTH) + 1;
			int year = cal.get(Calendar.YEAR);

			String nowyear = year + "-01-01 00:00:00";
			Timestamp yeardate = Timestamp.valueOf(nowyear);

			String nowday = year + "-" + month + "-" + day + " 00:00:00";
			Timestamp date = Timestamp.valueOf(nowday);
			// 此处转换为毫秒数
			long millionSeconds = ttime.getTime();// 毫秒
			long nowSeconds = System.currentTimeMillis();
			long chazhi = nowSeconds - millionSeconds;

			if (chazhi < 60000) {
				utweets.setTime("现在");
			} else if (chazhi < 3600000) {
				long n = chazhi / 60000;
				utweets.setTime(n + "分钟");
			} else if (ttime.after(date)) {
				utweets.setTime(sdf3.format(ttime));
			} else if (ttime.after(yeardate)) {
				utweets.setTime(sdf.format(ttime));
			} else {
				utweets.setTime(sdf2.format(ttime));
			}
			js.add(getJsonObj(utweets.getTid(), utweets.getUid(), utweets.getTcontent(), utweets.getTpic(),
					utweets.getTvideo(), utweets.getTreply(), utweets.getTforward(), utweets.getTlike(),
					utweets.getUname(), utweets.getUpwd(), utweets.getUrealname(), utweets.getUaite(),
					utweets.getUonline(), utweets.getUabout(), utweets.getUlogo(), utweets.getUbg(), utweets.getUfans(),
					utweets.getUtweet(), utweets.getUfollow(), utweets.getUcolor(), utweets.getTime(),
					utweets.getUtweets(), utweets.getTzhuan(), utweets.getZaned(), utweets.getZhuaned()));
		}
		return js.toString();
	}
}

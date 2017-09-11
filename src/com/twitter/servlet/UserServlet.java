package com.twitter.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
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
import com.twitter.dao.SigninDao;
import com.twitter.dao.UsersDao;
import com.twitter.dao.UsersinfoDao;
import com.twitter.pojo.Concern;
import com.twitter.pojo.Users;
import com.twitter.pojo.Usersall;
import com.twitter.pojo.Usersinfo;
import com.twitter.util.Md5Util;
import com.twitter.util.Times;
import com.twitter.util.Upload;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import sun.misc.BASE64Decoder;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/user.do")
public class UserServlet extends HttpServlet {
	private UsersDao usersDao = new UsersDao();
	private UsersinfoDao usersinfoDao = new UsersinfoDao();
	private ConcernDao concernDao = new ConcernDao();
	private SigninDao signinDao = new SigninDao();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String method = request.getParameter("method");

		if ("checklogin".equals(method)) {
			checkLogin(request, response);
		}

		if ("register".equals(method)) {
			toRegister(request, response);
		}

		if ("checkuser".equals(method)) {
			checkUser(request, response);
		}

		if ("signup".equals(method)) {
			signUp(request, response);
		}

		if ("checkaite".equals(method)) {
			checkAite(request, response);
		}

		if ("exit".equals(method)) {
			toExit(request, response);
		}

		if ("search".equals(method)) {
			toSearch(request, response);
		}

		if ("iswho".equals(method)) {
			toSearchWho(request, response);
		}

		if ("shuaxintuijian".equals(method)) {
			toShuaXinTuiJian(request, response);
		}

		if ("getziliaoka".equals(method)) {
			toGetZiLiao(request, response);
		}

		if ("xiugaitouxiang".equals(method)) {
			toChangeLogo(request, response);
		}

		if ("chayonghu".equals(method)) {
			toChaUser(request, response);
		}
		if ("updatebrithday".equals(method)) {
			toUpdateBrithday(request, response);
		}

		if ("updateabout".equals(method)) {
			toUpdateAbout(request, response);
		}

		if ("gengxininfo".equals(method)) {
			toGengXinInfo(request, response);
		}

		if ("catsession".equals(method)) {
			toCatSession(request, response);
		}

		if ("xiugaibg".equals(method)) {
			toUpdateBg(request, response);
		}

		if ("xiugaiziliao".equals(method)) {
			toUpdateData(request, response);
		}

	}

	private void toUpdateData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String urealname = request.getParameter("urealname");
		String uaite = request.getParameter("uaite");
		String uabout = request.getParameter("uabout");
		String date = request.getParameter("udate");
		String brithy = date.substring(0, date.indexOf("日")).replaceAll("[\u4e00-\u9fa5]", "-") + " 00:00:00";
		Timestamp brithyDate = Timestamp.valueOf(brithy);
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();
		int n = usersinfoDao.updateData(uid, urealname, uaite, uabout, brithyDate);
		if (n > 0) {
			Users users = usersDao.findById(uid);
			Usersinfo info = usersinfoDao.getInfos(uid);
			session.setAttribute("info", info);
			session.setAttribute("user", users);
			response.getWriter().print("ok");
		}
	}

	private void toUpdateBg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();

		String path = request.getSession().getServletContext().getRealPath("img/") + user.getUname();
		Map<String, String> map = Upload.upload(request, 100 * 1024 * 1024, path);
		String picName = map.get("picpath");
		int n = usersinfoDao.updateBg(uid, picName);
		if (n > 0) {
			Usersinfo info = usersinfoDao.getInfos(uid);
			session.setAttribute("info", info);
			response.getWriter().print("ok");
		}
	}

	private void toCatSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/*
		 * HttpSession session = request.getSession(); Users user = (Users)
		 * session.getAttribute("user"); if (user == null) {
		 * response.getWriter().print("exit"); return; }
		 * response.getWriter().print("have");
		 */
	}

	private void toGengXinInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String neirong = request.getParameter("neirong");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();
		Usersinfo info = usersinfoDao.getInfos(uid);
		session.setAttribute("info", info);
		if ("two".equals(neirong)) {
			if (info.getUlogo() != "default_profile_normal.png" && info.getUabout() != null) {
				response.getWriter().print("ok");
			}
			return;
		}
	}

	private void toUpdateAbout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String uabout = request.getParameter("about");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();
		int n = usersinfoDao.updateAbout(uid, uabout);
		if (n > 0) {
			Usersinfo info = usersinfoDao.getInfos(uid);
			session.setAttribute("info", info);
			response.getWriter().print("ok");
		}
	}

	private void toUpdateBrithday(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String date = request.getParameter("date");
		String brithy = date.substring(0, date.indexOf("日")).replaceAll("[\u4e00-\u9fa5]", "-") + " 00:00:00";
		Timestamp brithyDate = Timestamp.valueOf(brithy);
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();
		int n = usersinfoDao.updateDate(uid, brithyDate);
		if (n > 0) {
			Usersinfo info = usersinfoDao.getInfos(uid);
			session.setAttribute("info", info);
			response.getWriter().print("ok");
		}
	}

	private void toChaUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONArray js = new JSONArray();
		String name = request.getParameter("name");
		List<Usersall> list = usersinfoDao.searchWord(name);
		if (list == null) {
			response.getWriter().print("kong");
			return;
		}
		for (Usersall users : list) {
			js.add(getJsonObj(users.getUid(), users.getUname(), users.getUrealname(), users.getUaite(),
					users.getUonline(), users.getUabout(), users.getUlogo(), users.getUbg(), users.getUfans(),
					users.getUtweet(), users.getUfollow(), users.getUcolor(), users.getUaddress(), users.getGuanzhu()));
		}
		response.getWriter().write(js.toString());
	}

	private void toChangeLogo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ulogo = request.getParameter("touxiang");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();
		ulogo = ulogo.substring(ulogo.indexOf(",") + 1);
		BASE64Decoder decoder = new BASE64Decoder();
		String newFileName = null;
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(ulogo);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			// 生成jpeg图片
			String path = request.getSession().getServletContext().getRealPath("img/") + user.getUname();
			newFileName = new Date().getTime() + ".png";
			String imgFilePath = path + "/" + newFileName;// 新生成的图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		int n = usersinfoDao.updateUlogo(uid, newFileName);
		if (n > 0) {
			Usersinfo info = usersinfoDao.getInfos(uid);
			session.setAttribute("info", info);
			response.getWriter().print("ok");
		}
	}

	private void toGetZiLiao(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONArray js = new JSONArray();
		String uid = request.getParameter("uid");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int f_uid = user.getUid();
		Usersall users = usersinfoDao.getInfo(Integer.parseInt(uid));
		int result = concernDao.hasFollow(f_uid, Integer.parseInt(uid));
		if (result == 1) {
			users.setGuanzhu(1);
		} else {
			users.setGuanzhu(0);
		}
		js.add(getJsonObj(users.getUid(), users.getUname(), users.getUrealname(), users.getUaite(), users.getUonline(),
				users.getUabout(), users.getUlogo(), users.getUbg(), users.getUfans(), users.getUtweet(),
				users.getUfollow(), users.getUcolor(), users.getUaddress(), users.getGuanzhu()));
		response.getWriter().write(js.toString());
	}

	private void toShuaXinTuiJian(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONArray js = new JSONArray();
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int uid = user.getUid();
		Usersinfo info = usersinfoDao.getInfos(uid);
		session.setAttribute("info", info);
		List<Concern> concernList = new ArrayList<Concern>();
		List<Usersall> list = new ArrayList<Usersall>();
		concernList = concernDao.getSuid(uid);
		if (concernList == null) {
			list = usersinfoDao.selTuiJian(uid, null);
		} else {
			List<Integer> uidList = new ArrayList<Integer>();
			for (int i = 0; i < concernList.size(); i++) {
				uidList.add(concernList.get(i).getS_uid());
			}
			list = usersinfoDao.selTuiJian(uid, uidList);
		}

		for (Usersall users : list) {
			js.add(getJsonObj(users.getUid(), users.getUname(), users.getUrealname(), users.getUaite(),
					users.getUonline(), users.getUabout(), users.getUlogo(), users.getUbg(), users.getUfans(),
					users.getUtweet(), users.getUfollow(), users.getUcolor(), users.getUaddress(), users.getGuanzhu()));
		}
		response.getWriter().write(js.toString());
	}

	private void toSearchWho(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String uid = request.getParameter("id");
		String realname = request.getParameter("who");
		realname = new String(realname.getBytes("ISO8859-1"), "UTF-8");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int f_uid = user.getUid();
		if (f_uid == Integer.parseInt(uid)) {
			response.sendRedirect("selfdetail.jsp");
			return;
		}
		Usersall who = usersinfoDao.searchWho(uid);
		int result = concernDao.hasFollow(f_uid, Integer.parseInt(uid));
		if (result == 1) {
			who.setGuanzhu(1);
		} else {
			who.setGuanzhu(0);
		}
		session.setAttribute("who", who);
		request.getRequestDispatcher("otherdetail.jsp").forward(request, response);
	}

	// 查询用户
	private void toSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONArray js = new JSONArray();
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int f_uid = user.getUid();
		String word = request.getParameter("word");
		String pagenum = request.getParameter("pagenum");
		String fanwei = request.getParameter("fanwei");
		if (word == null) {
			word = "";
		}
		// who关注的人
		if ("followtwo".equals(fanwei)) {
			Usersall who = (Usersall) session.getAttribute("who");
			int fw_uid = who.getUid();
			List<Concern> concernList = new ArrayList<Concern>();
			concernList = concernDao.getSuid(fw_uid);
			if (concernList == null) {
				response.getWriter().write("nono");
				return;
			}
			List<Integer> uidList = new ArrayList<Integer>();
			for (int i = 0; i < concernList.size(); i++) {
				uidList.add(concernList.get(i).getS_uid());
			}
			List<Usersall> list = usersinfoDao.searchWord(word.trim(), uidList, Integer.parseInt(pagenum));
			if (list == null) {
				response.getWriter().write("没有");
				return;
			}
			for (Usersall users : list) {
				users.setGuanzhu(1);
				js.add(getJsonObj(users.getUid(), users.getUname(), users.getUrealname(), users.getUaite(),
						users.getUonline(), users.getUabout(), users.getUlogo(), users.getUbg(), users.getUfans(),
						users.getUtweet(), users.getUfollow(), users.getUcolor(), users.getUaddress(),
						users.getGuanzhu()));
			}
			response.getWriter().write(js.toString());
			return;
		}
		// who粉丝
		if ("fanstwo".equals(fanwei)) {
			Usersall who = (Usersall) session.getAttribute("who");
			int fw_uid = who.getUid();
			List<Concern> concernList = new ArrayList<Concern>();
			concernList = concernDao.getFuid(fw_uid);
			if (concernList == null) {
				response.getWriter().write("nono");
				return;
			}
			List<Integer> uidList = new ArrayList<Integer>();
			for (int i = 0; i < concernList.size(); i++) {
				uidList.add(concernList.get(i).getF_uid());
			}
			List<Usersall> list = usersinfoDao.searchWord(word.trim(), uidList, Integer.parseInt(pagenum));
			if (list == null) {
				response.getWriter().write("没有");
				return;
			}
			for (Usersall users : list) {
				int result = concernDao.hasFollow(f_uid, users.getUid());
				if (result == 1) {
					users.setGuanzhu(1);
				} else {
					users.setGuanzhu(0);
				}
				js.add(getJsonObj(users.getUid(), users.getUname(), users.getUrealname(), users.getUaite(),
						users.getUonline(), users.getUabout(), users.getUlogo(), users.getUbg(), users.getUfans(),
						users.getUtweet(), users.getUfollow(), users.getUcolor(), users.getUaddress(),
						users.getGuanzhu()));
			}
			response.getWriter().write(js.toString());
			return;
		}
		// 关注的人
		if ("follow".equals(fanwei)) {
			List<Concern> concernList = new ArrayList<Concern>();
			concernList = concernDao.getSuid(f_uid);
			if (concernList == null) {
				response.getWriter().write("no");
				return;
			}
			List<Integer> uidList = new ArrayList<Integer>();
			for (int i = 0; i < concernList.size(); i++) {
				uidList.add(concernList.get(i).getS_uid());
			}
			List<Usersall> list = usersinfoDao.searchWord(word.trim(), uidList, Integer.parseInt(pagenum));
			if (list == null) {
				response.getWriter().write("没有");
				return;
			}
			for (Usersall users : list) {
				users.setGuanzhu(1);
				js.add(getJsonObj(users.getUid(), users.getUname(), users.getUrealname(), users.getUaite(),
						users.getUonline(), users.getUabout(), users.getUlogo(), users.getUbg(), users.getUfans(),
						users.getUtweet(), users.getUfollow(), users.getUcolor(), users.getUaddress(),
						users.getGuanzhu()));
			}
			response.getWriter().write(js.toString());
			return;
		}
		// 粉丝
		if ("fans".equals(fanwei)) {
			List<Concern> concernList = new ArrayList<Concern>();
			concernList = concernDao.getFuid(f_uid);
			if (concernList == null) {
				response.getWriter().write("no");
				return;
			}
			List<Integer> uidList = new ArrayList<Integer>();
			for (int i = 0; i < concernList.size(); i++) {
				uidList.add(concernList.get(i).getF_uid());
			}
			List<Usersall> list = usersinfoDao.searchWord(word.trim(), uidList, Integer.parseInt(pagenum));
			if (list == null) {
				response.getWriter().write("没有");
				return;
			}
			for (Usersall users : list) {
				int result = concernDao.hasFollow(f_uid, users.getUid());
				if (result == 1) {
					users.setGuanzhu(1);
				} else {
					users.setGuanzhu(0);
				}
				js.add(getJsonObj(users.getUid(), users.getUname(), users.getUrealname(), users.getUaite(),
						users.getUonline(), users.getUabout(), users.getUlogo(), users.getUbg(), users.getUfans(),
						users.getUtweet(), users.getUfollow(), users.getUcolor(), users.getUaddress(),
						users.getGuanzhu()));
			}
			response.getWriter().write(js.toString());
			return;
		}
		// 全部
		List<Usersall> list = usersinfoDao.searchWord(word.trim(), Integer.parseInt(pagenum));
		if (list == null) {
			response.getWriter().write("没有");
			return;
		}

		for (Usersall users : list) {
			int result = concernDao.hasFollow(f_uid, users.getUid());
			if (result == 1) {
				users.setGuanzhu(1);
			} else {
				users.setGuanzhu(0);
			}
			js.add(getJsonObj(users.getUid(), users.getUname(), users.getUrealname(), users.getUaite(),
					users.getUonline(), users.getUabout(), users.getUlogo(), users.getUbg(), users.getUfans(),
					users.getUtweet(), users.getUfollow(), users.getUcolor(), users.getUaddress(), users.getGuanzhu()));
		}
		response.getWriter().print(js.toString());
	}

	public JSONObject getJsonObj(int uid, String uname, String urealname, String uaite, int uonline, String uabout,
			String ulogo, String ubg, int ufans, int utweet, int ufollow, String ucolor, String uaddress, int guanzhu) {
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("uid", uid + "");
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
		jsonobj.put("uaddress", uaddress + "");
		jsonobj.put("guanzhu", guanzhu + "");
		return jsonobj;
	}

	// 登出
	private void toExit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("admin") == null) {
			session.invalidate();
			response.sendRedirect("index.jsp");
			return;
		}
		Users user = (Users) session.getAttribute("user");
		ServletContext application = session.getServletContext();
		application.removeAttribute(((Users) session.getAttribute("user")).getUname());
		Integer onlineNum = (Integer) application.getAttribute("onlineNum");
		if (onlineNum > 0) {
			application.setAttribute("onlineNum", onlineNum - 1);
		}
		Object signinid = session.getAttribute("signinid");
		int uid = user.getUid();
		Timestamp sdtime = Times.getSystemTime();
		usersDao.updateOnline(0, uid);
		signinDao.updateSignin((Integer) signinid, sdtime);
		response.sendRedirect("index.jsp");
	}

	// 验证@用户名是否存在
	private void checkAite(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String aite = request.getParameter("aite");
		boolean success = usersDao.checkUaite(aite);

		if (success) {
			response.getWriter().print("no");
		} else {
			response.getWriter().print("yes");
		}
	}

	// 注册
	private void signUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String name = (String) session.getAttribute("name");
		String uname = (String) session.getAttribute("uname");
		String pwd = (String) session.getAttribute("pwd");
		String aite = request.getParameter("aite");
		Timestamp utime = Times.getSystemTime();

		int n = usersDao.addUser(uname, pwd, name, aite, utime);
		if (n > 0) {
			ServletContext application = session.getServletContext();
			Integer zhuceNum = (Integer) application.getAttribute("zhuceNum");
			if (zhuceNum == null) {
				zhuceNum = 1;
			} else {
				zhuceNum += 1;
			}
			application.setAttribute("newTweetNum", zhuceNum);
			Users user = usersDao.checkLogin(uname, pwd);

			int m = usersinfoDao.addUserinfo(user.getUid());
			if (m > 0) {
				Usersinfo info = usersinfoDao.getInfos(user.getUid());

				String folder = request.getSession().getServletContext().getRealPath("/img/" + user.getUname());
				String img = request.getSession().getServletContext().getRealPath("/img");
				File file = new File(folder);
				file.mkdir();

				InputStream is = new FileInputStream(img + "/" + info.getUlogo());
				OutputStream os = new FileOutputStream(folder + "/" + info.getUlogo(), true);
				byte[] b = new byte[1024];
				int a = is.read(b); // 实际读到的文件的长度

				while (a > 0) {
					os.write(b, 0, a);
					a = is.read(b);
				}

				os.close();
				is.close();

				session.setAttribute("info", info);
				session.setAttribute("user", user);
				response.sendRedirect("start.jsp");
			}
		}

	}

	// 验证用户
	private void checkUser(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String username = request.getParameter("username");
		boolean success = usersDao.checkUsername(username);

		if (success) {
			response.getWriter().print("no");
		} else {
			response.getWriter().print("yes");
		}
	}

	private void toRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String order = request.getParameter("order");
		pwd = Md5Util.getMd5(pwd);
		request.setAttribute("name", name);
		request.setAttribute("uname", uname);
		request.setAttribute("pwd", pwd);

		if ("first".equals(order)) {
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return;
		}

		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		session.setAttribute("uname", uname);
		session.setAttribute("pwd", pwd);
		request.getRequestDispatcher("next.jsp").forward(request, response);
	}

	// 验证登录信息
	private void checkLogin(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username == "" && password == "") {
			request.setAttribute("display", "show");
			request.getRequestDispatcher("login.jsp?display=show").forward(request, response);
			return;
		}
		password = Md5Util.getMd5(password);
		Users user = usersDao.checkLogin(username, password);
		if (user == null) {
			request.setAttribute("display", "show");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		if (user.getUstate() == 0) {
			request.setAttribute("display", "stop");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		Usersinfo info = usersinfoDao.getInfos(user.getUid());
		ServletContext application = request.getSession().getServletContext();
		HttpSession oldSession = (HttpSession) application.getAttribute(user.getUname());

		if (oldSession != null) {
			oldSession.invalidate();
		}
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		session.setAttribute("info", info);

		application.setAttribute(user.getUname(), session);
		Integer onlineNum = (Integer) application.getAttribute("onlineNum");
		if (onlineNum == null) {
			onlineNum = new Integer(1);
		} else {
			int count = onlineNum.intValue();
			onlineNum = count + 1;
		}

		application.setAttribute("onlineNum", onlineNum);
		request.getRequestDispatcher("signin.do?method=online").forward(request, response);
		// response.sendRedirect("main.jsp");
	}
}

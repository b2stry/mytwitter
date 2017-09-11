package com.twitter.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twitter.dao.ReplysDao;
import com.twitter.pojo.Replyall;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ReplyServlet
 */
@WebServlet("/reply.do")
public class ReplyServlet extends HttpServlet {
	private ReplysDao replysDao = new ReplysDao();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		String page = req.getParameter("page");
		String tid = req.getParameter("tid");
		List<Replyall> replys = replysDao.getAllReply(Integer.parseInt(tid), Integer.parseInt(page));
		if (replys == null) {
			return;
		}
		JSONArray js = new JSONArray();
		for (Replyall reply : replys) {
			Timestamp rtime = reply.getRtime();
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
			long millionSeconds = rtime.getTime();// 毫秒
			long nowSeconds = System.currentTimeMillis();
			long chazhi = nowSeconds - millionSeconds;

			if (chazhi < 60000) {
				reply.setTime("现在");
			} else if (chazhi < 3600000) {
				long n = chazhi / 60000;
				reply.setTime(n + "分钟");
			} else if (rtime.after(date)) {
				reply.setTime(sdf3.format(rtime));
			} else if (rtime.after(yeardate)) {
				reply.setTime(sdf.format(rtime));
			} else {
				reply.setTime(sdf2.format(rtime));
			}

			js.add(getJsonObj(reply.getRid(), reply.getUid(), reply.getTid(), reply.getRcontent(), reply.getTime(),
					reply.getUname(), reply.getUrealname(), reply.getUaite(), reply.getUlogo()));
		}
		resp.getWriter().print(js.toString());
	}

	public JSONObject getJsonObj(int rid, int uid, int tid, String rcontent, String time, String uname,
			String urealname, String uaite, String ulogo) {
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("rid", rid);
		jsonobj.put("uid", uid);
		jsonobj.put("tid", tid);
		jsonobj.put("rcontent", rcontent);
		jsonobj.put("time", time);
		jsonobj.put("uname", uname);
		jsonobj.put("urealname", urealname);
		jsonobj.put("uaite", uaite);
		jsonobj.put("ulogo", ulogo);
		return jsonobj;
	}
}

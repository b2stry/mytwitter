DROP TABLE IF EXISTS users;
CREATE TABLE users (
  uid int(20) NOT NULL AUTO_INCREMENT,
  uname varchar(20) NOT NULL,
  upwd varchar(255) NOT NULL,
  urealname varchar(100) NOT NULL,
  uaite varchar(20) NOT NULL,
  ustate int(20) NOT NULL DEFAULT '1',
  utime datetime NOT NULL,
  uonline int(20) DEFAULT '0',
  PRIMARY KEY (uid),
  UNIQUE KEY uname (uname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS usersinfo;
CREATE TABLE usersinfo (
  id int(20) NOT NULL AUTO_INCREMENT,
  uid int(20) DEFAULT NULL,
  uaddress varchar(100) DEFAULT '中华人民共和国',
  uabout varchar(200) DEFAULT NULL,
  udate datetime DEFAULT NULL,
  ulogo varchar(50) NOT NULL DEFAULT 'default_profile_normal.png',
  ubg varchar(50) DEFAULT NULL,
  ufans int(20) DEFAULT '0',
  utweet int(20) DEFAULT '0',
  ufollow int(20) DEFAULT '0',
  ucolor varchar(50) NOT NULL DEFAULT 'rgba(29,161,241,1.00)',
  PRIMARY KEY (id),
  UNIQUE KEY uid_2 (uid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS admins;
CREATE TABLE admins (
  aid int(20) NOT NULL AUTO_INCREMENT,
  aname varchar(20) NOT NULL,
  apwd varchar(20) NOT NULL,
  atime datetime NOT NULL,
  astate int(20) NOT NULL,
  apower int(20) NOT NULL,
  PRIMARY KEY (aid),
  UNIQUE KEY aname (aname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS adlogin;
CREATE TABLE adlogin (
  adid int(20) NOT NULL AUTO_INCREMENT,
  aid int(20) NOT NULL,
  aditime datetime NOT NULL,
  adotime datetime NOT NULL,
  PRIMARY KEY (adid),
  KEY aid (aid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS tweets;
CREATE TABLE tweets (
  tid int(20) NOT NULL AUTO_INCREMENT,
  uid int(20) DEFAULT NULL,
  tcontent varchar(999) DEFAULT NULL,
  ttime datetime DEFAULT NULL,
  tpic varchar(50) DEFAULT NULL,
  tvideo varchar(50) DEFAULT '',
  treply int(20) DEFAULT '0',
  tforward int(20) DEFAULT '0',
  tlike int(20) DEFAULT '0',
  tzhuan int(20) DEFAULT '0',
  PRIMARY KEY (tid),
  KEY uid (uid),
  KEY ttime (ttime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=252;

DROP TABLE IF EXISTS concern;
CREATE TABLE concern (
  cid int(20) NOT NULL AUTO_INCREMENT,
  f_uid int(20) NOT NULL,
  s_uid int(20) NOT NULL,
  cstate int(11) NOT NULL DEFAULT '0',
  ctime datetime DEFAULT NULL,
  PRIMARY KEY (cid),
  KEY f_uid (f_uid),
  KEY s_uid (s_uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS forwards;
CREATE TABLE forwards (
  fid int(20) NOT NULL AUTO_INCREMENT,
  tid int(20) NOT NULL,
  stid int(11) NOT NULL,
  ftime datetime NOT NULL,
  uid int(20) NOT NULL,
  PRIMARY KEY (fid),
  KEY tid (tid),
  KEY stid (stid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  lid int(20) NOT NULL AUTO_INCREMENT,
  uid int(20) NOT NULL,
  tid int(20) NOT NULL,
  ltime datetime NOT NULL,
  PRIMARY KEY (lid),
  KEY uid (uid),
  KEY tid (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS message;
CREATE TABLE message (
  mid int(11) NOT NULL AUTO_INCREMENT,
  fuid int(11) DEFAULT NULL,
  suid int(11) DEFAULT NULL,
  mcontent varchar(255) DEFAULT NULL,
  mtime datetime DEFAULT NULL,
  mread int(11) DEFAULT NULL,
  PRIMARY KEY (mid),
  KEY fuid (fuid),
  KEY suid (suid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS notification;
CREATE TABLE notification (
  nid int(20) NOT NULL AUTO_INCREMENT,
  nuid int(20) NOT NULL,
  ntype int(20) NOT NULL,
  nlikeuid int(20) DEFAULT NULL,
  nliketid int(20) DEFAULT NULL,
  nreuid int(20) DEFAULT NULL,
  nretid int(20) DEFAULT NULL,
  nuided int(20) DEFAULT NULL,
  nhuiuid int(20) DEFAULT NULL,
  nhuitid int(20) DEFAULT NULL,
  nrcontent varchar(255) DEFAULT NULL,
  ntime datetime DEFAULT NULL,
  nstate int(20) DEFAULT NULL,
  PRIMARY KEY (nid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS replys;
CREATE TABLE replys (
  rid int(20) NOT NULL AUTO_INCREMENT,
  uid int(20) NOT NULL,
  tid int(20) NOT NULL,
  rcontent varchar(255) NOT NULL,
  rtime datetime NOT NULL,
  PRIMARY KEY (rid),
  KEY uid (uid),
  KEY tid (tid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS signin;
CREATE TABLE signin (
  sid int(20) NOT NULL AUTO_INCREMENT,
  uid int(20) NOT NULL,
  stime datetime NOT NULL,
  sdtime datetime NOT NULL,
  PRIMARY KEY (sid),
  KEY uid (uid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP VIEW IF EXISTS usersall;
CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW usersall AS select users.uid AS uid,users.uname AS uname,users.upwd AS upwd,users.urealname AS urealname,users.uaite AS uaite,users.ustate AS ustate,users.utime AS utime,users.uonline AS uonline,usersinfo.uaddress AS uaddress,usersinfo.uabout AS uabout,usersinfo.udate AS udate,usersinfo.ulogo AS ulogo,usersinfo.ubg AS ubg,usersinfo.ufans AS ufans,usersinfo.utweet AS utweet,usersinfo.ucolor AS ucolor,usersinfo.ufollow AS ufollow from (users join usersinfo) where (users.uid = usersinfo.uid) ;

DROP VIEW IF EXISTS messageall;
CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW messageall AS select message.mid AS mid,message.fuid AS fuid,message.suid AS suid,message.mcontent AS mcontent,message.mtime AS mtime,message.mread AS mread,usersall.uname AS uname,usersall.urealname AS urealname,usersall.ulogo AS ulogo,usersall2.uid AS uid2,usersall2.uname AS uname2,usersall2.urealname AS urealname2,usersall2.ulogo AS ulogo2 from ((message join usersall) join usersall usersall2) where ((message.fuid = usersall.uid) and (message.suid = usersall2.uid)) ;

DROP VIEW IF EXISTS replyall;
CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW replyall AS select replys.uid AS uid,replys.rid AS rid,replys.tid AS tid,replys.rcontent AS rcontent,replys.rtime AS rtime,usersall.uname AS uname,usersall.urealname AS urealname,usersall.uaite AS uaite,usersall.ulogo AS ulogo from (replys join usersall) where (replys.uid = usersall.uid) ;

DROP VIEW IF EXISTS utweets;
CREATE ALGORITHM=UNDEFINED DEFINER=root@localhost SQL SECURITY DEFINER VIEW utweets AS select users.uid AS uid,users.uname AS uname,users.upwd AS upwd,users.urealname AS urealname,users.uaite AS uaite,users.ustate AS ustate,users.utime AS utime,users.uonline AS uonline,usersinfo.uaddress AS uaddress,usersinfo.uabout AS uabout,usersinfo.udate AS udate,usersinfo.ulogo AS ulogo,usersinfo.ubg AS ubg,usersinfo.ufans AS ufans,usersinfo.utweet AS utweet,usersinfo.ufollow AS ufollow,usersinfo.ucolor AS ucolor,tweets.tcontent AS tcontent,tweets.ttime AS ttime,tweets.tpic AS tpic,tweets.tvideo AS tvideo,tweets.treply AS treply,tweets.tforward AS tforward,tweets.tlike AS tlike,tweets.tzhuan AS tzhuan,tweets.tid AS tid from ((users join usersinfo) join tweets) where ((tweets.uid = usersinfo.uid) and (users.uid = usersinfo.uid)) ;

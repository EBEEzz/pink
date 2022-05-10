package com.githrd.test.sql;

public class MemberSQL {
	public final int SEL_LOGIN_CNT = 1001;
	public final int SEL_INFO = 1002;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_LOGIN_CNT:
			buff.append("SELECT ");
			buff.append("	COUNT(*) cnt ");
			buff.append("FROM ");
			buff.append("	member ");
			buff.append("WHERE ");
			buff.append("	isshow = 'Y' ");
			buff.append("	AND id = ? ");
			buff.append("	AND pw = ? ");
			break;
		case SEL_INFO:
			buff.append("SELECT ");
			buff.append("    mno, name, id, mail, tel, joindate, m.gen, savename ");
			buff.append("FROM ");
			buff.append("    member m, avatar a ");
			buff.append("WHERE ");
			buff.append("    m.avt = a.ano ");
			buff.append("    AND m.isshow = 'Y' ");
			buff.append("    AND id = ? ");
			break;
		}
		return buff.toString();
	}
}

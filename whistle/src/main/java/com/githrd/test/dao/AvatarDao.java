package com.githrd.test.dao;

import java.sql.*;

import com.githrd.test.db.*;
import com.githrd.test.vo.*;
import com.githrd.test.sql.*;

public class AvatarDao {
	private JenyJDBC db;
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private MemberSQL mSQL;
	
	public AvatarDao() {
		db = new JenyJDBC();
		mSQL = new MemberSQL();
	}
	
	//아바타번호로 아바타정보조회 전담 처리함수
	public AvatarVO getAnoInfo(int ano) {
		//반환값 변수
		AvatarVO aVO = new AvatarVO();
		
		//con
		con = db.getCon();
		//sql
		String sql = mSQL.getSQL(mSQL.SEL_AVT_INFO); 
		//pstmt
		pstmt = db.getPstmt(con, sql);
		try {
			//질의명령완성
			pstmt.setInt(1, ano);
			//질의명령 보내고 결과받기
			rs = pstmt.executeQuery();
			//데이터 꺼내기
			rs.next();
			
			int anum = rs.getInt("ano");
			String savename = rs.getString("savename");
			String dir = rs.getString("dir");
			String gen = rs.getString("gen");
			
			//꺼낸 데이터 VO에 담기
			aVO.setAno(anum);
			aVO.setSavename(savename);
			aVO.setDir(dir);
			aVO.setGen(gen);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		
		//데이터 반환
		return aVO;
	}

}

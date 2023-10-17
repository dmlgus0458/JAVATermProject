public int joinIdCheck(String id){
	int result = -1;
	try {
		//1. DB연결
		con = getCon();
		//2. sql 구문 & pstmt생성
		sql = "select id from user where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);

		//3. 실행 -> select -> rs저장
		rs = pstmt.executeQuery();

		//4. 데이터처리

		if(rs.next()){	
			result = 0;
		}else{
			result = 1;
		}

		System.out.println("아이디 중복체크결과 : "+result);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		closeDB();
	}
	return result;
}//joinIdCheck 메서드닫음
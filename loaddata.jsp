<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
  String date = request.getParameter("selDate"); // 클라이언트에서 전달된 셀의 값

  // 데이터베이스 연결 정보
  String driverName = "org.gjt.mm.mysql.Driver";
  String dbUrl = "jdbc:mysql://localhost:3306/mysql19";
  String dbUsername = "root";
  String dbPassword = "kbc0924";
  String user_id = (String) session.getAttribute("userid");
  

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try {
    // 데이터베이스 드라이버 로드
    Class.forName(driverName);

    // 데이터베이스 연결
    conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

    // 쿼리 작성
    String sql = "SELECT * FROM events WHERE date = ? AND user_id = ?";

    // PreparedStatement 생성
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, date);
    pstmt.setString(2, user_id);

    // 쿼리 실행
    rs = pstmt.executeQuery();

    // 결과 처리    
    StringBuilder responseData = new StringBuilder();
    while (rs.next()) {
        String title = rs.getString("title");
        String startTime = rs.getString("start_time");
        String endTime = rs.getString("end_time");
        String location = rs.getString("location");
        String memo = rs.getString("memo");
        responseData.append(title).append(",");
        responseData.append(startTime).append(",");
        responseData.append(endTime).append(",");
        responseData.append(location).append(",");
        responseData.append(memo).append(";");
    }
    // 결과를 클라이언트로 전송
    response.getWriter().write(responseData.toString());
  } catch (Exception e) {
    e.printStackTrace();
    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
  } finally {
    // 리소스 해제
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
  }
%>
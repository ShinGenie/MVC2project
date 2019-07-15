package net.itbank.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
   public static Connection getConnection( ){
  	 Connection CN=null;
  	 try{
  		  //순서1 오라클드라이브 라이브러리 로드, database마다 기술하는 방법달라요
  		  Class.forName("oracle.jdbc.driver.OracleDriver");
  		  //순서2 Database서버정보,계정id,비밀번호를 CN에게 기억시켜서 나중에 명령어생성
  		  String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
  		  CN=DriverManager.getConnection(url,"system", "oracle");
  		  //System.out.println("db연결성공 db작업가능 06-17-월요일 "); //나중에주석처리
  		 }catch(Exception ex){System.out.println("db연결실패:" +ex); }
  	 return CN;
   }//end
}//end

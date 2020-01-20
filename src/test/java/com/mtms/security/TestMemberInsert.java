package com.mtms.security;

import java.sql.*;
import java.util.*;

import javax.sql.DataSource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
                              "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class TestMemberInsert {
   
   
   @Setter(onMethod_ = @Autowired)
   private DataSource ds;
   
   @Test
   public void testInsertSuggest() {
      
      String query = "INSERT INTO suggest(suggestNo, memberId," + 
      		"							suggestTitle, suggestContent," + 
      		"							suggestPrivateChk, suggestPw," + 
      		"							suggestView)" + 
      		"		VALUES(seq_suggest.nextval, ?, ?, ?," + 
      		"				?, ?, ?)";
      
      try(Connection con = ds.getConnection(); 
            PreparedStatement pstmt = con.prepareStatement(query)) {
         for(int i=0; i<100; i++) {
            if(i<100) {
               pstmt.setString(1, "admin");
               pstmt.setString(2, "test data title"+i);
               pstmt.setString(3, "test data content"+i);
               pstmt.setInt(4, 0);
               pstmt.setString(5, "");
               pstmt.setInt(6, 0);
            }
            pstmt.executeUpdate();
         }
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
   
}
   
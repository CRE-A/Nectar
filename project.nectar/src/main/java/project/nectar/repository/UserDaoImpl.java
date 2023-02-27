package project.nectar.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.nectar.domain.UserDto;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    DataSource ds;

    @Override
    public int deleteUser(String id) throws Exception {
        int rowCnt = 0;
        String sql = "DELETE FROM user_info WHERE id= ? ";

        try (  // try-with-resources - since jdk7
               Connection conn = ds.getConnection();
               PreparedStatement pstmt = conn.prepareStatement(sql);
        ){
            pstmt.setString(1, id);
            return pstmt.executeUpdate(); //  insert, delete, update
//      } catch (Exception e) {
//          e.printStackTrace();
//          throw e;
        }
    }

    @Override
    public UserDto selectUser(String id) throws Exception {
        UserDto userDto = null;
        String sql = "SELECT * FROM user_info WHERE id= ? ";

        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery(); //  select
        ){
            pstmt.setString(1, id);

            if (rs.next()) {
                userDto = new UserDto();
                userDto.setId(rs.getString(1));
                userDto.setPwd(rs.getString(2));
                userDto.setName(rs.getString(3));
                userDto.setEmail(rs.getString(4));
                userDto.setBirth(new Date(rs.getDate(5).getTime()));
                userDto.setSns(rs.getString(6));
                userDto.setReg_date(new Date(rs.getTimestamp(7).getTime()));
            }
        }

        return userDto;
    }

    // 사용자 정보를 user_info테이블에 저장하는 메서드
    @Override
    public int insertUser(UserDto userDto) throws Exception {
        int rowCnt = 0;
        String sql = "INSERT INTO user_info VALUES (?,?,?,?,?,?, now()) ";

        try(
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql); // SQL Injection공격, 성능향상
        ){
            pstmt.setString(1, userDto.getId());
            pstmt.setString(2, userDto.getPwd());
            pstmt.setString(3, userDto.getName());
            pstmt.setString(4, userDto.getEmail());
            pstmt.setDate(5, new java.sql.Date(userDto.getBirth().getTime()));
            pstmt.setString(6, userDto.getSns());

            return pstmt.executeUpdate();
        }
    }

    @Override
    public int updateUser(UserDto userDto) throws Exception {
        int rowCnt = 0;

        String sql = "UPDATE user_info " +
                "SET pwd = ?, name=?, email=?, birth =?, sns=?, reg_date=? " +
                "WHERE id = ? ";

        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ){
            pstmt.setString(1, userDto.getPwd());
            pstmt.setString(2, userDto.getName());
            pstmt.setString(3, userDto.getEmail());
            pstmt.setDate(4, new java.sql.Date(userDto.getBirth().getTime()));
            pstmt.setString(5, userDto.getSns());
            pstmt.setTimestamp(6, new java.sql.Timestamp(userDto.getReg_date().getTime()));
            pstmt.setString(7, userDto.getId());

            rowCnt = pstmt.executeUpdate();
        }

        return rowCnt;
    }

    @Override
    public int count() throws Exception {
        String sql = "SELECT count(*) FROM user_info ";

        try(
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
        ){
            rs.next();
            int result = rs.getInt(1);

            return result;
        }
    }

    @Override
    public void deleteAll() throws Exception {
        try (Connection conn = ds.getConnection();)
        {
            String sql = "DELETE FROM user_info ";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
        }
    }
}
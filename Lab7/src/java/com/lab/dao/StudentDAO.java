package com.lab.dao;

import com.lab.bean.StudentBean;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;

/**
 * @author Grace
 */
public class StudentDAO {

    // 1. 获取数据库连接
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
    
    // 【核心修改】直接把 user=root 和 password= 拼进 URL 字符串里，后面再传 "root", ""
   return DriverManager.getConnection("jdbc:mysql://localhost:3306/lab7_db","root", "admin");
    
    }
    
    // 2. 注册逻辑
    public boolean registerStudent(StudentBean student, InputStream imageStream) {
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO students(matric_no, password, fullname, profile_image) VALUES(?,?,?,?)";
          
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, student.getMatricNo());
            pstmt.setString(2, student.getPassword());
            pstmt.setString(3, student.getFullname());
            pstmt.setBlob(4, imageStream); // 设置图片二进制流
            
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
           e.printStackTrace(); 
    throw new RuntimeException("写入数据库失败，详细原因: " + e.getMessage(), e);

        }
    }
    
    // 3. 登录逻辑 
    public StudentBean loginStudent(String matricNo, String password) {
        StudentBean student = null;
        try (Connection conn = getConnection()) {
            String sql = "SELECT * FROM students WHERE matric_no=? AND password=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, matricNo);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                student = new StudentBean();
                student.setMatricNo(rs.getString("matric_no"));
                student.setFullname(rs.getString("fullname"));

                // 处理 BLOB 图片转成 Base64 字符串显示
                Blob blob = rs.getBlob("profile_image");
                if (blob != null) {
                    InputStream inputStream = blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    student.setBase64Image(Base64.getEncoder().encodeToString(imageBytes));
                } 
            } 
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return student; // 成功在方法体内返回对象
    }

    // 4. 删除学生逻辑（修正：完美收纳在类作用域里）
    public boolean deleteStudent(String matricNo) {
        try (Connection conn = getConnection()) {
            String sql = "DELETE FROM students WHERE matric_no = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, matricNo);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
} // 👈 整个类唯独只有这一个大括号在文件的最底部作终极闭合！
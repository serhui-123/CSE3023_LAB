package com.lab.dao;

import com.lab.bean.SubjectBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SubjectDAO {
    
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/lab7_db", "root", "admin");
    }

    // 1. CREATE
    public boolean addSubject(SubjectBean subject) {
        String sql = "INSERT INTO registered_subjects (matric_no, subject_code, subject_name) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, subject.getMatricNo());
            pstmt.setString(2, subject.getSubjectCode());
            pstmt.setString(3, subject.getSubjectName());
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. READ
    public ArrayList<SubjectBean> getSubjectsByStudent(String matricNo) {
        ArrayList<SubjectBean> list = new ArrayList<>();
        String sql = "SELECT * FROM registered_subjects WHERE matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, matricNo);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                SubjectBean sub = new SubjectBean();
                sub.setId(rs.getInt("id"));
                sub.setMatricNo(rs.getString("matric_no"));
                sub.setSubjectCode(rs.getString("subject_code"));
                sub.setSubjectName(rs.getString("subject_name"));
                list.add(sub);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 3. 
    public SubjectBean getSubjectById(int id) {
        String sql = "SELECT * FROM registered_subjects WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                SubjectBean sub = new SubjectBean();
                sub.setId(rs.getInt("id"));
                sub.setMatricNo(rs.getString("matric_no"));
                sub.setSubjectCode(rs.getString("subject_code"));
                sub.setSubjectName(rs.getString("subject_name"));
                return sub;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 4. UPDATE
    public boolean updateSubject(SubjectBean subject) {
        String sql = "UPDATE registered_subjects SET subject_code = ?, subject_name = ? WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, subject.getSubjectCode());
            pstmt.setString(2, subject.getSubjectName());
            pstmt.setInt(3, subject.getId());
            pstmt.setString(4, subject.getMatricNo()); 
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 5. DELETE
    public boolean deleteSubject(int id, String matricNo) {
        String sql = "DELETE FROM registered_subjects WHERE id = ? AND matric_no = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.setString(2, matricNo);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
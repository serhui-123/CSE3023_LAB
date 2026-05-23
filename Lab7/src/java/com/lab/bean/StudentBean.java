/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lab.bean;

/**
 *
 * @author 60179
 */
public class StudentBean implements java.io.Serializable{

    
    private String matricNo;
    private String fullname;

    
    private String password;
    private String base64Image;
    
    public StudentBean(){}
    
    public String getMatricNo(){
        return matricNo;
        }
        
    
    public String getFullname(){
        return fullname;
    }
    
   
    public String getPassword() {
        return password;
    }

    

    public String getBase64Image() {
        return base64Image;
    }
    
    public void setMatricNo(String matricNo) {
        this.matricNo = matricNo;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
    
    
    
}

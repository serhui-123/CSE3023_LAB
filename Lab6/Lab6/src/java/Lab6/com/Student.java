/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Lab6.com;

/**
 *
 * @author 60179
 */
public class Student {
 private String stuno;
 private String name;
 private String program;
 
    public String getStuno() {
     

        if (stuno == null) {
            return "invalid";
        }

        if (stuno.matches("[A-Z0-9]+")) {
            return stuno;
        } else {
            return "invalid";
        }
    }

    public void setStuno(String stuno) {
        this.stuno = stuno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }
 
}


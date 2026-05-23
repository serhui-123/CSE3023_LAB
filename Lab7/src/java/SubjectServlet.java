

import com.lab.bean.StudentBean; 
import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/SubjectServlet")
public class SubjectServlet extends HttpServlet {
    private SubjectDAO subjectDAO = new SubjectDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect("login.html");
            return;
        }
        
        
        StudentBean student = (StudentBean) session.getAttribute("loggedUser");
        String matricNo = student.getMatricNo();

        String action = request.getParameter("action");
        if (action == null) action = "view"; 

        // ==================== 1. READ  ====================
        if ("view".equals(action)) {
            ArrayList<SubjectBean> list = subjectDAO.getSubjectsByStudent(matricNo);
            request.setAttribute("subjectList", list);
            request.getRequestDispatcher("subject/viewSubjects.jsp").forward(request, response);
        }
        
        // ==================== 2. CREATE  ====================
        else if ("add".equals(action)) {
            SubjectBean sub = new SubjectBean();
            sub.setMatricNo(matricNo); 
            sub.setSubjectCode(request.getParameter("subjectCode"));
            sub.setSubjectName(request.getParameter("subjectName"));

            subjectDAO.addSubject(sub);
            response.sendRedirect("SubjectServlet?action=view"); 
        }
        
        // ==================== 3. EDIT  ====================
        else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            SubjectBean existingSub = subjectDAO.getSubjectById(id);
            request.setAttribute("subject", existingSub);
            request.getRequestDispatcher("subject/updateSubject.jsp").forward(request, response);
        }
        
        // ==================== 4. UPDATE ====================
        else if ("update".equals(action)) {
            SubjectBean sub = new SubjectBean();
            sub.setId(Integer.parseInt(request.getParameter("id")));
            sub.setMatricNo(matricNo); 
            sub.setSubjectCode(request.getParameter("subjectCode"));
            sub.setSubjectName(request.getParameter("subjectName"));

            subjectDAO.updateSubject(sub);
            response.sendRedirect("SubjectServlet?action=view");
        }
        
        // ==================== 5. DELETE ====================
        else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            subjectDAO.deleteSubject(id, matricNo); 
            response.sendRedirect("SubjectServlet?action=view");
        }
    }
}
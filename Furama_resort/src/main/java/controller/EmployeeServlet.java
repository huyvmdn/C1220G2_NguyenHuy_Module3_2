package controller;

import model.bean.Customer;
import model.bean.Employee;
import model.bean.Service;
import model.service.EmployeeService;
import model.service.IEmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employees")
public class EmployeeServlet extends HttpServlet {

    IEmployeeService employeeService= new EmployeeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);

                break;
            case "search":
                searchEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertEmployee(request, response);
                break;
            case "edit":
                showUpdateEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                listEmployee(request, response);
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> listEmployee = employeeService.selectAllUsers();
        request.setAttribute("listEmployee", listEmployee);
        try {
            request.getRequestDispatcher("employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");

        Boolean check = null;
        try {
            check = employeeService.deleteEmployee(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        String msg;
        List<Employee> listEmployee = employeeService.selectAllUsers();

        if (check) {
            msg = "Delete successfully!";
        } else {
            msg = "Delete failed!";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String employeeName = request.getParameter("employeeName");
        List<Employee> listEmployee = null;
        try {
            listEmployee = employeeService.selectUserByName(employeeName);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("listEmployee", listEmployee);
        try {
            request.getRequestDispatcher("employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateEmployee(HttpServletRequest request, HttpServletResponse response) {

    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) {
        String employeeId = request.getParameter("employeeId");
        if (employeeId == null) {
            employeeId = "";
        }
        String employeeName = request.getParameter("employeeName");
        if (employeeName == null) {
            employeeName = "";
        }
        String employeeBirthday = request.getParameter("employeeBirthday");
        if (employeeBirthday == null) {
            employeeBirthday = "";
        }
        String employeeIdCard = request.getParameter("employeeIdCard");
        if (employeeIdCard == null) {
            employeeIdCard = "";
        }
        String employeeSalary = request.getParameter("employeeSalary");
        if (employeeSalary == null) {
            employeeSalary = "";
        }
        String employeePhone = request.getParameter("employeePhone");
        if (employeePhone == null) {
            employeePhone = "";
        }
        String employeeEmail = request.getParameter("employeeEmail");
        if (employeeEmail == null) {
            employeeEmail = "";
        }
        String employeeAddress = request.getParameter("employeeAddress");
        if (employeeAddress == null) {
            employeeAddress = "";
        }
        String position = request.getParameter("position");
        if (position == null) {
            position = "";
        }
        String educationDegree = request.getParameter("educationDegree");
        if (educationDegree == null) {
            educationDegree = "";
        }
        String division = request.getParameter("division");
        if (division == null) {
            division = "";
        }
        String username = request.getParameter("username");
        if (username == null) {
            username = "";
        }
        Employee employee = new Employee(employeeId,employeeName,employeeBirthday,Double.parseDouble(employeeSalary),employeeIdCard,employeeEmail,employeeAddress,position,educationDegree,division,username);
//
        try {
            List<String> errEmployee = employeeService.insertEmployee(employee);
            List<Employee> listEmployee = employeeService.selectAllUsers();
            int checkfull=0;
            boolean check=false;
            String msgcreate;
            for (String string:errEmployee) {
                if (string.equals("")){
                    checkfull++;
                }
            }
            if (checkfull==12) {
                check=true;
            }
            if (check) {
                msgcreate = "create new Employee successfully!";
            } else {
                msgcreate = "create new Employee failed!";
            }
            boolean flagCreate = true;
            request.setAttribute("msgcreate",msgcreate);
            request.setAttribute("flagCreate", flagCreate);
            request.setAttribute("listCustomer", listEmployee);
            request.setAttribute("errCustomer", errEmployee);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {

            request.getRequestDispatcher("employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {

    }

}

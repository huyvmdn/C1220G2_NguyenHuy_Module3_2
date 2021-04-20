package model.service;

import model.bean.Employee;
import model.commons.Standardization;
import model.commons.Validation;
import model.ripository.EmployeeDAO;
import model.ripository.IEmployeeDAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService implements IEmployeeService {
        IEmployeeDAO employeeDAO= new EmployeeDAO();
    @Override
    public List<String> insertEmployee(Employee employee) throws SQLException {
        List<String> errEmployee = new ArrayList<>();
        employee.setEmployeeId(employee.getEmployeeId().toUpperCase());
        errEmployee.add(Validation.checkNull(employee.getEmployeeId()));
        employee.setEmployeeName(Standardization.standardizeString(employee.getEmployeeName()));
        errEmployee.add(Validation.checkName(employee.getEmployeeName()));
        errEmployee.add(Validation.checkDay(employee.getEmployeeBirthday()));
        errEmployee.add(Validation.checkIdCard(employee.getEmployeeIdCard()));
        errEmployee.add(Validation.checkNumberDouble(String.valueOf(employee.getEmployeeSalary())));
        errEmployee.add(Validation.checkPhoneNumber(employee.getEmployeePhone()));
        errEmployee.add(Validation.checkEmail(employee.getEmployeeEmail()));
        errEmployee.add(Validation.checkNull(employee.getEmployeeAddress()));
        errEmployee.add(Validation.checkNull(employee.getPosition()));
        errEmployee.add(Validation.checkNull(employee.getEducationDegree()));
        errEmployee.add(Validation.checkNull(employee.getDivision()));
        errEmployee.add(Validation.checkNull(employee.getUsername()));
        int checkFull=0;
        for (String string: errEmployee) {
            if (string.equals("")) {
                checkFull++;
            }
        }

        if (checkFull == 12){
            employeeDAO.insertEmployee(employee);

        }
        return  errEmployee;
    }

    @Override
    public Employee selectEmployee(String id) {
        return employeeDAO.selectEmployee(id);
    }

    @Override
    public List<Employee> selectAllUsers() {
        return employeeDAO.selectAllUsers();
    }

    @Override
    public boolean deleteEmployee(String id) throws SQLException {
        return employeeDAO.deleteEmployee(id);
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return employeeDAO.updateEmployee(employee);
    }

    @Override
    public List<Employee> selectUserByName(String name) throws SQLException {
        return employeeDAO.selectUserByName(name);
    }
}

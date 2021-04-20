package model.service;

import model.bean.Employee;
import model.bean.Service;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    List<String> insertEmployee(Employee employee) throws SQLException;

    Employee selectEmployee(String id);

    List<Employee> selectAllUsers();

    boolean deleteEmployee(String id) throws SQLException;

    boolean updateEmployee(Employee employee) throws SQLException;

    List<Employee> selectUserByName(String name) throws SQLException;
}

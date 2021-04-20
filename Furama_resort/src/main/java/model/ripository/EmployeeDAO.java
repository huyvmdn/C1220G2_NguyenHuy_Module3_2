package model.ripository;

import model.bean.Customer;
import model.bean.Employee;
import model.bean.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO implements IEmployeeDAO {

    BaseRepository baseRepository = new BaseRepository();

    private String SELECT_ALL_EMPLOYEES=" select e.employee_id,e.employee_name,e.employee_birthday,e.employee_id_card,e.employee_salary,e.employee_phone,e.employee_email,e.employee_address,p.position_name,ed.education_degree_name,d.division_name,e.username\n" +
            "from employee e\n" +
            "inner join division d on e.division_id = d.division_id\n" +
            "inner join education_degree ed on ed.education_degree_id = e.education_degree_id\n" +
            "inner join position p on p.position_id= e.position_id";
    private String DELETE_EMPLOYEE_SQL = " delete from employee where employee_id = ?;";
    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employee" + " VALUES " +
            " (? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private String SELECT_EMPLOYEE_BY_ID= SELECT_ALL_EMPLOYEES + " WHERE e.employee_id = ?";


    @Override
    public void insertEmployee(Employee employee) throws SQLException {


        try (
                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_EMPLOYEE_SQL)) {


            preparedStatement.setString(1, employee.getEmployeeId());
            preparedStatement.setString(2, employee.getEmployeeName());
            preparedStatement.setString(3, employee.getEmployeeBirthday());
            preparedStatement.setString(4, employee.getEmployeeIdCard());
            preparedStatement.setDouble(5, employee.getEmployeeSalary());
            preparedStatement.setString(6, employee.getEmployeePhone());
            preparedStatement.setString(7, employee.getEmployeeEmail());
            preparedStatement.setString(8, employee.getEmployeeAddress());
            int position_id=0;
            switch (employee.getPosition()) {
                case "manager":
                    position_id=1;
                    break;
                case "manage":
                    position_id=2;
                    break;
                case "supervisor":
                    position_id=3;
                    break;
                    case "expert":
                    position_id=4;
                    break;
                    case "serve":
                    position_id=5;
                    break;
                    case "Receptionist":
                    position_id=6;
                    break;
            }
            preparedStatement.setInt(9, position_id);
            int education_degree_id=0;
//            (1,"Intermediate"),
//            (2,"College"),
//            (3,"University"),
//            (4,"After university");
            switch (employee.getEducationDegree()) {
                case "Intermediate":
                    education_degree_id = 1;
                    break;
                case "College":
                    education_degree_id = 2;
                    break;
                case "University":
                    education_degree_id = 3;
                    break;
                case "After university":
                    education_degree_id = 4;
                    break;
            }
            preparedStatement.setInt(10, education_degree_id);
            int division_id =0;
//            (1,'Sale–Marketing'),
//            (2,'Administration'),
//            (3,'Serve'),
//            (4,'Manage');
            switch (employee.getDivision()) {
                case "Sale–Marketing":
                    division_id = 1;
                    break;
                case "Administration":
                    division_id = 2;
                    break;
                case "Serve":
                    division_id = 3;
                    break;
                case "Manage":
                    division_id = 4;
                    break;
            }
            preparedStatement.setInt(11, division_id);
            preparedStatement.setString(12, employee.getUsername());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Lỗi catch tại Employee DAO");
        }
    }

    @Override
    public Employee selectEmployee(String id) {
        Employee employee = null;
        try (
                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_EMPLOYEE_BY_ID)) {
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String employee_id = rs.getString("e.employee_id");
                String employee_name = rs.getString("e.employee_name");
                String employee_birthday = rs.getString("e.employee_birthday");
                Double employee_salary = rs.getDouble("e.employee_salary");
                String employee_id_card = rs.getString("e.employee_id_card");
                String employee_phone = rs.getString("e.employee_phone");
                String employee_email = rs.getString("se.employee_email");
                String employee_address = rs.getString("e.employee_address");
                String position_name = rs.getString("p.position_name");
                String education_degree_name = rs.getString("ed.education_degree_name");
                String username = rs.getString("e.username");

                employee =new Employee(employee_id, employee_name, employee_birthday, employee_salary,employee_id_card, employee_phone, employee_email, employee_address, position_name, education_degree_name, username);

            }
        } catch (SQLException e) {
            System.err.println("lỗi tại Catch select 1 customer");
        }
        return employee;
    }

    @Override
    public List<Employee> selectAllUsers() {
        List<Employee> employees = new ArrayList<>();
        try (
                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_EMPLOYEES)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String employee_id = rs.getString("e.employee_id");
                String employee_name = rs.getString("e.employee_name");
                String employee_birthday = rs.getString("e.employee_birthday");
                String employee_id_card = rs.getString("e.employee_id_card");
                Double employee_salary = Double.parseDouble(rs.getString("e.employee_salary"));
                String employee_phone = rs.getString("e.employee_phone");
                String employee_email = rs.getString("se.employee_email");
                String employee_address = rs.getString("e.employee_address");
                String position_name = rs.getString("p.position_name");
                String education_degree_name = rs.getString("ed.education_degree_name");
                String username = rs.getString("e.username");

                employees.add(new Employee(employee_id, employee_name, employee_birthday,employee_salary,employee_id_card, employee_phone, employee_email, employee_address, position_name, education_degree_name, username));

            }
        } catch (SQLException e) {
            System.err.println("lỗi catch tại selectAllUsers");
            ;
        }
        return employees;
    }

    @Override
    public boolean deleteEmployee(String id) throws SQLException {
        boolean rowDeleted;
        try (PreparedStatement statement = baseRepository.getConnection().prepareStatement(DELETE_EMPLOYEE_SQL)) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return false;
    }

    @Override
    public List<Employee> selectUserByName(String name) throws SQLException {
        Employee employee = null;
        List<Employee> employees = new ArrayList<>();

        try (

                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_EMPLOYEES + " where e.employee_name like '%" + name + "%'")) {

            ResultSet rs = preparedStatement.executeQuery();


            while (rs.next()) {
                String employee_id = rs.getString("e.employee_id");
                String employee_name = rs.getString("e.employee_name");
                String employee_birthday = rs.getString("e.employee_birthday");
                Double employee_salary = rs.getDouble("e.employee_salary");
                String employee_id_card = rs.getString("e.employee_id_card");
                String employee_phone = rs.getString("e.employee_phone");
                String employee_email = rs.getString("se.employee_email");
                String employee_address = rs.getString("e.employee_address");
                String position_name = rs.getString("p.position_name");
                String education_degree_name = rs.getString("ed.education_degree_name");
                String username = rs.getString("e.username");

                employees.add(new Employee(employee_id, employee_name, employee_birthday, employee_salary,employee_id_card, employee_phone, employee_email, employee_address, position_name, education_degree_name, username));
            }
            return employees;
        }
    }
}

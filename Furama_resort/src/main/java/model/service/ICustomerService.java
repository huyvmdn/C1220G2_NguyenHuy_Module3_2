package model.service;

import model.bean.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    List<String> insertCustomer(Customer customer) throws SQLException;

    Customer selectCustomer(String id);

    List<Customer> selectAllUsers();

    boolean deleteCustomer(String id) throws SQLException;

    boolean updateCustomer(Customer customer) throws SQLException;

    List<Customer> selectUserByName(String name) throws SQLException;



}

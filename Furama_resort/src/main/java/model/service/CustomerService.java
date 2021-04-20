package model.service;

import model.bean.Customer;
import model.commons.Standardization;
import model.commons.Validation;
import model.ripository.CustomerDAO;
import model.ripository.ICustomerDAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerDAO customerDAO= new CustomerDAO();
    @Override
    public  List<String> insertCustomer(Customer customer) throws SQLException {
        List<String> errCustomer = new ArrayList<>();
        customer.setCustomer_id(customer.getCustomer_id().toUpperCase());
        errCustomer.add(Validation.checkCustomerId(customer.getCustomer_id()));
        errCustomer.add(Validation.checkNull(customer.getCustomer_type()));
        customer.setCustomer_name(Standardization.standardizeString(customer.getCustomer_name()));
       errCustomer.add(Validation.checkName(customer.getCustomer_name()));
       errCustomer.add(Validation.checkDay(customer.getCustomer_birthday()));
       errCustomer.add(Validation.checkNull(customer.getCustomer_gender()));
       errCustomer.add(Validation.checkIdCard(customer.getCustomer_id_card()));
       errCustomer.add(Validation.checkPhoneNumber(customer.getCustomer_phone()));
       errCustomer.add(Validation.checkEmail(customer.getCustomer_email()));
       errCustomer.add(Validation.checkNull(customer.getCustomer_address()));
       int checkFull=0;
        for (String string: errCustomer) {
            if (string.equals("")) {
                checkFull++;
            }
        }

        if (checkFull == 9){
            customerDAO.insertCustomer(customer);

        }
        return  errCustomer;
    }

    @Override
    public Customer selectCustomer(String id) {
        return customerDAO.selectCustomer(id);
    }

    @Override
    public List<Customer> selectAllUsers() {
        return customerDAO.selectAllUsers();
    }

    @Override
    public boolean deleteCustomer(String id) throws SQLException {
        return customerDAO.deleteCustomer(id);
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return customerDAO.updateCustomer(customer);
    }

    @Override
    public List<Customer> selectUserByName(String name) throws SQLException {
        return customerDAO.selectUserByName(name);
    }


}

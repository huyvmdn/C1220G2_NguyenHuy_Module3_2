package model.ripository;

import model.bean.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO {
    private static final String INSERT_CUSTOMERS_SQL = "INSERT INTO customer" + " VALUES " +
            " (?,?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_CUSTOMERS = "select * from customer";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where customer_id = ?;";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from customer where customer_id =?";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set  customer_type_id=?,customer_name =?,customer_birthday=?,customer_gender=?,customer_id_card=?,customer_phone=?,customer_email=?,customer_address=? where customer_id = ?";
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public void insertCustomer(Customer customer) {


        try (
                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_CUSTOMERS_SQL)) {

            String customer_type = customer.getCustomer_type();
            int customer_type_id;
            switch (customer_type) {
                case "Diamond":
                    customer_type_id = 1;
                    break;
                case "Platinium":
                    customer_type_id = 2;
                    break;
                case "Gold":
                    customer_type_id = 3;
                    break;
                case "Silver":
                    customer_type_id = 4;
                    break;
                default:
                    customer_type_id = 5;
            }
            preparedStatement.setString(1, customer.getCustomer_id());
            preparedStatement.setInt(2, customer_type_id);
            preparedStatement.setString(3, customer.getCustomer_name());
            preparedStatement.setString(4, customer.getCustomer_birthday());
            int customer_gender_id = 0;
            if (customer.getCustomer_gender().equals("Female")) {
                customer_gender_id = 0;
            } else if (customer.getCustomer_gender().equals("Male")) {
                customer_gender_id = 1;
            }
            preparedStatement.setInt(5, customer_gender_id);
            preparedStatement.setString(6, customer.getCustomer_id_card());
            preparedStatement.setString(7, customer.getCustomer_phone());
            preparedStatement.setString(8, customer.getCustomer_email());
            preparedStatement.setString(9, customer.getCustomer_address());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Lỗi catch tại CUSTOMER DAO");
        }
    }

    @Override
    public Customer selectCustomer(String id) {
        Customer customer = null;

        try (
                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_CUSTOMER_BY_ID)) {
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                int customer_type_id = rs.getInt("customer_type_id");
                String customer_type = "";
                switch (customer_type_id) {
                    case 1:
                        customer_type = "Diamond";
                        break;
                    case 2:
                        customer_type = "Platinium";
                        break;
                    case 3:
                        customer_type = "Gold";
                        break;
                    case 4:
                        customer_type = "Silver";
                        break;
                    default:
                        customer_type = "Member";

                }
                String customer_name = rs.getString("customer_name");
                String customer_birthday = rs.getString("customer_birthday");
                int customer_gender_id = rs.getInt("customer_gender");
                String customer_gender;
                if (customer_gender_id == 0) {
                    customer_gender = "Female";
                } else if (customer_gender_id == 1) {
                    customer_gender = "Male";
                } else {
                    customer_gender = "other";
                }
                String customer_id_card = rs.getString("customer_id_card");
                String customer_phone = rs.getString("customer_phone");
                String customer_email = rs.getString("customer_email");
                String customer_address = rs.getString("customer_address");
                customer = new Customer(id, customer_type, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address);
            }
        } catch (SQLException e) {
            System.err.println("lỗi tại Catch select 1 customer");
        }
        return customer;
    }

    @Override
    public List<Customer> selectAllUsers() {

        List<Customer> customers = new ArrayList<>();
        try (
                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_CUSTOMERS);) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String id = rs.getString("customer_id");
                int customer_type_id = rs.getInt("customer_type_id");
                String customer_type = "";
                switch (customer_type_id) {
                    case 1:
                        customer_type = "Diamond";
                        break;
                    case 2:
                        customer_type = "Platinium";
                        break;
                    case 3:
                        customer_type = "Gold";
                        break;
                    case 4:
                        customer_type = "Silver";
                        break;
                    default:
                        customer_type = "Member";

                }
                String customer_name = rs.getString("customer_name");
                String customer_birthday = rs.getString("customer_birthday");
                int customer_gender_id = rs.getInt("customer_gender");
                String customer_gender;
                if (customer_gender_id == 0) {
                    customer_gender = "Female";
                } else if (customer_gender_id == 1) {
                    customer_gender = "Male";
                } else {
                    customer_gender = "other";
                }
                String customer_id_card = rs.getString("customer_id_card");
                String customer_phone = rs.getString("customer_phone");
                String customer_email = rs.getString("customer_email");
                String customer_address = rs.getString("customer_address");
                customers.add(new Customer(id, customer_type, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address));

            }
        } catch (SQLException e) {
            System.err.println("lỗi catch tại selectAllUsers");
            ;
        }
        return customers;
    }

    @Override
    public boolean deleteCustomer(String id) throws SQLException {
        boolean rowDeleted;
        try (PreparedStatement statement = baseRepository.getConnection().prepareStatement(DELETE_CUSTOMER_SQL)) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean rowUpdated;
        try (
                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(UPDATE_CUSTOMER_SQL)) {
            String customer_type = customer.getCustomer_type();
            int customer_type_id;
            switch (customer_type) {
                case "Diamond":
                    customer_type_id = 1;
                    break;
                case "Platinium":
                    customer_type_id = 2;
                    break;
                case "Gold":
                    customer_type_id = 3;
                    break;
                case "Silver":
                    customer_type_id = 4;
                    break;
                default:
                    customer_type_id = 5;
            }
            preparedStatement.setInt(1, customer_type_id);
            preparedStatement.setString(2, customer.getCustomer_name());
            preparedStatement.setString(3, customer.getCustomer_birthday());
            int customer_gender_id = 0;
            if (customer.getCustomer_gender().equals("Female")) {
                customer_gender_id = 0;
            } else if (customer.getCustomer_gender().equals("Male")) {
                customer_gender_id = 1;
            }
            preparedStatement.setInt(4, customer_gender_id);
            preparedStatement.setString(5, customer.getCustomer_id_card());
            preparedStatement.setString(6, customer.getCustomer_phone());
            preparedStatement.setString(7, customer.getCustomer_email());
            preparedStatement.setString(8, customer.getCustomer_address());
            preparedStatement.setString(9, customer.getCustomer_id());
            System.out.println(preparedStatement);
            rowUpdated = preparedStatement.executeUpdate() > 0;
            return rowUpdated;
        }
    }


    @Override
    public List<Customer> selectUserByName(String customer_name) throws SQLException {
        Customer customer = null;
        List<Customer> customers = new ArrayList<>();

        try (

                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement("select * from customer where customer_name like '%" + customer_name + "%'")) {

            ResultSet rs = preparedStatement.executeQuery();


            while (rs.next()) {
                String id = rs.getString("customer_id");
                int customer_type_id = rs.getInt("customer_type_id");
                String customer_type = "";
                switch (customer_type_id) {
                    case 1:
                        customer_type = "Diamond";
                        break;
                    case 2:
                        customer_type = "Platinium";
                        break;
                    case 3:
                        customer_type = "Gold";
                        break;
                    case 4:
                        customer_type = "Silver";
                        break;
                    default:
                        customer_type = "Member";

                }
                String customer_name_db = rs.getString("customer_name");
                String customer_birthday = rs.getString("customer_birthday");
                int customer_gender_id = rs.getInt("customer_gender");
                String customer_gender;
                if (customer_gender_id == 0) {
                    customer_gender = "Female";
                } else if (customer_gender_id == 1) {
                    customer_gender = "Male";
                } else {
                    customer_gender = "other";
                }

                String customer_id_card = rs.getString("customer_id_card");
                String customer_phone = rs.getString("customer_phone");
                String customer_email = rs.getString("customer_email");
                String customer_address = rs.getString("customer_address");
                customers.add(new Customer(id, customer_type, customer_name_db, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address));
            }
            return customers;
        }
    }

}

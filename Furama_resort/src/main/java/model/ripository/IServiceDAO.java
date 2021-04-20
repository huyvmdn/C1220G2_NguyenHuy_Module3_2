package model.ripository;

import model.bean.Customer;
import model.bean.Service;

import java.sql.SQLException;
import java.util.List;

public interface IServiceDAO {
    void insertService(Service service) throws SQLException;

    Service selectService(String id);

    List<Service> selectAllUsers();

    boolean deleteService(String id) throws SQLException;

    boolean updateService(Service service) throws SQLException;

    List<Service> selectUserByName(String name) throws SQLException;


}

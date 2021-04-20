package model.ripository;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

//    Tìm kiếm theo country
//    Sắp xếp theo name

    public List<User> selectUserByCountry(String country) throws SQLException;

    public List<User> sort() throws SQLException;

    public User getUserById(int id);

    public void insertUserStore(User user) throws SQLException;

}

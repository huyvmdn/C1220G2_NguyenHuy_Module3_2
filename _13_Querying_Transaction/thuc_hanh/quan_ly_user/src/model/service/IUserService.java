package model.service;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {

     void insertUser(User user) throws SQLException;

     User selectUser(int id);

     List<User> selectAllUsers();

     boolean deleteUser(int id) throws SQLException;

     boolean updateUser(User user) throws SQLException;

     List<User> selectUserByCountry(String country) throws SQLException;

     List<User> selectUserCallStatement();

     List<User> sort() throws SQLException;

     User getUserById(int id);

     void insertUserStore(User user) throws SQLException;

    void addUserTransaction(User user, int[] permision);

     public void insertUpdateWithoutTransaction();

     public void insertUpdateUseTransaction();


     boolean updateUserTransaction(User user) throws SQLException;
}

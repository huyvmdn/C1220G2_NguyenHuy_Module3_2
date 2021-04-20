package model.service;

import model.bean.User;
import model.repository.IUserDAO;
import model.repository.UserDAO;


import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
        IUserDAO userDAO = new UserDAO();

    @Override
    public void insertUser(User user) throws SQLException {
        userDAO.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDAO.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userDAO.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userDAO.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userDAO.updateUser(user);
    }

    @Override
    public List<User> selectUserByCountry(String country) throws SQLException {
        return userDAO.selectUserByCountry(country);
    }

    @Override
    public List<User> sort() throws SQLException {
        return userDAO.sort();
    }

    @Override
    public User getUserById(int id) {
        return userDAO.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        userDAO.insertUserStore(user);
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        userDAO.addUserTransaction(user,permision);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        userDAO.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {
        userDAO.insertUpdateUseTransaction();
    }

    @Override
    public boolean updateUserTransaction(User user) throws SQLException {
        return userDAO.updateUserTransaction(user);
    }

    @Override
    public List<User> selectUserCallStatement() {
        return userDAO.selectUserCallStatement();
    }


}

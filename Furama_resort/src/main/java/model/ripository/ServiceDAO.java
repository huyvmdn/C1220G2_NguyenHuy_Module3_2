package model.ripository;

import model.bean.Customer;
import model.bean.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO implements IServiceDAO {
    BaseRepository baseRepository = new BaseRepository();
    private String SELECT_ALL_SERVICES = "select s.service_id, s.service_name, s.service_area, s.service_cost, s.service_max_people, rt.rent_type_name, st.service_type_name,s.standard_room,s.description_other_convenience,pool_area,number_of_floors\n" +
            "from service s\n" +
            "inner join rent_type rt on rt.rent_type_id = s.rent_type_id\n" +
            "inner join service_type st on st.service_type_id= s.service_type_id";

    private String INSERT_SERVICE_SQL = "INSERT INTO service" + " VALUES " + " (? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

    private String SELECT_SERVICE_BY_ID = "select s.service_id, s.service_name, s.service_area, s.service_cost, s.service_max_people, rt.rent_type_name, st.service_type_name,s.standard_room,s.description_other_convenience,pool_area,number_of_floors\n" +
            "from service s\n" +
            "inner join rent_type rt on rt.rent_type_id = s.rent_type_id\n" +
            "inner join service_type st on st.service_type_id= s.service_type_id\n" +
            "where s.service_id = ?";

    private String DELETE_SERVICE_SQL = "delete from service where service_id = ?;";

    @Override
    public void insertService(Service service) throws SQLException {


        try (
                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(INSERT_SERVICE_SQL)) {


            preparedStatement.setString(1, service.getServiceId());
            preparedStatement.setString(2, service.getServiceName());
            preparedStatement.setDouble(3, service.getPoolArea());
            preparedStatement.setDouble(4, service.getServiceCost());
            preparedStatement.setInt(5, service.getServiceMaxPeople());
            int rent_type_id = 0;
            switch (service.getRentType()) {
                case "Day":
                    rent_type_id = 1;
                    break;
                case "Month":
                    rent_type_id = 2;
                    break;
                case "Year":
                    rent_type_id = 3;
                    break;
                case "Hours":
                    rent_type_id = 4;
                    break;
                default:
                    rent_type_id = 1;
            }
            preparedStatement.setInt(6, rent_type_id);
            int service_type_id = 3;
            switch (service.getServiceType()) {
                case "Villa":
                    service_type_id = 1;
                    break;
                case "House":
                    service_type_id = 2;
                    break;
                case "Room":
                    service_type_id = 3;
                    break;
                default:
                    service_type_id = 1;
            }

            preparedStatement.setInt(7, service_type_id);
            preparedStatement.setString(8, service.getStandardRoom());
            preparedStatement.setString(9, service.getDescriptionOtherConvenience());
            preparedStatement.setDouble(10, service.getPoolArea());
            preparedStatement.setInt(11, service.getNumberOfFloors());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Lỗi catch tại SERVICE DAO");
        }
    }

    @Override
    public Service selectService(String id) {
        Service service = null;

        try (
                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_SERVICE_BY_ID)) {
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String service_id = rs.getString("s.service_id");
                String service_name = rs.getString("s.service_name");
                Double service_area = rs.getDouble("s.service_area");
                Double service_cost = rs.getDouble("s.service_cost");
                int service_max_people = rs.getInt("s.service_max_people");
                String rent_type = rs.getString("rt.rent_type_name");
                String service_type = rs.getString("st.service_type_name");
                String standard_room = rs.getString("s.standard_room");
                String description_other_convenience = rs.getString("s.description_other_convenience");
                Double pool_area = rs.getDouble("s.pool_area");
                int number_of_floors = rs.getInt("s.number_of_floors");

                service = new Service(service_id, service_name, service_area, service_cost, service_max_people, rent_type, service_type, standard_room, description_other_convenience, pool_area, number_of_floors);
            }
        } catch (SQLException e) {
            System.err.println("lỗi tại Catch select 1 customer");
        }
        return service;
    }

    @Override
    public List<Service> selectAllUsers() {
        List<Service> services = new ArrayList<>();
        try (
                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_SERVICES)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String service_id = rs.getString("s.service_id");
                String service_name = rs.getString("s.service_name");
                Double service_area = rs.getDouble("s.service_area");
                Double service_cost = rs.getDouble("s.service_cost");
                int service_max_people = rs.getInt("s.service_max_people");
                String rent_type = rs.getString("rt.rent_type_name");
                String service_type = rs.getString("st.service_type_name");
                String standard_room = rs.getString("s.standard_room");
                String description_other_convenience = rs.getString("s.description_other_convenience");
                Double pool_area = rs.getDouble("s.pool_area");
                int number_of_floors = rs.getInt("s.number_of_floors");
                services.add(new Service(service_id, service_name, service_area, service_cost, service_max_people, rent_type, service_type, standard_room, description_other_convenience, pool_area, number_of_floors));

            }
        } catch (SQLException e) {
            System.err.println("lỗi catch tại selectAllUsers");
            ;
        }
        return services;
    }

    @Override
    public boolean deleteService(String id) throws SQLException {
        boolean rowDeleted;
        try (PreparedStatement statement = baseRepository.getConnection().prepareStatement(DELETE_SERVICE_SQL)) {
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateService(Service service) throws SQLException {
        return false;
    }

    @Override
    public List<Service> selectUserByName(String name) throws SQLException {
        Service service = null;
        List<Service> services = new ArrayList<>();

        try (

                PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(SELECT_ALL_SERVICES + " where service_name like '%" + name + "%'")) {

            ResultSet rs = preparedStatement.executeQuery();


            while (rs.next()) {
                String service_id = rs.getString("s.service_id");
                String service_name = rs.getString("s.service_name");
                Double service_area = rs.getDouble("s.service_area");
                Double service_cost = rs.getDouble("s.service_cost");
                int service_max_people = rs.getInt("s.service_max_people");
                String rent_type = rs.getString("rt.rent_type_name");
                String service_type = rs.getString("st.service_type_name");
                String standard_room = rs.getString("s.standard_room");
                String description_other_convenience = rs.getString("s.description_other_convenience");
                Double pool_area = rs.getDouble("s.pool_area");
                int number_of_floors = rs.getInt("s.number_of_floors");
                services.add(new Service(service_id, service_name, service_area, service_cost, service_max_people, rent_type, service_type, standard_room, description_other_convenience, pool_area, number_of_floors));
            }
            return services;
        }
    }
}

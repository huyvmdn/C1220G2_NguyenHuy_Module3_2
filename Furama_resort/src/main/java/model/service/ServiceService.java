package model.service;

import model.bean.Customer;
import model.bean.Service;
import model.commons.Validation;
import model.ripository.IServiceDAO;
import model.ripository.ServiceDAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceService implements IServiceService {
    IServiceDAO serviceDAO= new ServiceDAO();
    @Override
    public List<String> insertService(Service service) throws SQLException {
        List<String> errService = new ArrayList<>();
        service.setServiceId(service.getServiceId().toUpperCase());
        errService.add(Validation.checkServiceId(service.getServiceId()));
        errService.add(Validation.checkNull(service.getServiceName()));
        errService.add(Validation.checkNumberDouble(String.valueOf(service.getServiceArea())));
        errService.add(Validation.checkNumberDouble(String.valueOf(service.getServiceCost())));
        errService.add(Validation.checkNumberInterger(String.valueOf(service.getServiceMaxPeople())));
        errService.add(Validation.checkNull(service.getRentType()));
        errService.add(Validation.checkNull(service.getServiceType()));
        errService.add(Validation.checkNull(service.getStandardRoom()));
        errService.add(Validation.checkNull(service.getDescriptionOtherConvenience()));
        errService.add(Validation.checkNumberDouble(String.valueOf(service.getPoolArea())));
        errService.add(Validation.checkNumberInterger(String.valueOf(service.getNumberOfFloors())));
        int checkFull=0;
        for (String string: errService) {
            if (string.equals("")) {
                checkFull++;
            }
        }

        if (checkFull == 11){
            serviceDAO.insertService(service);

        }
        return  errService;
    }

    @Override
    public Service selectService(String id) {
        return serviceDAO.selectService(id);
    }

    @Override
    public List<Service> selectAllUsers() {
        return serviceDAO.selectAllUsers();
    }

    @Override
    public boolean deleteService(String id) throws SQLException {
        return serviceDAO.deleteService(id);
    }

    @Override
    public boolean updateService(Service service) throws SQLException {
        return serviceDAO.updateService(service);
    }

    @Override
    public List<Service> selectUserByName(String name) throws SQLException {
        return serviceDAO.selectUserByName(name);
    }
}

package controller;

import model.bean.Customer;
import model.bean.Service;
import model.service.IServiceService;
import model.service.ServiceService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ServiceServlet", urlPatterns = "/services")

public class ServiceServlet extends HttpServlet {
    IServiceService serviceService= new ServiceService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertService(request, response);
                break;
            case "edit":
                updateService(request, response);

                break;
            case "search":
                searchService(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
            default:
                listService(request, response);
        }
    }

  

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertService(request, response);
                break;
            case "edit":
                showUpdateService(request, response);
                break;
            case "search":
                searchService(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
            default:
                listService(request, response);
        }
    }

    private void showUpdateService(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Service serviceEdit = serviceService.selectService(id);
        request.setAttribute("serviceEdit", serviceEdit);
        boolean flag = true;
        request.setAttribute("flag", flag);
        RequestDispatcher dispatcher = request.getRequestDispatcher("servive.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertService(HttpServletRequest request, HttpServletResponse response) {
        String serviceId = request.getParameter("serviceId");
        if (serviceId == null) {
            serviceId = "";
        }
        String serviceName = request.getParameter("serviceName");
        if (serviceName == null) {
            serviceName = "";
        }
        String serviceArea = request.getParameter("serviceArea");
        if (serviceArea == null) {
            serviceArea = "";
        }
        String serviceCost = request.getParameter("serviceCost");
        if (serviceCost == null) {
            serviceCost = "";
        }
        String serviceMaxPeople = request.getParameter("serviceMaxPeople");
        if (serviceMaxPeople == null) {
            serviceMaxPeople = "";
        }
        String rentType = request.getParameter("rentType");
        if (rentType == null) {
            rentType = "";
        }
        String serviceType = request.getParameter("serviceType");
        if (serviceType == null) {
            serviceType = "";
        }
        String standardRoom = request.getParameter("standardRoom");
        if (standardRoom == null) {
            standardRoom = "";
        }
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        if (descriptionOtherConvenience == null) {
            descriptionOtherConvenience = "";
        }
        String poolArea = request.getParameter("poolArea");
        if (poolArea == null) {
            poolArea = "";
        }
        String numberOfFloors = request.getParameter("numberOfFloors");
        if (numberOfFloors == null) {
            numberOfFloors = "";
        }
        Service service= new Service(serviceId,serviceName,Double.parseDouble(serviceArea),Double.parseDouble(serviceCost),Integer.parseInt(serviceMaxPeople),rentType,serviceType,standardRoom,descriptionOtherConvenience,Double.parseDouble(poolArea),Integer.parseInt(numberOfFloors));
        try {
            List<String> errService = serviceService.insertService(service);
            List<Service> listService = serviceService.selectAllUsers();
            int checkfull=0;
            boolean check=false;
            String msgcreate;
            for (String string:errService) {
                if (string.equals("")){
                    checkfull++;
                }
            }
            if (checkfull==11) {
                check=true;
            }
            if (check) {
                msgcreate = "create new Service successfully!";
            } else {
                msgcreate = "create new Service failed!";
            }
            boolean flagCreate = true;
            request.setAttribute("msgcreate",msgcreate);
            request.setAttribute("flagCreate", flagCreate);
            request.setAttribute("listService", listService);
            request.setAttribute("errService", errService);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {

            request.getRequestDispatcher("service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> listService = serviceService.selectAllUsers();
        request.setAttribute("listService", listService);
        try {
            request.getRequestDispatcher("service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");

        Boolean check = null;
        try {
            check = serviceService.deleteService(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        String msg;
        List<Service> listService = serviceService.selectAllUsers();

        if (check) {
            msg = "Update successfully!";
        } else {
            msg = "Update failed!";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("listService", listService);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchService(HttpServletRequest request, HttpServletResponse response) {
        String serviceName = request.getParameter("serviceName");
        List<Service> listService = null;
        try {
            listService = serviceService.selectUserByName(serviceName);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("listService", listService);
        try {
            request.getRequestDispatcher("service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateService(HttpServletRequest request, HttpServletResponse response) {

    }

}

package controller;

import model.bean.Customer;
import model.service.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);

                break;
            case "search":
                searchCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);

                break;
            default:
                listCustomer(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertCustomer(request, response);
                break;
            case "edit":
                showUpdateCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);

                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
        }
    }

    private void showUpdateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Customer customerEdit = customerService.selectCustomer(id);
        request.setAttribute("customerEdit", customerEdit);
        boolean flag = true;
        request.setAttribute("flag", flag);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer.jsp");
        dispatcher.forward(request, response);
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customer_name = request.getParameter("customer_name");
        List<Customer> customers = null;
        try {
            customers = customerService.selectUserByName(customer_name);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("listCustomer", customers);
        request.getRequestDispatcher("customer.jsp").forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        Boolean check = null;
        try {
            check = customerService.deleteCustomer(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        String msg;
        List<Customer> listCustomer = customerService.selectAllUsers();

        if (check) {
            msg = "Update successfully!";
        } else {
            msg = "Update failed!";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("listCustomer", listCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer.jsp");
        dispatcher.forward(request, response);
    }


    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) {
        String customer_id = request.getParameter("customer_id");
        if (customer_id == null) {
            customer_id = "";
        }
        String customer_type = request.getParameter("customer_type");
        if (customer_type == null) {
            customer_type = "";
        }
        String customer_name = request.getParameter("customer_name");
        if (customer_name == null) {
            customer_name = "";
        }
        String customer_birtday = request.getParameter("customer_birtday");
        if (customer_birtday == null) {
            customer_birtday = "";
        }
        String customer_gender = request.getParameter("customer_gender");
        if (customer_gender == null) {
            customer_gender = "";
        }
        String customer_id_card = request.getParameter("customer_id_card");
        if (customer_id_card == null) {
            customer_id_card = "";
        }
        String customer_phone = request.getParameter("customer_phone");
        if (customer_phone == null) {
            customer_phone = "";
        }
        String customer_email = request.getParameter("customer_email");
        if (customer_email == null) {
            customer_email = "";
        }
        String customer_address = request.getParameter("customer_address");
        if (customer_address == null) {
            customer_address = "";
        }
        Customer customer = new Customer(customer_id, customer_type, customer_name, customer_birtday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address);
//
        try {
            List<String> errCustomer = customerService.insertCustomer(customer);
            List<Customer> listCustomer = customerService.selectAllUsers();
            int checkfull=0;
            boolean check=false;
            String msgcreate;
            for (String string:errCustomer) {
                if (string.equals("")){
                    checkfull++;
                }
            }
            if (checkfull==9) {
                check=true;
            }
            if (check) {
                msgcreate = "create new Customer successfully!";
            } else {
                msgcreate = "create new Customer failed!";
            }
            boolean flagCreate = true;
            request.setAttribute("msgcreate",msgcreate);
            request.setAttribute("flagCreate", flagCreate);
            request.setAttribute("listCustomer", listCustomer);
            request.setAttribute("errCustomer", errCustomer);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {

            request.getRequestDispatcher("customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> listCustomer = customerService.selectAllUsers();
        request.setAttribute("listCustomer", listCustomer);
        try {
            request.getRequestDispatcher("customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String id = request.getParameter("customer_id_update");
        if (id == null) {
            id = "";
        }
        String customer_type = request.getParameter("customer_type_update");
        if (customer_type == null) {
            customer_type = "";
        }
        String customer_name = request.getParameter("customer_name_update");
        if (customer_name == null) {
            customer_name = "";
        }
        String customer_birtday = request.getParameter("customer_birthday_update");
        if (customer_birtday == null) {
            customer_birtday = "";
        }
        String customer_gender = request.getParameter("customer_gender_update");
        if (customer_gender == null) {
            customer_gender = "";
        }
        String customer_id_card = request.getParameter("customer_id_card_update");
        if (customer_id_card == null) {
            customer_id_card = "";
        }
        String customer_phone = request.getParameter("customer_phone_update");
        if (customer_phone == null) {
            customer_phone = "";
        }
        String customer_email = request.getParameter("customer_email_update");
        if (customer_email == null) {
            customer_email = "";
        }
        String customer_address = request.getParameter("customer_address_update");
        if (customer_address == null) {
            customer_address = "";
        }
        Customer customer = new Customer(id, customer_type, customer_name, customer_birtday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address);
        String msg;
        boolean check = false;
        try {
            check = customerService.updateCustomer(customer);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if (check) {
            msg = "Update successfully!";
        } else {
            msg = "Update failed!";
        }
        List<Customer> listCustomer = customerService.selectAllUsers();
        request.setAttribute("listCustomer", listCustomer);
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("customer.jsp").forward(request, response);

    }

}


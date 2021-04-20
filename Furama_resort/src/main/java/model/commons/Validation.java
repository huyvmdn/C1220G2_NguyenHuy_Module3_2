package model.commons;

import model.bean.Customer;
import model.ripository.CustomerDAO;
import model.ripository.ICustomerDAO;

public interface Validation {
    String CUSTOMER_ID = "^(KH-)[0-9]{4}$";
    String SERVICE_ID = "^(DV-)[0-9]{4}$";
    String PHONE_NUMBER = "^(090|091|\\(84\\)\\+90|\\(84\\)\\+91)[0-9]{7}$";
    String ID_CARD = "^([0-9]{9}|[0-9]{12}$)";
    String DAY_DD_MM_YYYY = "^([0][1-9]|[12][0-9]|[3][01])[/]([0][1-9]|[1][012])[/]([1][0-9]{3}|[2][0-9]{3})$";
    String DAY_YYYY_MM_DD = "^(19[0-9]{2}|20[0-9]{2})-[01][0-9]-[0123][0-9]$";
    String INTERGER = "^[0-9]+$";
    String DOUBLE = "^[0-9]+\\.?[0-9]*$";
    String NAME = "[a-zA-Z\\s]+";
    String EMAIL = "^\\w+((_|\\.)?\\w+)*@\\w+(\\.\\w+){1,3}$";
    ICustomerDAO customerDAO= new CustomerDAO();
    static String checkCustomerId(String customerId) {
        boolean check = customerId.matches(CUSTOMER_ID);
        String CheckCustomerId = "";
        if (!check) {
            CheckCustomerId = "Customer Code is form KH-XXXX (X is number from 0-9)";
        }
        Customer checkNull= customerDAO.selectCustomer(customerId);
        if (checkNull != null) {
            CheckCustomerId= "Customer Code is already exist";
        }
        return CheckCustomerId;
    }

    static String checkServiceId(String serviceId) {
        boolean check = serviceId.matches(SERVICE_ID);
        String CheckServiceId = "";
        if (!check) {
            CheckServiceId = "Service Code format is DV-XXXX (X is number 0-9)";
        }
        return CheckServiceId;
    }

    static String checkPhoneNumber(String PhoneNumber) {
        boolean check = PhoneNumber.matches(PHONE_NUMBER);
        String checkPhoneNumber = "";
        if (!check) {
            checkPhoneNumber = "Phone number must be in the format 090xxxxxxx or 091xxxxxxx or (84) + 90xxxxxxx or (84) + 91xxxxxxx)";
        }
        return checkPhoneNumber;
    }

    static String checkIdCard(String idCard) {
        boolean check = idCard.matches(ID_CARD);
        String checkIdCard = "";
        if (!check) {
            checkIdCard = "The ID number must be in the format XXXXXXXXX or XXXXXXXXXXXX (X is the number 0-9)";
        }
        return checkIdCard;
    }

    static String checkEmail(String email) {
        boolean check = email.matches(EMAIL);
        String checkEmail = "";
        if (!check) {
            checkEmail = "Email must be in the correct format abc@abc.abc";
        }
        return checkEmail;
    }

    static String checkDay(String day) {
        boolean check = day.matches(DAY_YYYY_MM_DD);
        String checkDay = "";
        if (!check) {
            checkDay = "date and time format in the format DD / MM / YYYY";
        }
        return checkDay;
    }

    static String checkNumberInterger(String number) {
        boolean check = number.matches(INTERGER);
        String checkNumberInterger = "";
        if (!check) {
            checkNumberInterger = "enter a positive integer";
        }
        return checkNumberInterger;
    }

    static String checkNumberDouble(String number) {
        boolean check = number.matches(DOUBLE);
        String checkNumberDouble = "";
        if (!check) {
            checkNumberDouble = "enter positive real numbers";
        }
        return checkNumberDouble;
    }

    static String checkName(String name) {
        boolean check = name.matches(NAME);
        String checkName = "";
        if (!check) {
            checkName ="Name invalid";
        }
        return checkName;
    }
    static String checkNull(String string) {
       String newString= "";
       if ( string.equals("") ) {
           newString= "you have not selected a type";
       }
       return newString;
    }
}

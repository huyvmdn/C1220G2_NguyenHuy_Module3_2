<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            background-image: url("https://thuthuatnhanh.com/wp-content/uploads/2020/01/background-dep-cho-thiet-ke.jpg");
        }
    </style>
</head>
<body onload="openModal(${flag}), openModalCreate(${flagCreate})">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark w-100" style="left: 0px; margin-bottom: 5px">
    <h1 style="color: #fff3cd">EMPLOYEE MANAGEMENT</h1>
</nav>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark w-100" style="left: 0px">
    <a class="navbar-brand" href="#">FURAMA </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/index.jsp"> <span style="color: white">Home</span> </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/employees">Employee <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/customers">Customer <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/services">Service <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/contracts">Contract <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="/employees">
            <button type="button" class="btn btn-outline-success my-2 my-sm-0" style="margin-right: 10px">
                <a href="/employees?action=employees">Loading database</a>
            </button>
            <button type="button" class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal"
                    data-target="#exampleModal" data-whatever="@mdo" style="margin-right: 10px">
                Create new Employee
            </button>

            <input type="hidden" name="action" value="search">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"
                   name="employeeName">
            <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search">
        </form>
    </div>
</nav>

<a href="/employees?action=create"></a>

<div align="center">
    <table id="EmployeeTable" class="table table-striped table-bordered bg-dark text-white">
        <thead>
        <tr>
            <th>employee Id</th>
            <th>employee Name</th>
            <th>employee Birthday</th>
            <th>employee Id Card</th>
            <th>employee Salary</th>
            <th>employee Phone</th>
            <th>employee Email</th>
            <th>employee Address</th>
            <th>position</th>
            <th>education Degree</th>
            <th>division</th>
            <th>username</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${listEmployee}">
            <tr>
                <td><c:out value="${employee.employeeId}"/></td>
                <td><c:out value="${employee.employeeName}"/></td>
                <td><c:out value="${employee.employeeBirthday}"/></td>
                <td><c:out value="${employee.employeeIdCard}"/></td>
                <td><c:out value="${employee.employeeSalary}"/></td>
                <td><c:out value="${employee.employeePhone}"/></td>
                <td><c:out value="${employee.employeeEmail}"/></td>
                <td><c:out value="${employee.employeeAddress}"/></td>
                <td><c:out value="${employee.position}"/></td>
                <td><c:out value="${employee.educationDegree}"/></td>
                <td><c:out value="${employee.division}"/></td>
                <td><c:out value="${employee.username}"/></td>
                <td>
                    <a class="btn btn-warning" href="/services?action=edit&id=${employee.employeeId}">
                        Edit</a>
                    <a href="#" data-toggle="modal" data-target="#xoa" class="btn btn-danger"
                       onclick="setIdDeleteToForm('${employee.employeeId}')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<div class="modal fade" id="xoa" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="xoaLabel">Confirm xoá</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Do you want to delete this employee?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitFormDelete()">DELETE</button>
            </div>
        </div>
    </div>
</div>

<form action="/employees" id="formDelete" method="post">
    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="id" id="idEmployeeDelete"/>
</form>

<form action="/employees" id="formUpdate" method="get">
    <input type="hidden" name="action" value="edit"/>
    <input type="hidden" name="id" id="idEmployeeUpdate"/>
</form>
<form action="/employees" id="default">
    <input type="hidden" name="action" value="default"/>
</form>

<form action="/employees?action=create" method="post">
    <div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 600px">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New Employee</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <p style="color: red">
                            <c:forEach var="string" items="${errEmployee}">
                                <c:if test="${string!=''}"> <c:out value="${string}"/> <br></c:if>
                            </c:forEach>
                            <c:out value="${msgcreate}"/>
                        </p>
                    </div>
                    <div class="form-group">
                        <label for="employeeId" class="col-form-label">employee Id:</label>
                        <input type="text" class="form-control" id="employeeId" name="employeeId">
                    </div>
                    <div class="form-group">
                        <label for="employeeName" class="col-form-label">employee Name:</label>
                        <input type="text" class="form-control" id="employeeName" name="employeeName">
                    </div>
                    <div class="form-group">
                        <label for="employeeBirthday" class="col-form-label">employee Birthday:</label>
                        <input type="date" class="form-control" id="employeeBirthday" name="employeeBirthday">
                    </div>

                    <div class="form-group">
                        <label for="employeeIdCard" class="col-form-label">employee Id Card:</label>
                        <input type="text" class="form-control" id="employeeIdCard" name="employeeIdCard">
                    </div>
                    <div class="form-group">
                        <label for="employeeSalary" class="col-form-label">employee Salary:</label>
                        <input type="text" class="form-control" id="employeeSalary" name="employeeSalary">
                    </div>
                    <div class="form-group">
                        <label for="employeePhone" class="col-form-label">employee Phone:</label>
                        <input type="text" class="form-control" id="employeePhone" name="employeePhone">
                    </div>
                    <div class="form-group">
                        <label for="employeeEmail" class="col-form-label">employee Email:</label>
                        <input type="text" class="form-control" id="employeeEmail" name="employeeEmail">
                    </div>
                    <div class="form-group">
                        <label for="employeeAddress" class="col-form-label">employee Address:</label>
                        <input type="text" class="form-control" id="employeeAddress" name="employeeAddress">
                    </div>
                    <div class="form-group">
                        <label for="position" class="col-form-label">position:</label>
                        <select name="position" id="position">
                            <%--                            (1,'manager'),&ndash;%&gt;--%>
                            <%--                                (2,'manage'),--%>
                            <%--                                (3,'supervisor'),--%>
                            <%--                                (4,'expert'),--%>
                            <%--                                (5,'serve'),--%>
                            <%--                                (6,'Receptionist');--%>
                            <option value="manager">Manager</option>
                            <option value="manage">Manage</option>
                            <option value="supervisor">supervisor</option>
                            <option value="expert">Expert</option>
                            <option value="serve">Serve</option>
                            <option value="Receptionist">Receptionist</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="educationDegree" class="col-form-label">education Degree:</label>
                        <select name="educationDegree" id="educationDegree">
<%--                            (1,"Intermediate"),--%>
<%--                            (2,"College"),--%>
<%--                            (3,"University"),--%>
<%--                            (4,"After university");--%>
                            <option value="Intermediate">Intermediate</option>
                            <option value="College">College</option>
                            <option value="University">University</option>
                            <option value="After university">After university</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="division" class="col-form-label">division:</label>
                        <input type="text" class="form-control" id="division" name="division">
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-form-label">user name:</label>
                        <input type="text" class="form-control" id="username" name="username">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Create new Employee">
                </div>
            </div>
        </div>
    </div>
</form>

<form action="/employees?action=edit" method="post">
    <section>
        <div class="modal fade " id="exampleModalUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 600px">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabelUpdate">Update Employee</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <p>${msg}</p>
                        </div>
                        <div class="form-group">
                            <label for="employeeIdUpdate" class="col-form-label">employee Id:</label>
                            <input type="text" class="form-control" id="employeeIdUpdate" name="employeeIdUpdate">
                        </div>
                        <div class="form-group">
                            <label for="employeeNameUpdate" class="col-form-label">employee Name:</label>
                            <input type="text" class="form-control" id="employeeNameUpdate" name="employeeNameUpdate">
                        </div>
                        <div class="form-group">
                            <label for="employeeBirthdayUpdate" class="col-form-label">employee Birthday:</label>
                            <input type="date" class="form-control" id="employeeBirthdayUpdate"
                                   name="employeeBirthdayUpdate">
                        </div>
                        <div class="form-group">
                            <label for="employeeIdCardUpdate" class="col-form-label">employee Id Card:</label>
                            <input type="text" class="form-control" id="employeeIdCardUpdate"
                                   name="employeeIdCardUpdate">
                        </div>
                        <div class="form-group">
                            <label for="employeeSalaryUpdate" class="col-form-label">employee Salary:</label>
                            <input type="text" class="form-control" id="employeeSalaryUpdate"
                                   name="employeeSalaryUpdate">
                        </div>
                        <div class="form-group">
                            <label for="employeePhoneUpdate" class="col-form-label">employee Phone:</label>
                            <input type="text" class="form-control" id="employeePhoneUpdate" name="employeePhoneUpdate">
                        </div>
                        <div class="form-group">
                            <label for="employeeEmailUpdate" class="col-form-label">employee Email:</label>
                            <input type="text" class="form-control" id="employeeEmailUpdate" name="employeeEmailUpdate">
                        </div>
                        <div class="form-group">
                            <label for="employeeAddressUpdate" class="col-form-label">employee Address:</label>
                            <input type="text" class="form-control" id="employeeAddressUpdate"
                                   name="employeeAddressUpdate">
                        </div>
                        <div class="form-group">
                            <label for="positionUpdate" class="col-form-label">position:</label>
                            <select name="positionUpdate" id="positionUpdate"></select>
                        </div>
                        <div class="form-group">
                            <label for="educationDegreeUpdate" class="col-form-label">education Degree:</label>
                            <input type="text" class="form-control" id="educationDegreeUpdate"
                                   name="educationDegreeUpdate">
                        </div>
                        <div class="form-group">
                            <label for="divisionUpdate" class="col-form-label">division:</label>
                            <input type="text" class="form-control" id="divisionUpdate" name="divisionUpdate">
                        </div>
                        <div class="form-group">
                            <label for="usernameUpdate" class="col-form-label">user name:</label>
                            <input type="text" class="form-control" id="usernameUpdate" name="usernameUpdate">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="rollback()">
                            Close
                        </button>
                        <input type="submit" class="btn btn-primary" value="Update Employee">
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>
<script src="jquery\jquery-3.6.0.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="bootstrap413\js\bootstrap.min.js"></script>

<script>
    function openModal(flag) {
        if (flag) {
            $('#exampleModalUpdate').modal('show');
        }
    }

    function openModalCreate(flagCreate) {
        if (flagCreate) {
            $('#exampleModal').modal('show');
        }
    }

    $(document).ready(function () {
        $('#EmployeeTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });


    function setIdDeleteToForm(employeeId) {
        document.getElementById("idEmployeeDelete").value = employeeId;
    }

    function submitFormDelete() {
        document.getElementById("formDelete").submit();
    }

    function setCustomerToForm(employeeId) {
        document.getElementById("idEmployeeUpdate").value = employeeId;
        document.getElementById("idEmployeeUpdate").submit();
    }

    function showName(idEdit) {
        document.getElementById("idDelete").value = idEdit;
    }

    function rollback() {
        document.getElementById("default").submit();
    }
</script>
</body>
</html>
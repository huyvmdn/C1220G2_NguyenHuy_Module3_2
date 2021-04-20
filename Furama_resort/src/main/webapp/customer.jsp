<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            background-image: url("https://thuthuatnhanh.com/wp-content/uploads/2020/01/background-dep-cho-thiet-ke.jpg");
        }
    </style>
</head>
<body onload="openModal(${flag}), openModalCreate(${flagCreate})">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark w-100" style="left: 0px; margin-bottom: 5px">
    <h1 style="color: #fff3cd">CUSTOMER MANAGEMENT</h1>
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
        <form class="form-inline my-2 my-lg-0" action="/customers">
            <button type="button" class="btn btn-outline-success my-2 my-sm-0" style="margin-right: 10px">
                <a href="customers?action=customers">Loading database</a>
            </button>
            <button type="button" class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" style="margin-right: 10px">
                Create new Customer
            </button>

            <input type="hidden" name="action" value="search">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"
                   name="customer_name">
            <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search">
        </form>
    </div>
</nav>

<a href="/customers?action=create"></a>

<div align="center">
    <table id="CustomerTable" class="table table-striped table-bordered bg-dark text-white">
        <thead>
        <tr>
            <th>ID</th>
            <th>Customer Type</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>Id Card</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${listCustomer}">
            <tr>
                <td><c:out value="${customer.customer_id}"/></td>
                <td><c:out value="${customer.customer_type}"/></td>
                <td><c:out value="${customer.customer_name}"/></td>
                <td><c:out value="${customer.customer_birthday}"/></td>
                <td><c:out value="${customer.customer_gender}"/></td>
                <td><c:out value="${customer.customer_id_card}"/></td>
                <td><c:out value="${customer.customer_phone}"/></td>
                <td><c:out value="${customer.customer_email}"/></td>
                <td><c:out value="${customer.customer_address}"/></td>
                <td>
                    <a class="btn btn-warning" href="/customers?action=edit&id=${customer.getCustomer_id()}">
                        Edit</a>
                    <a href="#" data-toggle="modal" data-target="#xoa" class="btn btn-danger"
                       onclick="setIdDeleteToForm('${customer.customer_id}')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<h3 style="text-align: center"></h3>


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
                Bạn có muốn xoá khách hàng này không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitFormDelete()">DELETE</button>
            </div>
        </div>
    </div>
</div>

<form action="/customers" id="formDelete" method="post">
    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="id" id="idCustomerDelete"/>
</form>

<form action="/customers" id="formUpdate" method="get">
    <input type="hidden" name="action" value="edit"/>
    <input type="hidden" name="id" id="idCustomerUpdate"/>
</form>
<form action="/customers" id="default">
    <input type="hidden" name="action" value="default"/>
</form>

<form action="/customers?action=create" method="post">
    <div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 600px">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New Customer</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <p style="color: red">
                            <c:forEach var="string" items="${errCustomer}">
                            <c:if test="${string!=''}"> <c:out value="${string}"/> <br></c:if>
                            </c:forEach>
                            <c:out value="${msgcreate}"/>
                        </p>
                    </div>
                    <div class="form-group">
                        <label for="customer_id" class="col-form-label">customer_id:</label>
                        <input type="text" class="form-control" id="customer_id" name="customer_id"
                        >
                    </div>
                    <div class="form-group">
                        customer_Type:
                        <input type="radio" id="customer_type_1" name="customer_type" value="Diamond"> <label
                            for="customer_type_1">Diamond</label>
                        <input type="radio" id="customer_type_2" name="customer_type" value="Platinium"> <label
                            for="customer_type_2">Platinium</label>
                        <input type="radio" id="customer_type_3" name="customer_type" value="Gold"><label
                            for="customer_type_3">Gold</label>
                        <input type="radio" id="customer_type_4" name="customer_type" value="Silver"><label
                            for="customer_type_4">Silver</label>
                        <input type="radio" id="customer_type_5" name="customer_type" value="Member"><label
                            for="customer_type_5">Member</label>
                    </div>
                    <div class="form-group">
                        <label for="customer_name" class="col-form-label">customer_name:</label>
                        <input type="text" class="form-control" id="customer_name" name="customer_name"
                        >
                    </div>
                    <div class="form-group">
                        <label for="customer_birtday" class="col-form-label">customer_birtday:</label>
                        <input type="date" class="form-control" id="customer_birtday" name="customer_birtday">
                    </div>
                    <div class="form-group">
                        customer_gender:
                        <input type="radio" id="customer_gender1" name="customer_gender"
                               value="Male"> <label
                            for="customer_gender1">Male</label>
                        <input type="radio" id="customer_gender0" name="customer_gender"
                               value="Female"> <label
                            for="customer_gender0">Female</label>
                    </div>
                    <div class="form-group">
                        <label for="customer_id_card" class="col-form-label">customer_id_card:</label>
                        <input type="text" class="form-control" id="customer_id_card" name="customer_id_card">
                    </div>
                    <div class="form-group">
                        <label for="customer_phone" class="col-form-label">customer_phone:</label>
                        <input type="text" class="form-control" id="customer_phone" name="customer_phone">
                    </div>
                    <div class="form-group">
                        <label for="customer_email" class="col-form-label">customer_email:</label>
                        <input type="text" class="form-control" id="customer_email" name="customer_email">
                    </div>
                    <div class="form-group">
                        <label for="customer_address" class="col-form-label">customer_address:</label>
                        <input type="text" class="form-control" id="customer_address" name="customer_address">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Create new Customer">
                </div>
            </div>
        </div>
    </div>
</form>

<form action="/customers?action=edit" method="post">
    <section>
        <div class="modal fade " id="exampleModalUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 600px">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabelUpdate">Update Customer</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <p>${msg}</p>
                        </div>
                        <div class="form-group">

                            <c:set var="checkedSilver" scope="session" value=""/>
                            <c:set var="checkedPlatinium" scope="session" value=""/>
                            <c:set var="checkedDiamond" scope="session" value=""/>
                            <c:set var="checkedGold" scope="session" value=""/>
                            <c:set var="checkedMember" scope="session" value=""/>
                            <input type="hidden" name="customer_id_update" value="${customerEdit.customer_id}">
                            customer_type:
                            <c:if test="${customerEdit.customer_type == 'Diamond'}">
                                ${checkedDiamond ='checked'}
                            </c:if>
                            <c:if test="${customerEdit.customer_type == 'Platinium'}">
                                ${checkedPlatinium ='checked'}
                            </c:if>
                            <c:if test="${customerEdit.customer_type == 'Gold'}">
                                ${checkedGold ="checked"}
                            </c:if>
                            <c:if test="${customerEdit.customer_type == 'Silver'}">
                                ${checkedSilver ='checked'}
                            </c:if>
                            <c:if test="${customerEdit.customer_type == 'Member'}">
                                ${checkedMember ='checked'}
                            </c:if>
                            <input type="radio" id="customer_type_1_update" name="customer_type_update"
                                   value="Diamond"  ${checkedDiamond}> <label
                                for="customer_type_1">Diamond</label>
                            <input type="radio" id="customer_type_2_update" name="customer_type_update"
                                   value="Platinium" ${checkedPlatinium}>
                            <label
                                    for="customer_type_2">Platinium</label>
                            <input type="radio" id="customer_type_3_update" name="customer_type_update"
                                   value="Gold"   ${checkedGold}><label
                                for="customer_type_3">Gold</label>
                            <input type="radio" id="customer_type_4_update" name="customer_type_update"
                                   value="Silver"  ${checkedSilver}><label
                                for="customer_type_4">Silver</label>
                            <input type="radio" id="customer_type_5_update" name="customer_type_update" value="Member"
                                ${checkedMember}><label
                                for="customer_type_5">Member</label>
                        </div>
                        <div class="form-group">
                            <label for="customer_name_update" class="col-form-label">customer_name:</label>
                            <input type="text" class="form-control" id="customer_name_update"
                                   name="customer_name_update" value="${customerEdit.customer_name}">
                        </div>
                        <div class="form-group">
                            <label for="customer_birthday_update" class="col-form-label">customer_birtday:</label>
                            <input type="date" class="form-control" id="customer_birthday_update"
                                   name="customer_birthday_update" value="${customerEdit.customer_birthday}">
                        </div>
                        <div class="form-group">

                            customer_gender:
                            <c:set var="checkedMale" scope="session" value=""/>
                            <c:set var="checkedFemale" scope="session" value=""/>
                            <c:if test="${customerEdit.customer_gender == 'Male'}">
                                ${checkedMale ='checked'}
                            </c:if>

                            <c:if test="${customerEdit.customer_gender == 'Female'}">
                                ${checkedFemale ='checked'}
                            </c:if>
                            <input type="radio" id="customer_gender1_update" name="customer_gender_update"
                                   value="Male" ${checkedMale}> <label
                                for="customer_gender1_update">Male</label>
                            <input type="radio" id="customer_gender0_update" name="customer_gender_update"
                                   value="Female" ${checkedFemale}> <label
                                for="customer_gender0_update">Female</label>
                        </div>
                        <div class="form-group">
                            <label for="customer_id_card" class="col-form-label">customer_id_card:</label>
                            <input type="text" class="form-control" id="customer_id_card_update"
                                   name="customer_id_card_update" value="${customerEdit.customer_id_card}">
                        </div>
                        <div class="form-group">
                            <label for="customer_phone_update" class="col-form-label">customer_phone:</label>
                            <input type="text" class="form-control" id="customer_phone_update"
                                   name="customer_phone_update" value="${customerEdit.customer_phone}">
                        </div>
                        <div class="form-group">
                            <label for="customer_email_update" class="col-form-label">customer_email:</label>
                            <input type="text" class="form-control" id="customer_email_update"
                                   name="customer_email_update" value="${customerEdit.customer_email}">
                        </div>
                        <div class="form-group">
                            <label for="customer_address_update" class="col-form-label">customer_address:</label>
                            <input type="text" class="form-control" id="customer_address_update"
                                   name="customer_address_update" value="${customerEdit.customer_address}">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="rollback()">Close</button>
                        <input type="submit" class="btn btn-primary" value="Update Customer">
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
        $('#CustomerTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });


    function setIdDeleteToForm(Customer_id) {
        document.getElementById("idCustomerDelete").value = Customer_id;
    }

    function submitFormDelete() {
        document.getElementById("formDelete").submit();
    }

    function setCustomerToForm(Customer_id) {
        document.getElementById("idCustomerUpdate").value = Customer_id;
        document.getElementById("idCustomerUpdate").submit();
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
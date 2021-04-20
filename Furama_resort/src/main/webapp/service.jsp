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
    <h1 style="color: #fff3cd">SERVICE MANAGEMENT</h1>
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
        <form class="form-inline my-2 my-lg-0" action="/services">
            <button type="button" class="btn btn-outline-success my-2 my-sm-0" style="margin-right: 10px">
                <a href="/services?action=services">Loading database</a>
            </button>
            <button type="button" class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal"
                    data-target="#exampleModal" data-whatever="@mdo" style="margin-right: 10px">
                Create new Service
            </button>

            <input type="hidden" name="action" value="search">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"
                   name="serviceName">
            <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search">
        </form>
    </div>
</nav>

<a href="/services?action=create"></a>

<div align="center">
    <table id="serviceTable" class="table table-striped table-bordered bg-dark text-white">
        <thead>
        <tr>
            <th>service Id</th>
            <th>service Name</th>
            <th>service Area</th>
            <th>service Cost</th>
            <th>service Max People</th>
            <th>rent Type</th>
            <th>service Type</th>
            <th>standard Room</th>
            <th>description Other Convenience</th>
            <th>pool Area</th>
            <th>number Of Floors</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="service" items="${listService}">
            <tr>
                <td><c:out value="${service.serviceId}"/></td>
                <td><c:out value="${service.serviceName}"/></td>
                <td><c:out value="${service.serviceArea}"/></td>
                <td><c:out value="${service.serviceCost}"/></td>
                <td><c:out value="${service.serviceMaxPeople}"/></td>
                <td><c:out value="${service.rentType}"/></td>
                <td><c:out value="${service.serviceType}"/></td>
                <td><c:out value="${service.standardRoom}"/></td>
                <td><c:out value="${service.descriptionOtherConvenience}"/></td>
                <td><c:out value="${service.poolArea}"/></td>
                <td><c:out value="${service.numberOfFloors}"/></td>
                <td>
                    <a class="btn btn-warning" href="/services?action=edit&id=${service.serviceId}">
                        Edit</a>
                    <a href="#" data-toggle="modal" data-target="#xoa" class="btn btn-danger"
                       onclick="setIdDeleteToForm('${service.serviceId}')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%--<h3 style="text-align: center"></h3>--%>


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
                Do you want to delete this service?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitFormDelete()">DELETE</button>
            </div>
        </div>
    </div>
</div>

<form action="/services" id="formDelete" method="post">
    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="id" id="idServiceDelete"/>
</form>

<form action="/services" id="formUpdate" method="get">
    <input type="hidden" name="action" value="edit"/>
    <input type="hidden" name="id" id="idServiceUpdate"/>
</form>
<form action="/services" id="default">
    <input type="hidden" name="action" value="default"/>
</form>

<form action="/services?action=create" method="post">
    <div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 600px">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New Service</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <p style="color: red">
                            <c:forEach var="string" items="${errService}">
                                <c:if test="${string!=''}"> <c:out value="${string}"/> <br></c:if>
                            </c:forEach>
                            <c:out value="${msgcreate}"/>
                        </p>
                    </div>
                    <div class="form-group">
                        <label for="serviceId" class="col-form-label">Service id:</label>
                        <input type="text" class="form-control" id="serviceId" name="serviceId">
                    </div>
                    <div class="form-group">
                        <label for="serviceName" class="col-form-label">service Name:</label>
                        <input type="text" class="form-control" id="serviceName" name="serviceName">
                    </div>
                    <div class="form-group">
                        <label for="serviceArea" class="col-form-label">service Area :</label>
                        <input type="text" class="form-control" id="serviceArea" name="serviceArea">
                    </div>

                    <div class="form-group">
                        <label for="serviceCost" class="col-form-label">service Cost:</label>
                        <input type="text" class="form-control" id="serviceCost" name="serviceCost">
                    </div>
                    <div class="form-group">
                        <label for="serviceMaxPeople" class="col-form-label">service Max People:</label>
                        <input type="text" class="form-control" id="serviceMaxPeople" name="serviceMaxPeople">
                    </div>
                    <div class="form-group">
                        rent Type:
                        <input type="radio" id="rentType1" name="rentType" value="Day">
                        <label for="rentType1">Day</label>

                        <input type="radio" id="rentType2" name="rentType" value="Month">
                        <label for="rentType2">Month</label>

                        <input type="radio" id="rentType3" name="rentType" value="Year">
                        <label for="rentType3">Year</label>

                        <input type="radio" id="rentType4" name="rentType" value="Hours">
                        <label for="rentType4">Hours</label>
                    </div>
                    <div class="form-group">
                        service Type:
                        <input type="radio" id="serviceType1" name="serviceType" value="Villa">
                        <label for="rentType2">Villa</label>

                        <input type="radio" id="serviceType2" name="serviceType" value="House">
                        <label for="rentType3">House</label>

                        <input type="radio" id="serviceType3" name="serviceType" value="Room">
                        <label for="rentType3">Room</label>
                    </div>
                    <div class="form-group">
                        <label for="standardRoom" class="col-form-label">standard Room:</label>
                        <input type="text" class="form-control" id="standardRoom" name="standardRoom">
                    </div>
                    <div class="form-group">
                        <label for="descriptionOtherConvenience" class="col-form-label">description Other
                            Convenience:</label>
                        <input type="text" class="form-control" id="descriptionOtherConvenience"
                               name="descriptionOtherConvenience">
                    </div>
                    <div class="form-group">
                        <label for="poolArea" class="col-form-label">pool Area:</label>
                        <input type="text" class="form-control" id="poolArea" name="poolArea">
                    </div>
                    <div class="form-group">
                        <label for="numberOfFloors" class="col-form-label">number Of Floors:</label>
                        <input type="text" class="form-control" id="numberOfFloors" name="numberOfFloors">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Create new Service">
                </div>
            </div>
        </div>
    </div>
</form>

<form action="/services?action=edit" method="post">
    <section>
        <div class="modal fade " id="exampleModalUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 600px">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabelUpdate">Update Service</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <p>${msg}</p>
                        </div>
                        <div class="form-group">
                            <label for="serviceIdUpdate" class="col-form-label">Service id:</label>
                            <input type="text" class="form-control" id="serviceIdUpdate" name="serviceIdUpdate">
                        </div>
                        <div class="form-group">
                            <label for="serviceNameUpdate" class="col-form-label">service Name:</label>
                            <input type="text" class="form-control" id="serviceNameUpdate" name="serviceNameUpdate">
                        </div>
                        <div class="form-group">
                            <label for="serviceAreaUpdate" class="col-form-label">service Area :</label>
                            <input type="text" class="form-control" id="serviceAreaUpdate" name="serviceAreaUpdate">
                        </div>

                        <div class="form-group">
                            <label for="serviceCostUpdate" class="col-form-label">service Cost:</label>
                            <input type="text" class="form-control" id="serviceCostUpdate" name="serviceCostUpdate">
                        </div>
                        <div class="form-group">
                            <label for="serviceMaxPeopleUpdate" class="col-form-label">service Max People:</label>
                            <input type="text" class="form-control" id="serviceMaxPeopleUpdate"
                                   name="serviceMaxPeopleUpdate">
                        </div>
                        <div class="form-group">
                            <label for="rentTypeUpdate" class="col-form-label">rent Type:</label>
                            <input type="text" class="form-control" id="rentTypeUpdate" name="rentTypeUpdate">
                        </div>
                        <div class="form-group">
                            <label for="serviceTypeUpdate" class="col-form-label">service Type:</label>
                            <input type="text" class="form-control" id="serviceTypeUpdate" name="serviceTypeUpdate">
                        </div>
                        <div class="form-group">
                            <label for="standardRoomUpdate" class="col-form-label">standard Room:</label>
                            <input type="text" class="form-control" id="standardRoomUpdate" name="standardRoomUpdate">
                        </div>
                        <div class="form-group">
                            <label for="descriptionOtherConvenienceUpdate" class="col-form-label">description Other
                                Convenience:</label>
                            <input type="text" class="form-control" id="descriptionOtherConvenienceUpdate"
                                   name="descriptionOtherConvenienceUpdate">
                        </div>
                        <div class="form-group">
                            <label for="poolAreaUpdate" class="col-form-label">pool Area:</label>
                            <input type="text" class="form-control" id="poolAreaUpdate" name="poolAreaUpdate">
                        </div>
                        <div class="form-group">
                            <label for="numberOfFloorsUpdate" class="col-form-label">number Of Floors:</label>
                            <input type="text" class="form-control" id="numberOfFloorsUpdate"
                                   name="numberOfFloorsUpdate">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="rollback()">
                            Close
                        </button>
                        <input type="submit" class="btn btn-primary" value="Update Service">
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
        $('#serviceTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });


    function setIdDeleteToForm(serviceId) {
        document.getElementById("idServiceDelete").value = serviceId;
    }

    function submitFormDelete() {
        document.getElementById("formDelete").submit();
    }

    function setCustomerToForm(serviceId) {
        document.getElementById("idServiceUpdate").value = serviceId;
        document.getElementById("idServiceUpdate").submit();
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
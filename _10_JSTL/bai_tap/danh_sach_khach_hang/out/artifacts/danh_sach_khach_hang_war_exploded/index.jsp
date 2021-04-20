<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>$Title$</title>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--%>
    <link rel="stylesheet"
          href="bootstrap-4.0.0-dist\css\bootstrap.min.css">

  </head>
  <body>

  <table class="table table-hover " border="1">
    <thead>
    <tr>
      <th scope="col">STT</th>
      <th scope="col">Tên</th>
      <th scope="col">Ngày sinh</th>
      <th scope="col">Địa chỉ</th>
      <th scope="col">Ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="khachHang" items="${arrayListServlet}" varStatus="loop" >
    <tr>
      <th scope="row">${loop.index + 1}</th>
      <td>${khachHang.ten}</td>
      <td>${khachHang.ngaySinh}</td>
      <td>${khachHang.diaChi}</td>
      <td ><img src="<c:out value="${khachHang.anh}"/>" alt="..." height="100"> </td>
    </tr>
    </c:forEach>
    </tbody>
  </table>
  </body>
</html>

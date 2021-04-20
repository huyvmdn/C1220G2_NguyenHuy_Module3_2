<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12/04/2021
  Time: 2:19 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Hien Thi</title>
  </head>
  <body>
  <h2> Quản lý sản phẩm </h2>
  <h3> <a href="/products?action=create">Create</a></h3>
  <table border="1">
    <tr>
      <th>Id</th>
      <th>name</th>
      <th>price</th>
      <th>describe</th>
      <th>producer</th>
      <th colspan="2">Action</th>
    </tr>
 <c:forEach var="product" items="${productList}">
    <tr>
      <td>${product.id}</td>
      <td>${product.name}</td>
      <td>${product.price}</td>
      <td>${product.describe}</td>
      <td>${product.producer}</td>
      <td><a href="/products?action=update&id=${product.id}">Update</a></td>
      <td><a href="/products?action=delete&id=${product.id}">Delete</a></td>
    </tr>
  </c:forEach>
  </table>
  </body>
</html>

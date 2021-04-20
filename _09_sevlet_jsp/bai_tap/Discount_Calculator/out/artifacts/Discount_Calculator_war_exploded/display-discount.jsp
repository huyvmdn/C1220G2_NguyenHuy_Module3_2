<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 08/04/2021
  Time: 3:26 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Sản phẩm </h1>
<h3>Tên sản phẩm <%= request.getAttribute("name")%></h3>
<h5>Phần trăm chiếc khấu <%= request.getAttribute("chiecKhau")%></h5>
<h5>Lượng chiếc khấu <%= request.getAttribute("discountAmount")%></h5>
</body>
</html>

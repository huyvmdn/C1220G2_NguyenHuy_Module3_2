<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 08/04/2021
  Time: 3:12 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="C:\Users\Administrator\Desktop\Module 1\C1220G1_Nguyen_Huy\module_3\C1220G2_NguyenHuy_Module3\_09_sevlet_jsp\bai_tap\Discount_Calculator\css\bootstrap.min.css">
</head>
<body>

<form action="/chieckhau" method="get">
  <input type="text" name="tenSanPham" placeholder="tên sản phẩm"> <br>
  <input type="text" name="gia" placeholder="Giá niêm yết của sản phẩm"><br>
  <input type="text" name="chiecKhau" placeholder="Tỷ lệ chiếc khấu"><br>
  <input type="submit" id = "submit" value="Calculate Discount">

</form>
</body>
</html>

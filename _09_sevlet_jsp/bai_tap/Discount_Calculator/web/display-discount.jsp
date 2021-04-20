<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

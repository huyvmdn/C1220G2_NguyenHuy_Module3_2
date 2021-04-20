<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 08/04/2021
  Time: 3:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="">
</head>
<body>
<div class="row">
  <div class="col-lg-12"><h1>Responsive Image Gallery</h1></div>
</div>

<div class="row">
  <div class="col-lg-12"><h3>Resize the browser window to see the effect.</h3></div>
</div>
<div>
  <div class="row" style="margin: 0px 5px;">
    <div class="col-lg-3 col-md-6">
      <div class="card">
        <img class="card-img-top" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRffp5bzLI_vXfywdbPX56M_w5q5pR_zhL1ud82YkClRVAowH2MqM0oKUqc2ZxofozOz78&usqp=CAU"
             alt="Card image cap">
        <div class="card-body">
          <p class="card-text text-center">Add a description of the image here</p>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="card">
        <img class="card-img-top" src="https://danviet.mediacdn.vn/upload/3-2019/images/2019-07-15/Bang-gia-xe-may-Suzuki-thang-7-2019-Ho-tro-toi-2-trieu-dong-su2-1563201695-width660height430.jpg"
             alt="Card image cap">
        <div class="card-body">
          <p class="card-text text-center">Add a description of the image here</p>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="card">
        <img class="card-img-top" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ_WLvw7tmrOkjEk8EdpZ9rwVwmGO-My1_3g&usqp=CAU"
             alt="Card image cap">
        <div class="card-body">
          <p class="card-text text-center">Add a description of the image here</p>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="card">
        <img class="card-img-top" src="https://salt.tikicdn.com/cache/w444/ts/product/c1/92/56/694bbf6172f73ff5d33ed56c04eb5cfd.jpg"
             alt="Card image cap">
        <div class="card-body">
          <p class="card-text text-center">Add a description of the image here</p>
        </div>
      </div>
    </div>
  </div>
</div>

<p>This example use media queries to re-arrange the images on different screen sizes: for screens larger than 700px
  wide, it will show four images side by side, for screens smaller than 700px, it will show two images side by side.
  For screens smaller than 500px, the images will stack vertically (100%).</p>


<script src="C:\Users\Administrator\Desktop\Module 1\C1220G1_Nguyen_Huy\module_3\C1220G2_NguyenHuy_Module3\_08_bootstrap\js\jquery-3.6.0.min.js"></script>
<script src="C:\Users\Administrator\Desktop\Module 1\C1220G1_Nguyen_Huy\module_3\C1220G2_NguyenHuy_Module3\_08_bootstrap\js\bootstrap.min.js"></script>
</body>
</html>

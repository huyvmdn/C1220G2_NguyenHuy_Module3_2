<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 15/04/2021
  Time: 1:46 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>trang chu</title>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
</head>
<style>
    .maunen {
        height: 150px;
        background-color: #818182
    }
    body{
        background-color: black;
    }
</style>
<body>
<div class="container default-color0">
    <div class="row w-100 maunen" style="height: 150px; background-color: #818182">
        <div CLASS="col-1">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png" alt="logo" height="150" style="margin-left: 20px">
        </div>
        <div CLASS="col-8">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/07/Vietnam_Danang_Furama_Resort_Exterior_Beach.jpg" height="150" alt="" style="margin-left: 60px">
            <img src="https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10024652-bc18297d4573af8399677d30a0363d4e.jpeg?tr=q-40,c-at_max,w-740,h-500&_src=imagekit" height="150" alt="" >
            <img src="https://luhanhvietnam.com.vn/du-lich/vnt_upload/news/07_2019/mua-he.jpg" height="150" alt="" >

        </div>
        <div CLASS="col-3">
            <p style="color: white">
                103 – 105 Đường Võ Nguyên Giáp,Phường Khuê Mỹ,Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam <br>
                7.0 km từ Sân bay Quốc tế Đà Nẵn
            </p>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark w-100" style="left: -15px">
        <a class="navbar-brand" href="https://furamavietnam.com/vi/">FURAMA </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"> <span style="color: white">Home</span> </a>
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
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <div class="row " style="margin-right: 15px; height: 700px">
        <div class="col-2 bg-dark">
            <hr style="background-color: white">
            <a href="https://furamavietnam.com/vi/the-resort/">  <p style="text-align: center;color: white">Giới thiệu</p></a>
            <hr style="background-color: white">
            <p style="text-align: center;color: white">Item 2</p>
            <hr style="background-color: white">
            <p style="text-align: center;color: white">Item 3</p>
        </div>
        <div class="col-10 bg-dark">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" height="500"
                             src="https://phulong.com/UploadFiles/Images/FURAMA%2020%20NAM.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" height="500"
                             src="https://dulichcanhdieu.com.vn/wp-content/uploads/resort-5-sao-cao-cap-furama-da-nang-1.png"
                             alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" height="500"
                             src="https://pix10.agoda.net/hotelImages/10953/-1/62732aec5194871b6ee397fedbb3bf62.jpg?s=1024x768"
                             alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="row maunen " style="margin-left: 0px;width: 100%; height: auto">
            <div class="col-lg-4 col-sm-12 " style="border: double">Hướng Dẫn Di Chuyển
                Khu nghỉ dưỡng Furama là cơ sở hàng đầu để khám phá một trong những điểm đến hấp dẫn nhất Châu Á. <br> Chỉ cách Đà Nẵng một quãng lái xe ngắn là bốn Di sản Văn hóa Thế giới được UNESCO công nhận:
              </div>
            <div class="col-lg-4 col-sm-12" style="border: double">
                Email: reservation@furamavietnam.com * www.furamavietnam.com <br> GDS-Codes: Amadeus-WWDADFUR, Apollo/Galileo-WW16236, SabreWW32771, Worldspan-WWDADFU
            </div>
            <div class="col-lg-4 col-sm-12 " style="border: double">Liên hệ
                103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam. <br>
                Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666
            </div>
        </div>
    </div>
</div>
<script src="jquery\jquery-3.6.0.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="bootstrap413\js\bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $('#userTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>

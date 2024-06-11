<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Liên hệ</title>
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <div class="page-wrapper">
            <div class="intro text-center mb-5">
                <div class="title-page">Liên hệ</div>
                <div class="row">
                    <div class="col-xs-12 a-left">
                        <ul class="desc-intro">
                            <li class="home">
                                <a href="./ViewHome.html"><span style="color:#fff">Trang chủ</span></a>
                                <span class="mx-1" style="color:#fff"> / </span>
                            </li>
                            <li class="intro-item"><span>Liên hệ</span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- CONTENT  -->
            <div class="box-lienhe mt-5">
                <div class="container" style="padding-bottom: 50px">
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <h2 class="title-lienhe"><strong>Công ty cổ phần bất động sản SkyLand</strong></h2>
                            <div class="desc-lienhe">
                                <p>Được thành lập vào ngày 20/08/2008 với niềm đam mê và khát vọng thành công trong lĩnh vực
                                    bất động sản. Nhờ chiến lược rõ ràng và hướng đi đúng, SkyLand đã nhanh chóng phát triển
                                    và đạt được những thành công nhất định.</p>
                                <ul class="margin-bottom-15 link" style="list-style-type: none;">
                                    <li>
                                        <span class="block_fonticon"><i class="fa fa-map-marker icon-lienhe"></i></span>
                                        <span class="title-li"> 46 Man Thiện, TP. Thủ Đức, TP. HCM</span>
                                    </li>
                                    <li>
                                        <span class="block_fonticon"><i class="fa fa-mobile icon-lienhe"></i></span>
                                        <span class="title-li">
                                                Hotline: <a style="color: #434a6e;" class="fone" href="">0922227</a>

                                            </span>
                                    </li>
                                    <li>
                                        <span class="block_fonticon"><i class="fa fa-envelope icon-lienhe"></i></span>
                                        <span class="title-li">Email: <a style="color: #434a6e;"
                                                                         href="">vsh@gmail.com</a></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-12 col-md-6" style="border: solid #aaa 1px; border-radius: 5px; padding-top: 1rem; padding-bottom: 1rem">
                            <h2 class="title-lienhe"><strong>Liên hệ với chúng tôi</strong></h2>
                            <form id="formData">
                                <div class="row">
                                    <div class="col">
                                        <input type="text" class="form-control" placeholder="Họ và tên" id="name">

                                    </div>

                                    <div class="col">
                                        <input type="text" class="form-control" placeholder="Email" id="email">
                                    </div>
                                </div>
                                <input type="text" class="form-control mt-3" placeholder="Số điện thoại" id="phone">

                                <input type="text" class="form-control mt-3" placeholder="Nhu cầu" id="demand">

                                <button class="btn btn-primary px-4 mt-3" type="button" id="btnSendCustonerInfo">
                                    Gửi liên hệ
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="map">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="google-map margin-bottom-30">
                                <div class="maps_iframe">
                                    <iframe style="width: 100%;"
                                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.577731862711!2d106.7695372142139!3d10.850261760047032!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f8d0e993b05%3A0x8abf4c480f8b822b!2zOTcgTWFuIFRoacOqbiwgUGjDuiBIaeG7h3AgSMaw4budYywgbmjhuq10IHPDumMgVHJ1w6JuIFbEg25nLCBWaeG7h3QgTmFt!5e0!3m2!1sen!2s!4v1652520257601!5m2!1sen!2s"
                                            width="600" height="450" style="border:0;" allowfullscreen=""
                                            loading="lazy"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- FOOTER  -->
            <footer class="footer">
                <div class="container">
                    <div class="top-footer text-center mt-0">
                        <div class="logo logo-footer pt-5">
                            <a href="./ViewHome.html"><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo_footer.png?1676257083798" alt="logo-footer"></a>
                            <p class="desc-logo-footer mt-3">Với hơn 10 năm kinh nghiệm, SkyLand tự hào là sàn
                                mua
                                bán, giao dịch và quảng cáo
                                bất động sản hàng đầu tại Việt Nam</p>
                            <div class="item-footer mt-5">
                                <div class="row">
                                    <div class="col-12 col-md-4 text-center">
                                        <div class="icon-footer">
                                            <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_maps.png?1676257083798" alt="">
                                        </div>
                                        <div class="content-center-footer">
                                            <p class="mb-1 mt-3">Trụ sở chính</p>
                                            <p class="desc-footer">Số 46 Man Thiện, TP Thủ Đức, TP HCM</p>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 text-center">
                                        <div class="icon-footer">
                                            <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_phone.png?1676257083798" alt="anh"/>
                                        </div>
                                        <div class="content-center-footer">
                                            <p class="mb-1 mt-3">Hotline</p>
                                            <p class="desc-footer"><a class="a-text" href="#">098828</a></p>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4 text-center">
                                        <div class="icon-footer">
                                            <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_email.png?1676257083798g" alt="">
                                        </div>
                                        <div class="content-center-footer">
                                            <p class="mb-1 mt-3">Email</p>
                                            <p class="desc-footer"><a class="a-text" href="#">vsh@gmail.com</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <div class="border-bottom mb-5 mt-4"></div>
                        </div>
                    </div>
                    <div class="bottom-footer">
                        <div class="row">
                            <div class="col-12 col-md-3">
                                <h4 class="title-item-bottom-footer">Thông tin công ty</h4>
                                <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                    chủ</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                    sản</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                            </div>
                            <div class="col-12 col-md-3">
                                <h4 class="title-item-bottom-footer">Chính sách hoạt động</h4>
                                <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                    chủ</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                    sản</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                            </div>
                            <div class="col-12 col-md-3">
                                <h4 class="title-item-bottom-footer">Hỗ trợ khách hàng</h4>
                                <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                    chủ</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                    sản</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                            </div>
                            <div class="col-12 col-md-3">
                                <h4 class="title-item-bottom-footer">Kết nối với chúng tôi</h4>
                                <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                                    chủ</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                                    sản</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                                <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bottom-footer-2">
                    <div class="text-center desc-bottom-footer-2">@ Bản quyền thuộc về Happy Team |
                        Cung cấp bởi <a class="a-text group-name" href="#">HappyTeam</a></div>
                </div>
            </footer>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                const urlParams = new URLSearchParams(window.location.search);
                const formDataSent = urlParams.has('formDataSent');
                $('#btnSendCustonerInfo').click(function (e){
                    e.preventDefault();
                    var data = {};
                    data['fullname'] = $('#name').val().trim();
                    data['email'] = $('#email').val().trim();
                    data['phone'] = $('#phone').val().trim();
                    data['demand'] = $('#demand').val().trim();
                    data['status'] = "Chưa xử lý"
                    if(data['fullname'] != '' && data['phone'] != '' && data['email'] != ''){
                        addCustomer(data);
                    }
                    else {
                        localStorage.setItem('formData', JSON.stringify(data));
                        var formData = localStorage.getItem('formData');
                        window.location.href = "<c:url value='/lien-he'/>?formDataSent=true";
                    }
                });
                if(formDataSent){
                    var formData = localStorage.getItem('formData');
                    if(formData){
                        formData = JSON.parse(formData);
                        $.each(formData, function(key, value){
                            $('[name="' + key + '"]').val(value);
                            if (value === "") {
                                if(key === "fullname"){
                                    var inputField = $('#name');
                                    var errorSpan = $('<span style="color: red">*vui lòng điền họ và tên</span>');
                                    inputField.after(errorSpan);
                                }
                                else if(key === "phone"){
                                    var inputField = $('#phone');
                                    var errorSpan = $('<span style="color: red">*vui lòng điền số điện thoại</span>');
                                    inputField.after(errorSpan);
                                }
                                else if(key === "email"){
                                    var inputField = $('#email');
                                    var errorSpan = $('<span style="color: red">*vui lòng điền email</span>');
                                    inputField.after(errorSpan);
                                }
                            }
                            else{
                                if(key === "fullname") $('#name').val(value);
                                else if(key === "phone") $('#phone').val(value);
                                else if(key == "email") $('#email').val(value);
                                else $('#demand').val(value);;
                            }
                        });
                    }
                }
            });

            function addCustomer(data){
                $.ajax({
                    type: "POST",
                    url: "/api/customer",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "JSON",
                    success: function (respond) {
                        if (confirm("Gửi thông tin thành công")) {
                            window.location.href = "<c:url value='/lien-he'/>";
                        }
                    },
                    error: function (respond){
                        if (confirm("Gửi thông tin không thành công")) {
                            window.location.href = "<c:url value='/lien-he'/>";
                        }
                    }
                })
            }

        </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>

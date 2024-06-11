<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<c:url var="buildingEditURL" value="/admin/building-edit"></c:url>
<html>
    <head>
        <title>Thêm tòa nhà</title>
    </head>
    <body>
        <div class="main-content">
            <div class="main-content-inner">

                <div class="breadcrumbs" id="breadcrumbs">
                    <script type="text/javascript">
                        try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                    </script>

                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="/admin/home" style="text-decoration: none">Trang chủ</a>
                        </li>
                        <li class="active">
                            <a href="/admin/building-list" style="text-decoration: none">Danh sách tòa nhà</a>
                            <li class="active" modelAttribute="buildingEdit">
                                <c:if test="${not empty buildingEdit.id}">
                                    Cập nhật tòa nhà
                                </c:if>
                                <c:if test="${empty buildingEdit.id}">
                                    Thêm tòa nhà
                                </c:if>
                            </li>
                        </li>
                    </ul><!-- /.breadcrumb -->

                </div>

                <div class="page-content">
                    <div class="row" bis_skin_checked="1">
                        <div class="col-xs-12" bis_skin_checked="1">
                            <!-- PAGE CONTENT BEGINS -->
                            <form:form action="${buildingEditURL}" modelAttribute="buildingEdit" id="form-edit" method="GET">
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Tên tòa nhà </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="name" type="text" class="col-xs-10 col-sm-5" id="buildingName"/>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Quận </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:select name="districts" path="district">
                                            <form:option value="">---Chọn Quận---</form:option>
                                            <form:options items="${districts}"></form:options>
                                        </form:select><br>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Phường </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="ward" value="" type="text" class="col-xs-10 col-sm-5" id="ward"/>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Đường </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="street" value="" type="text" class="col-xs-10 col-sm-5" id="street"/>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Kết cấu </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="structure" value="" type="text" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Số tầng hầm </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="numberOfBasement" value="" type="number" class="col-xs-10 col-sm-5" id="numberOfBasement"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Diện tích sàn </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="floorArea" value="" type="number" class="col-xs-10 col-sm-5" id = "floorArea"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Hướng </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="direction" value="" type="text" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Hạng </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="level" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Diện tích thuê</label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="rentArea" value="" type="text" class="col-xs-10 col-sm-5" id="rentArea"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Giá thuê</label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="rentPrice" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Mô tả giá </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="rentPriceDescription" value="" type="text" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Phí dịch vụ </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="serviceFee" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Phí ô tô </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="carFee" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Phí mô tô </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="motoFee" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Phí ngoài giờ </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="overtimeFee" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Tiền điện </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="electricityFee" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Đặt cọc </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="deposit" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Thanh toán </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="payment" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Thời hạn thuê </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="rentTime" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Thời gian trang trí </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="decorationtime" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Tên quản lý </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="managerName" value="" type="text" class="col-xs-10 col-sm-5" id="managerName"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> SĐT quản lý </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="managerPhone" value="" type="text" class="col-xs-10 col-sm-5" id="managerPhone"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Phí môi giới </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="brokerageFee" value="" type="number" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Loại tòa nhà </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <div class="buiding-search-check" style="padding-top: 7px; display: inline" id="typeCode">
                                            <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Ghi chú </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="note" type="text" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>

                                <div class="clearfix form-actions" bis_skin_checked="1" style="border-top: none; padding: 0;">
                                    <div class="col-md-offset-3 col-md-9" bis_skin_checked="1" style="padding-left: 6px;">

                                        <button class="my-button-apply" type="button" id="btnAddOrUpdateBuilding">
                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                            <c:if test="${not empty buildingEdit.id}">
                                                Cập nhật tòa nhà
                                            </c:if>
                                            <c:if test="${empty buildingEdit.id}">
                                                Thêm tòa nhà
                                            </c:if>
                                        </button>
                                        &nbsp; &nbsp; &nbsp;
                                        <button class="my-button-cancel" type="button" id="cancelBtn">
                                            <i class="ace-icon fa fa-undo bigger-110"></i>
                                            Hủy thao tác
                                        </button>
                                    </div>
                                </div>

                                <form:hidden path="id" id = "buildingId"/>

                            </form:form>
                            <div class="hr hr-18 dotted hr-double" bis_skin_checked="1"></div>
                        </div><!-- /.col -->
                    </div>
                </div><!-- /.page-content -->
            </div>
        </div><!-- /.main-content -->
        <%--alert custom--%>
        <div id="customAlertBackdrop" class="custom-alert-backdrop"></div>
        <div id="customAlert" class="custom-alert">
            <span id="customAlertMessage" class="custom-alert-message"></span>
            <button id="customAlertButton" class="custom-alert-button">OK</button>
        </div>
        <script>
            $(document).ready(function(){
                const urlParams = new URLSearchParams(window.location.search);
                const formDataSent = urlParams.has('formDataSent');
                $('#btnAddOrUpdateBuilding').click(function(){
                    var data = {};
                    var typeCode = [];
                    var formData = $('#form-edit').serializeArray();
                    $.each(formData, function(i, v){
                        if(v.name != "typeCode"){
                            data["" + v.name + ""] = v.value.trim();
                        }
                        else{
                            typeCode.push(v.value);
                        }
                    })
                    data["typeCode"] = typeCode;
                    if(typeCode != ''
                        && data['name'] != ''
                        && data['district'] != ''
                        && data['ward'] != ''
                        && data['street'] != ''
                        && data['numberOfBasement'] != ''
                        && data['managerName'] != ''
                        && data['managerPhone'] != ''
                        && data['floorArea'] != ''
                        && data['rentArea'] != ''){

                        addOrUpdateBuilding(data);
                    }
                    else{
                        localStorage.setItem('formData', JSON.stringify(data));
                        var formData = localStorage.getItem('formData');
                        customAlert("Vui lòng điền đầy đủ thông tin", function() {
                            window.location.href = "<c:url value='/admin/building-edit'/>?formDataSent=true";
                        });
                    }
                });
                if(formDataSent){
                    var formData = localStorage.getItem('formData');
                    if(formData){
                        formData = JSON.parse(formData);
                        $.each(formData, function(key, value){
                            $('[name="' + key + '"]').val(value);
                            if (value === "") {
                                if(key === "name"){
                                    var inputField = $('#buildingName'); // Chọn trường input
                                    var errorSpan = $('<span class="input-error">Tên tòa nhà không được để trống</span>'); // Tạo phần tử span chứa thông báo lỗi
                                    inputField.after(errorSpan);
                                }
                                else if(key === "district"){
                                    var inputField = $('#district');
                                    var errorSpan = $('<span class="input-error">Quận không được để trống</span>');
                                    inputField.after(errorSpan);
                                }
                                else if(key === "ward"){
                                    var inputField = $('#ward');
                                    var errorSpan = $('<span class="input-error">Tên phường không được để trống</span>');
                                    inputField.after(errorSpan);
                                }
                                else if(key === "street"){
                                    var inputField = $('#street');
                                    var errorSpan = $('<span class="input-error">Tên đường không được để trống</span>');
                                    inputField.after(errorSpan);
                                }
                                else if(key === "numberOfBasement"){
                                    var inputField = $('#numberOfBasement');
                                    var errorSpan = $('<span class="input-error">Số tầng hầm không được để trống</span>');
                                    inputField.after(errorSpan);
                                }
                                else if(key === "managerName"){
                                    var inputField = $('#managerName');
                                    var errorSpan = $('<span class="input-error">Tên quản lý không được để trống</span>');
                                    inputField.after(errorSpan);
                                }
                                else if(key === "managerPhone"){
                                    var inputField = $('#managerPhone');
                                    var errorSpan = $('<span class="input-error">SĐT quản lý không được để trống</span>');
                                    inputField.after(errorSpan);
                                }
                                else if(key === "floorArea"){
                                    var inputField = $('#floorArea');
                                    var errorSpan = $('<span class="input-error">Diện tích sàn không được để trống</span>');
                                    inputField.after(errorSpan);
                                }
                                else if(key === "rentArea"){
                                    var inputField = $('#rentArea');
                                    var errorSpan = $('<span class="input-error">Diện tích thuê không được để trống</span>');
                                    inputField.after(errorSpan);
                                }
                            }
                            else if(key === "typeCode" && value.length == 0){
                                var inputField = $('#typeCode');
                                var errorSpan = $('<i class="input-error" >Vui lòng chọn loại tòa nhà</i>');
                                inputField.after(errorSpan);
                            }
                        });
                    }
                }
            });
            function customAlert(message, callback) {
                var alertBackdrop = document.getElementById('customAlertBackdrop');
                var alertBox = document.getElementById('customAlert');
                var alertMessage = document.getElementById('customAlertMessage');
                var alertButton = document.getElementById('customAlertButton');

                alertMessage.textContent = message;

                alertButton.onclick = function() {
                    alertBox.style.display = 'none';
                    alertBackdrop.style.display = 'none';
                    if (callback && typeof callback === 'function') {
                        callback();
                    }
                };

                alertBox.style.display = 'block';
                alertBackdrop.style.display = 'block';
            }
            function addOrUpdateBuilding(data){
                //call api
                $.ajax({
                    type: "POST",
                    url: "${buildingAPI}",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "JSON",
                    success: function (respond) {
                        customAlert(respond['message'], function() {
                            window.location.href = "<c:url value='/admin/building-list'/>";
                        });
                    },
                    error: function (respond){
                    }
                })
            }

            $('#cancelBtn').click(function (){
                window.location.href = "/admin/building-list";
            });
        </script>
    </body>
</html>

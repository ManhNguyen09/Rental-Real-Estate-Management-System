<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerEditURL" value="/admin/customer-edit"></c:url>
<c:url var="customerAPI" value="/api/customer"></c:url>
<c:url var="transactionAPI" value="/api/transaction"></c:url>
<html>
    <head>
        <title>Thêm khách hàng</title>
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
                            <a href="/admin/customer-list" style="text-decoration: none">Danh sách khách hàng</a>
                        <li class="active" modelAttribute="buildingEdit">
                            <c:if test="${not empty buildingEdit.id}">
                                Cập nhật khách hàng
                            </c:if>
                            <c:if test="${empty buildingEdit.id}">
                                Thêm khách hàng
                            </c:if>
                        </li>
                        </li>
                    </ul><!-- /.breadcrumb -->

                </div>

                <div class="page-content">
                    <div class="row" bis_skin_checked="1">
                        <div class="col-xs-12" bis_skin_checked="1">
                            <!-- PAGE CONTENT BEGINS -->
                            <form:form action="${customerEditURL}" modelAttribute="customerCreateRequest" id="form-edit" method="GET">
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Tên khách hàng </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="fullname" type="text" class="col-xs-10 col-sm-5" id="fullname"/>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Số điện thoại </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="phone" type="text" class="col-xs-10 col-sm-5" id="phone"/>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Email </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="email" value="" type="text" class="col-xs-10 col-sm-5" id="email"/>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Tên công ty  </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="companyname" value="" type="text" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>
                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Nhu cầu </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:input path="demand" value="" type="text" class="col-xs-10 col-sm-5"/>
                                    </div>
                                </div>

                                <div class="form-group" bis_skin_checked="1">
                                    <label class="col-sm-3 control-label no-padding-right"> Tình trạng </label>
                                    <div class="col-sm-9" bis_skin_checked="1">
                                        <form:select name="statuses" path="status">
                                            <form:option value="">---Chọn Tình Trạng---</form:option>
                                            <form:options items="${statuses}"></form:options>
                                        </form:select><br>
                                    </div>
                                </div>
                                <div class="clearfix form-actions" bis_skin_checked="1" style="border-top: none; padding: 0; background-color: white">
                                    <div class="col-md-offset-3 col-md-9" bis_skin_checked="1" style="padding-left: 6px;">

                                        <button class="my-button-apply" type="button" id="btnAddOrUpdateCustomer">
                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                            <c:if test="${not empty customerCreateRequest.id}">
                                                Cập nhật khách hàng
                                            </c:if>
                                            <c:if test="${empty customerCreateRequest.id}">
                                                Thêm khách hàng
                                            </c:if>
                                        </button>
                                        &nbsp; &nbsp; &nbsp;
                                        <button class="my-button-cancel" type="button" id="cancelBtn">
                                            <i class="ace-icon fa fa-undo bigger-110"></i>
                                            Hủy thao tác
                                        </button>
                                    </div>
                                </div>
                                <form:hidden path="id" id = ""/>
                            </form:form>
                        </div><!-- /.col -->
                    </div>
                    <c:if test="${not empty customerCreateRequest.id}">
                        <c:forEach var="item" items="${TransactionList}">
                            <c:if test="${item.key == 'CSKH'}">
                                <h1 class="label label-xlg label-light arrowed-in-right" style="color: white; background-color: #8fb87e;
                            padding-right: 1.5rem;font-size: 1.5rem; margin-left: 12px">
                                        ${item.value}
                                </h1>
                                <div class="hidden-sm hidden-xs btn-group" style="margin-left: 2rem;">
                                    <button class="btn btn-xs btn-info" title="Thêm giao dịch"
                                            style="background-color: red; border-radius: 50px" onclick="addTransaction('${item.key}', ${customerCreateRequest.id})">
                                        <i class="fa-solid fa-circle-plus" style="font-size: 1.5rem; padding: 3px"></i>
                                    </button>
                                </div>
                                <div class="col-xs-12" bis_skin_checked="1">
                                    <table id="tableList" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Ngày tạo</th>
                                                <th>Người tạo</th>
                                                <th>Ngày sửa</th>
                                                <th>Người sửa</th>
                                                <th>Chi tiết giao dịch</th>
                                                <th class="center">Thao tác</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%--duyet tat ca cac toa nha duoc tra ra tu controler--%>
                                        <c:forEach var="it" items="${CSKH}">
                                            <tr class="">
                                                <td>${it.createdDate}</td>
                                                <td>${it.createdBy}</td>
                                                <td>${it.modifiedDate}</td>
                                                <td>${it.modifiedBy}</td>
                                                <td>${it.note}</td>
                                                <td class="center">
                                                    <div class="hidden-sm hidden-xs btn-group">
                                                        <button class="btn btn-xs btn-info" title="sửa giao dịch" onclick="updateTransaction('CSKH', ${customerCreateRequest.id}, ${it.id})">
                                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>

                            <div></div>

                            <c:if test="${item.key == 'DDX'}">
                                <h1 class="label label-xlg label-light arrowed-in-right" style="color: white; background-color: #8fb87e;
                                    padding-right: 1.5rem;font-size: 1.5rem; margin-left: 12px">
                                        ${item.value}
                                </h1>
                                <div class="hidden-sm hidden-xs btn-group" style="margin-left: 2rem;">
                                    <button class="btn btn-xs btn-info" title="Thêm giao dịch"
                                            style="background-color: red; border-radius: 50px" onclick="addTransaction('${item.key}', ${customerCreateRequest.id})">
                                        <i class="fa-solid fa-circle-plus" style="font-size: 1.5rem; padding: 3px"></i>
                                    </button>
                                </div>
                                <div class="col-xs-12" bis_skin_checked="1">
                                    <table id="tableList1" class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>Ngày tạo</th>
                                            <th>Người tạo</th>
                                            <th>Ngày sửa</th>
                                            <th>Người sửa</th>
                                            <th>Chi tiết giao dịch</th>
                                            <th class="center">Thao tác</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                            <%--duyet tat ca cac toa nha duoc tra ra tu controler--%>
                                        <c:forEach var="it" items="${DDX}">
                                            <tr class="">
                                                <td>${it.createdDate}</td>
                                                <td>${it.createdBy}</td>
                                                <td>${it.modifiedDate}</td>
                                                <td>${it.modifiedBy}</td>
                                                <td>${it.note}</td>
                                                <td class="center">
                                                    <div class="hidden-sm hidden-xs btn-group">
                                                        <button class="btn btn-xs btn-info" title="sửa giao dịch" onclick="updateTransaction('DDX', ${customerCreateRequest.id}, ${it.id})">
                                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>

                        </c:forEach>
                    </c:if>

                </div><!-- /.page-content -->

            </div>
        </div>

        <div class="modal fade" role="dialog" id="addOrUpdateTransactionModel">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Nhập giao dịch</h4>
                    </div>
                    <div class="form-group" bis_skin_checked="1" style="padding: 20px">
                        <label class="col-sm-3 control-label no-padding-right"> Chi tiết giao dịch </label>
                        <div class="col-sm-9" bis_skin_checked="1" style="padding: 5px; border: solid #aaa 1px">
                            <input id="note" value="" style="width: 100%; border: none"/>
                        </div>

                    </div>
                    <input type="hidden" id="customerId" value=""/>
                    <input type="hidden" id="code" value=""/>
                    <input type="hidden" id="transactionId" value=""/>
                    <div class="modal-footer">
                        <button type="button" class="my-button-apply" id="btnAddOrUpdateTransaction" >OK</button>
                        <button type="button" class="my-button-cancel" data-dismiss="modal" id="closeModel">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <%--alert custom--%>
        <div id="customAlertBackdrop" class="custom-alert-backdrop"></div>
        <div id="customAlert" class="custom-alert">
            <span id="customAlertMessage" class="custom-alert-message"></span>
            <button id="customAlertButton" class="custom-alert-button">OK</button>
        </div>

        <script>
            function addTransaction(code, customerId){
                $('#note').val('');
                $('#addOrUpdateTransactionModel').modal();
                $('#customerId').val(customerId);
                $('#code').val(code);
            }
            function updateTransaction(code, customerId, transactionId){
                $('#addOrUpdateTransactionModel').modal();
                loadOldNote(transactionId);
                $('#customerId').val(customerId);
                $('#code').val(code);
                $('#transactionId').val(transactionId);
            }
            function loadOldNote(transactionId){
                $.ajax({
                    type: "GET",
                    url: "${transactionAPI}/" + transactionId,
                    dataType: "JSON",
                    success: function(response) {
                        console.log(response);
                        $('#note').val(response['data']);
                    },
                    error: function(response){
                        console.log("Fail!")
                    }
                });
            }


            $('#btnAddOrUpdateTransaction').click(function (e){
                e.preventDefault();
                var data = {};
                data['id'] = $('#transactionId').val();
                data['code'] = $('#code').val();
                data['note'] = $('#note').val().trim();
                data['customerId'] = $('#customerId').val();
                if(data['note'] != ''){
                    doAddOrUpdateTransaction(data);
                }
                else{
                    addPlaceholder();
                }
            });
            function addPlaceholder() {
                var input = $('#note');
                input.attr('placeholder', 'Vui lòng điền chi tiết giao dịch');

            }
            $('#closeModel').click(function (e){
                e.preventDefault();
                var input = $('#note');
                input.attr('placeholder', '');
            })
            function doAddOrUpdateTransaction(data){
                $.ajax({
                    type: "POST",
                    url: "${transactionAPI}",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "JSON",
                    success: function(response) {
                        customAlert(response['message'], function() {
                            window.location.reload();
                        });
                    },
                    error: function(response){
                        customAlert("Giao khách hàng không thành công", function() {
                            window.location.reload();
                        });
                    }
                });
            }

            $(document).ready(function(){
                const urlParams = new URLSearchParams(window.location.search);
                const formDataSent = urlParams.has('formDataSent');
                $('#btnAddOrUpdateCustomer').click(function(){
                    var data = {};
                    var formData = $('#form-edit').serializeArray();
                    $.each(formData, function(i, v){
                        data["" + v.name + ""] = v.value.trim();
                    })
                    if(data['fullname'] != ''
                        && data['phone'] != ''
                        && data['email'] != ''){
                        addOrUpdateCustomer(data);
                    }
                    else{
                        localStorage.setItem('formData', JSON.stringify(data));
                        var formData = localStorage.getItem('formData');
                        customAlert("Vui lòng điền đầy đủ thông tin", function() {
                            window.location.href = "<c:url value='/admin/customer-edit'/>?formDataSent=true";
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
                                if(key === "fullname"){
                                    var inputField = $('#fullname'); // Chọn trường input
                                    var errorSpan = $('<span class="input-error">Tên khách hàng không được để trống</span>'); // Tạo phần tử span chứa thông báo lỗi
                                    inputField.after(errorSpan);
                                }
                                else if(key === "phone"){
                                    var inputField = $('#phone');
                                    var errorSpan = $('<span class="input-error">Số điện thoại khách hàng không được để trống</span>');
                                    inputField.after(errorSpan);
                                }
                                else if(key === "email"){
                                    var inputField = $('#email');
                                    var errorSpan = $('<span class="input-error">Email khách hàng không được để trống</span>');
                                    inputField.after(errorSpan);
                                }
                            }
                        });
                    }
                }
            });
            function addOrUpdateCustomer(data){
                //call api
                $.ajax({
                    type: "POST",
                    url: "${customerAPI}",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "JSON",
                    success: function (respond) {
                        customAlert(respond['message'], function() {
                            window.location.href = "<c:url value='/admin/customer-list'/>";
                        });
                    },
                    error: function (respond){
                        window.location.href = "<c:url value='/admin/customer-list'/>";
                    }
                })
            }
            $('#cancelBtn').click(function (){
                window.location.href = "/admin/customer-list";
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
        </script>
    </body>
</html>

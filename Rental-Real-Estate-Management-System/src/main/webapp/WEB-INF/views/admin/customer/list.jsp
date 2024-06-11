<%@ taglib prefix="select" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"></c:url>
<c:url var="customerListURL" value="/admin/customer-list"></c:url>
<html>
    <head>
        <title>Danh sách khách hàng</title>
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
                            <a href="<c:url value="/admin/home"/>" style="text-decoration: none">
                                Trang chủ
                            </a>
                        </li>
                        <li class="active">
                            Danh sách khách hàng
                        </li>
                    </ul><!-- /.breadcrumb -->
                </div>
                <div class="page-content">
                    <div class="col-xs-12">
                        <div class="widget-box ui-sortable-handle" bis_skin_checked="1">
                            <div class="widget-header" bis_skin_checked="1">
                                <h5 class="widget-title">Tìm kiếm</h5>

                                <div class="widget-toolbar" bis_skin_checked="1">

                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body" bis_skin_checked="1" style="display: block;">
                                <div class="widget-main" bis_skin_checked="1">
                                    <%--the form cua spring framework--%>
                                    <form:form id="customerList" modelAttribute="modelSearch" action="${customerListURL}" method="GET">
                                        <div class="building-search-text">
                                            <div class="input-container no-select">
                                                <label>Tên khách hàng </label><br>
                                                <form:input path="fullname"/>
                                            </div>

                                            <div class="input-container no-select">
                                                <label>Di động</label><br>
                                                <form:input type="text" path="phone"/>
                                            </div>

                                            <div class="input-container no-select">
                                                <label>Email</label><br>
                                                <form:input type="text" path="email"/>
                                            </div>
                                        </div>
                                        <security:authorize access="hasRole('MANAGER')">
                                            <div class="building-search-select no-select">
                                                <div class="select-container">
                                                    <form:select path="staffId" >
                                                        <form:option value="">---Chọn nhân viên---</form:option>
                                                        <form:options items="${staffs}"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </security:authorize>
                                        <button class="submit-btn no-select" type="button" id="btnSearchCustomer"style="background-color: #5cbf74; margin-top:3rem; border: none" >
                                            <i class="fa-solid fa-magnifying-glass" style="color: #fff;"></i>
                                            Tìm Kiếm
                                        </button>
                                    </form:form>
                                </div>
                            </div>

                            <security:authorize access="hasRole('MANAGER')">
                                <div class="pull-left no-select" style="margin-top: 3rem;">
                                    <button class="btn btn-danger" style=" border-radius: 2px;" title="xóa khách hàng" id="deleteCustomersBtn" disabled>
                                        <i class="fa-solid fa-person-circle-minus" style="font-size: 20px"></i>
                                    </button>

                                    <a href="/admin/customer-edit">
                                        <button class="btn btn-info" style=" border-radius: 2px;" title="thêm khách hàng">
                                            <i class="fa-solid fa-person-circle-plus" style="font-size: 20px"></i>
                                        </button>
                                    </a>
                                </div>
                            </security:authorize>

                        </div>
                    </div>

                    <div class="col-xs-12" bis_skin_checked="1" style="margin-top: 1rem">
                        <div class="table-responsive">
                            <display:table name="customerList" requestURI="${customerListURL}" id="tableList" pagesize="${model.maxPageItems}"
                                           class="table table-striped table-bordered table-hover"
                                           style="text-align: center;">
                                <security:authorize access="hasRole('MANAGER')">
                                    <display:column title="<fieldset class='form-group' style='display: block; margin: 0' >
                                                           <input type='checkbox' id='checkAll' class='check-box-element'>
                                                       </fieldset>"
                                                    class="center select-cell"
                                                    headerClass="center select-cell no-select">
                                        <fieldset class="no-select">
                                            <input type="checkbox" name="checkList" value="${tableList.id}"
                                                   id="checkbox_${tableList.id}" class="check-box-element"/>
                                        </fieldset>
                                    </display:column>
                                </security:authorize>


                                <display:column property="fullname" title="Tên khách hàng" headerClass="center"/>
                                <display:column property="phone" title="Di động" headerClass="center"/>
                                <display:column property="email" title="Email" headerClass="center"/>
                                <display:column property="demand" title="Nhu cầu" headerClass="center"/>
                                <display:column property="createdBy" title="Người thêm" headerClass="center"/>
                                <display:column property="createdDate" title="Ngày thêm" headerClass="center"/>
                                <display:column property="status" title="Tình trạng" headerClass="center"/>
                                <display:column title="Thao tác" headerClass="center">
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <security:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-success" title="Giao khách hàng" onclick="assignmentCustomer(${tableList.id})" name="customerId">
                                                <i class="ace-icon glyphicon glyphicon-list"></i>
                                            </button>
                                        </security:authorize>

                                        <a class="btn btn-xs btn-info" title="Sửa thông tin khách hàng" href="/admin/customer-edit-${tableList.id}">
                                            <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                        </a>
                                        <security:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteCustomer(${tableList.id})">
                                                <i class="ace-icon glyphicon glyphicon-trash"></i>
                                            </button>
                                        </security:authorize>
                                    </div>

                                    <div class="hidden-md hidden-lg">
                                        <div class="inline pos-rel">
                                            <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                                                <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                            </button>

                                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                <li>
                                                    <a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
                                            <span class="blue">
                                                <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                            </span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
                                            <span class="green">
                                                <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                            </span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
                                            <span class="red">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </display:column>
                            </display:table>
                        </div>
                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>

        <%--model show staffList--%>
        <div class="modal fade" role="dialog" id="assignmentCustomerModal">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Danh Sách Nhân Viên</h4>
                    </div>

                    <div class="modal-body">
                        <table class="table table-striped table-bordered table-hover" id="staffList">
                            <thead>
                            <tr>
                                <th style="text-align: center;">Chọn</th>
                                <th>Tên nhân viên</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <input type="hidden" id="customerId" value="">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="my-button-apply" id="btnAssignmenCustomer" >Giao Khách Hàng</button>
                        <button type="button" class="my-button-cancel" data-dismiss="modal" >Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" role="dialog" id="deleteConfirmModal">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="padding: 15px">
                    <h1>Bạn có chắc chắn muốn xóa khách hàng</h1>
                    <div class="modal-footer">
                        <button type="button" class="my-button-apply" id="deleteBtn">Xóa</button>
                        <button type="button" class="my-button-cancel" data-dismiss="modal">Hủy</button>
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
            function assignmentCustomer(customerId){
                $('#assignmentCustomerModal').modal();
                loadStaff(customerId);
                $('#customerId').val(customerId);
            }
            function loadStaff(customerId){
                $.ajax({
                    type: "GET",
                    url: "${customerAPI}/" + customerId + '/staffs',
                    dataType: "JSON",
                    success: function(response) {
                        var row = '';
                        $.each(response.data, function (index, item){
                            row += '<tr>';
                            row += '<td class="text-center"><input type="checkbox" value=' + item.staffId + ' id="checkbox_' + item.staffId + '" class = "check-box-element"' + item.checked + '/></td>';
                            row += '<td class="text-center">' + item.fullName + '</td>';
                            row += '</tr>';
                        });
                        $('#staffList tbody').html(row);
                    },
                    error: function(response){
                        window.location.href = "<c:url value="/admin/customer-list?message=error" />"
                    }
                });
            }
            $('#btnAssignmenCustomer').click(function (e){
                e.preventDefault();
                var data = {};
                data["id"] = $('#customerId').val();
                var staffs = $("#staffList").find('tbody input[type = checkbox]:checked').map(function(){
                    return $(this).val();
                }).get();
                data['staffs'] = staffs;
                if(data != ''){
                    updateAssignmentCustomer(data);
                }
            })
            function updateAssignmentCustomer(data){
                $.ajax({
                    type: "POST",
                    url: "${customerAPI}/" + 'assignment',
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "JSON",
                    success: function(response) {
                        customAlert("Giao khách hàng thành công", function() {
                            window.location.href = "<c:url value='/admin/customer-list'/>";
                        });
                    },
                    error: function(response){
                        customAlert("Giao khách hàng không thành công", function() {
                            window.location.href = "<c:url value='/admin/customer-list'/>";
                        });
                    }
                });
            }


            $('#btnSearchCustomer').click(function (e){
                e.preventDefault();
                $('#customerList').submit();
            })

            $('#tableList').on('change', 'input[type="checkbox"]', function() {
                var anyChecked = $('#tableList tbody tr td fieldset input[type="checkbox"]:checked').length > 0;
                $('#deleteCustomersBtn').prop('disabled', !anyChecked);
            });
            function deleteCustomer(id){
                var customerId = [id];
                $('#deleteConfirmModal').modal('show');
                $('#deleteBtn').click(function() {
                    deleteCustomers(customerId);
                });
            }
            $('#deleteCustomersBtn').click(function (e){
                e.preventDefault();
                var customerIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function (){
                    return $(this).val();
                }).get();
                $('#deleteConfirmModal').modal('show');
                $('#deleteBtn').click(function() {
                    deleteCustomers(customerIds);
                });
            })
            function deleteCustomers(data){
                $.ajax({
                    type: "POST",
                    url: "${customerAPI}/" + data,
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "JSON",
                    success: function (respond) {
                        window.location.href = "<c:url value='/admin/customer-list'/>";
                    },
                    error: function (respond){
                        customAlert("Xóa khách hàng thất bại", function() {
                            window.location.href = "<c:url value='/admin/customer-list'/>";
                        });
                    }
                });
            }
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
s
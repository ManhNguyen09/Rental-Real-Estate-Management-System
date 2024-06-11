<%@ taglib prefix="select" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"></c:url>
<c:url var="buildingAPI" value="/api/building"></c:url>
<html>
<head>
    <title>Danh sách tòa nhà</title>
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
                        Danh sách tòa nhà
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
                                <form:form id="listForm" modelAttribute="modelSearch"  action="${buildingListURL}" method="GET">
                                    <div class="building-search-text">
                                        <div class="input-container">
                                            <label>Tên tòa nhà</label><br>
                                            <%--the input cua html
                                            <input type="text"  name="name" value="${modelSearch.name}"><br>
                                             --%>
                                            <%--the input cua spring boot--%>
                                            <form:input path="name"/>
                                        </div>

                                        <div class="input-container">
                                            <label>Phường</label><br>
<%--                                            <input type="text"  name="ward" value="${modelSearch.ward}"><br>--%>
                                            <form:input type="text" path="ward"/>

                                        </div>

                                        <div class="input-container">
                                            <label>Đường</label><br>
<%--                                            <input type="text"  name="street" value="${modelSearch.street}"><br>--%>
                                            <form:input type="text" path="street"/>
                                        </div>

                                        <div class="input-container">
                                            <label>Tên quản lý</label><br>
<%--                                            <input type="text"  name="managerName" value="${modelSearch.managerName}"><br>--%>
                                            <form:input type="text" path="managerName"/>
                                        </div>

                                        <div class="input-container">
                                            <label>Số điện thoại quản lý</label><br>
<%--                                            <input type="text"  name="managerPhone" value="${modelSearch.managerPhone}"><br>--%>
                                            <form:input type="text" path="managerPhone"/>
                                        </div>
                                    </div>

                                    <div class="building-search-number">
                                        <div class="input-container">
                                            <label>Hạng</label><br>
<%--                                            <input type="number"  name="lever" value="${modelSearch.level}"><br>--%>
                                            <form:input type="number" path="level"/>
                                        </div>
                                        <div class="input-container">
                                            <label>Diện tích sàn</label><br>
<%--                                            <input type="number"  name="numberOfBasement" value="${modelSearch.numberOfBasement}"><br>--%>
                                            <form:input type="number" path="floorArea"/>
                                        </div>
                                        <div class="input-container">
                                            <label>Diện tích từ</label><br>
<%--                                            <input type="number"  name="areaFrom" value="${modelSearch.rentPriceFrom}"><br>--%>
                                            <form:input type="number" path="areaFrom"/>
                                        </div>
                                        <div class="input-container">
                                            <label>Diện tích đến</label><br>
<%--                                            <input type="number"  name="areaTo" value="${modelSearch.rentPriceTo}"><br>--%>
                                            <form:input type="number" path="areaTo"/>
                                        </div>
                                        <div class="input-container">
                                            <label>Giá thuê từ</label><br>
<%--                                            <input type="number"  name="rentPriceFrom" value="${modelSearch.rentPriceFrom}"><br>--%>
                                            <form:input type="number" path="rentPriceFrom"/>
                                        </div>
                                        <div class="input-container">
                                            <label>Giá thuê đến</label><br>
<%--                                            <input type="number"  name="rentPriceTo" value="${modelSearch.rentPriceTo}"><br>--%>
                                            <form:input type="number" path="rentPriceTo"/>
                                        </div>
                                    </div>

                                    <div class="building-search-select">
                                        <div class="select-container">
                                            <form:select name="districts" path="district">
                                                <form:option value="">---Chọn Quận---</form:option>
                                                <form:options items="${districts}"></form:options>
                                            </form:select><br>
                                        </div>
                                        <security:authorize access="hasRole('MANAGER')">
                                            <div class="select-container">
                                                <form:select path="staffId">
                                                    <form:option value="">---Chọn nhân viên---</form:option>
                                                    <form:options items="${staffs}"/>
                                                </form:select>
                                            </div>
                                        </security:authorize>
                                    </div>

                                    <div class="building-search-check">
                                        <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                    </div>

                                    <div style="width: fit-content; margin: 0 auto">
                                        <button class="submit-btn no-select" type="button" id="btnSearchBuilding">
                                            <i class="fa-solid fa-magnifying-glass" style="color: #fff;"></i>
                                            Tìm Kiếm
                                        </button>
                                    </div>

                                </form:form>
                            </div>
                        </div>
                        <div class="pull-left" style="margin-top: 2rem; margin-bottom: 1rem;">
                            <security:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-danger" title="xóa tòa nhà" id="deleteBuildingsBtn" disabled>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                                <a href="/admin/building-edit">
                                    <button class="btn btn-info" title="thêm tòa nhà">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>
                            </security:authorize>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12" bis_skin_checked="1">
                    <div class="table-responsive">
                        <display:table name="buildingList" requestURI="${buildingListURL}" id="tableList" pagesize="${model.maxPageItems}"
                                       class="table table-striped table-bordered table-hover"
                                       style="text-align: center;">
                            <display:column title="<fieldset class='form-group' style='display: block; margin: 0'>
                                                        <input type='checkbox' id='checkAll' class='check-box-element'>
												   </fieldset>" class="center select-cell"
                                            headerClass="center select-cell no-select">
                                <fieldset class="no-select">
                                    <input type="checkbox" name="checkList" value="${tableList.id}"
                                           id="checkbox_${tableList.id}" class="check-box-element"/>
                                </fieldset>
                            </display:column>

                            <display:column property="name" title="Tên tòa nhà"  headerClass="center"/>
                            <display:column property="address" title="Địa chỉ" headerClass="center"/>
                            <display:column property="numberOfBasement" title="Số tầng hầm" headerClass="center"/>
                            <display:column property="managerName" title="Tên quản lý" headerClass="center"/>
                            <display:column property="managerPhone" title="Số điện thoại" headerClass="center"/>
                            <display:column property="floorArea" title="Diện tích sàn" headerClass="center"/>
                            <display:column property="emptyArea" title="Diện tích trống" headerClass="center"/>
                            <display:column property="rentArea" title="Diện tích thuê" headerClass="center"/>
                            <display:column property="rentPrice" title="Giá thuê" headerClass="center"/>
                            <display:column property="brokerageFee" title="Phí môi giới" headerClass="center"/>
                            <display:column title="Thao tác" headerClass="center">
                                <div class="hidden-sm hidden-xs btn-group">
                                    <security:authorize access="hasRole('MANAGER')">
                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${tableList.id})" name="buildingid">
                                            <i class="ace-icon glyphicon glyphicon-list"></i>
                                        </button>
                                    </security:authorize>
                                    <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${tableList.id}">
                                        <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                    </a>
                                    <security:authorize access="hasRole('MANAGER')">
                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${tableList.id})">
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
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <%--model show staffList--%>
    <div class="modal fade" role="dialog" id="assignmentBuildingModal">
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
                    <input type="hidden" id="buildingId" value="">
                </div>

                <div class="modal-footer">
                    <button type="button" class="my-button-apply" id="btnAssignmentBuilding" >Giao Tòa Nhà</button>
                    <button type="button" class="my-button-cancel" data-dismiss="modal" >Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" role="dialog" id="deleteConfirmModal">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="padding: 15px">
                <h1>Bạn có chắc chắn muốn xóa tòa nhà</h1>
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
        function assignmentBuilding(buildingId){
            $('#assignmentBuildingModal').modal();
            loadStaff(buildingId);
            $('#buildingId').val(buildingId);
        }
        function loadStaff(buildingId){
            $.ajax({
                type: "GET",
                url: "${buildingAPI}/" + buildingId + '/staffs',
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
                    console.log("Fail!")
                    window.location.href = "<c:url value="/admin/building-list?message=error" />"
                }
            });
        }
        $('#btnAssignmentBuilding').click(function(e){
            e.preventDefault();
            var data = {};
            data["id"] = $('#buildingId').val();
            var staffs = $("#staffList").find('tbody input[type = checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            data['staffs'] = staffs;
            if(data != ''){
                UpdateAssignmentBuilding(data);
            }
        })
        function UpdateAssignmentBuilding(data){
            $.ajax({
                type: "POST",
                url: "${buildingAPI}/" + 'assignment',
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function(response) {
                    customAlert("Giao tòa nhà thành công", function() {
                        window.location.href = "<c:url value='/admin/building-list'/>";
                    });
                },
                error: function(response){
                    customAlert("Giao tòa nhà không thành công", function() {
                        window.location.href = "<c:url value='/admin/building-list'/>";
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


        $('#btnSearchBuilding').click(function(e){
            e.preventDefault();
            $('#listForm').submit();
        })

        $('#tableList').on('change', 'input[type="checkbox"]', function() {
            var anyChecked = $('#tableList tbody tr td fieldset input[type="checkbox"]:checked').length > 0;
            $('#deleteBuildingsBtn').prop('disabled', !anyChecked);
        });
        function deleteBuilding(data){
            var buildingId = [data];
            $('#deleteConfirmModal').modal('show'); // Hiển thị modal
            // Gán sự kiện cho nút xác nhận trong modal
            $('#deleteBtn').click(function() {
                // Gọi hàm deleteBuildings khi người dùng nhấn nút xác nhận
                deleteBuildings(buildingId);
            });
        }
        $('#deleteBuildingsBtn').click(function (e){
            e.preventDefault();
            var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function (){
                return $(this).val();
            }).get();
            $('#deleteConfirmModal').modal('show');
            $('#deleteBtn').click(function() {
                deleteBuildings(buildingIds);
            });
        })
        function deleteBuildings(data){
            $.ajax({
                type: "DELETE",
                url: "${buildingAPI}/" + data,
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function (respond) {
                    window.location.href = "<c:url value='/admin/building-list'/>";
                },
                error: function (respond){
                    customAlert("Xóa nhà không thành công", function() {
                        window.location.href = "<c:url value='/admin/building-list'/>";
                    });
                }
            });
        }
    </script>
</body>
</html>

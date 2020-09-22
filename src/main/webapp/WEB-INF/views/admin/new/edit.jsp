<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="NewAPIURL" value="/api/new" />
<c:url var="EditNewURL" value="/admin/new/chinh-sua" />
<c:url var="ListNewURL" value = "/admin/new/danh-sach?page=1&limit=2" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chỉnh Sửa Bài Viết</title>
</head>

<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>

					<li><a href="#">Forms</a></li>
					<li class="active">Form Elements</li>
				</ul>
				<!-- /.breadcrumb -->

				<div class="nav-search" id="nav-search">
					<form class="form-search">
						<span class="input-icon"> <input type="text"
							placeholder="Search ..." class="nav-search-input"
							id="nav-search-input" autocomplete="off" /> <i
							class="ace-icon fa fa-search nav-search-icon"></i>
						</span>
					</form>
				</div>
				<!-- /.nav-search -->
			</div>

			<div class="page-content">
				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
						id="ace-settings-btn">
						<i class="ace-icon fa fa-cog bigger-130"></i>
					</div>

					<div class="ace-settings-box clearfix" id="ace-settings-box">
						<div class="pull-left width-50">
							<div class="ace-settings-item">
								<div class="pull-left">
									<select id="skin-colorpicker" class="hide">
										<option data-skin="no-skin" value="#438EB9">#438EB9</option>
										<option data-skin="skin-1" value="#222A2D">#222A2D</option>
										<option data-skin="skin-2" value="#C6487E">#C6487E</option>
										<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
									</select>
								</div>
								<span>&nbsp; Choose Skin</span>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
									id="ace-settings-navbar" autocomplete="off" /> <label
									class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
									id="ace-settings-sidebar" autocomplete="off" /> <label
									class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
									id="ace-settings-breadcrumbs" autocomplete="off" /> <label
									class="lbl" for="ace-settings-breadcrumbs"> Fixed
									Breadcrumbs</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2"
									id="ace-settings-rtl" autocomplete="off" /> <label class="lbl"
									for="ace-settings-rtl"> Right To Left (rtl)</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
									id="ace-settings-add-container" autocomplete="off" /> <label
									class="lbl" for="ace-settings-add-container"> Inside <b>.container</b>
								</label>
							</div>
						</div>
						<!-- /.pull-left -->

						<div class="pull-left width-50">
							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2"
									id="ace-settings-hover" autocomplete="off" /> <label
									class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2"
									id="ace-settings-compact" autocomplete="off" /> <label
									class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2"
									id="ace-settings-highlight" autocomplete="off" /> <label
									class="lbl" for="ace-settings-highlight"> Alt. Active
									Item</label>
							</div>
						</div>
						<!-- /.pull-left -->
					</div>
					<!-- /.ace-settings-box -->
				</div>
				<!-- /.ace-settings-container -->

				<div class="page-header">
					<h1>
						Form Elements <small> <i
							class="ace-icon fa fa-angle-double-right"></i> Common form
							elements and layouts
						</small>
					</h1>
				</div>
				<!-- /.page-header -->

				<div class="row">
					<div class="col-xs-12">
						<%-- 						<form:form class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> Tên Bài Viết </label>

								<div class="col-sm-9">
									<input type="text" id="form-field-1" placeholder="Tên Bài Viết"
										class="col-xs-10 col-sm-5" />
								</div>
							</div>
						</form:form> --%>
						
						<c:if test="${not empty message }">
							<div class="alert alert-${alert } alert-dismissible">
							  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							  <strong>${alert}!</strong> ${message}.
							</div>
						</c:if>

						<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
							
							<form:hidden path="id" id="id"/>
							
							<div class="form-group">
								<label for="categoryCode"
									class="col-sm-3 control-label no-padding-right">Thể
									loại bài viết:</label>
								<div class="col-sm-3">
									<%-- <select class="form-control" id="categoryCode"
										name="categoryCode">
										<option value="">-- Chọn Thể Loại --</option>
										<c:forEach var="item" items="${categories}">
											<option value="${item.code}">${item.name}</option>
										</c:forEach>
									</select> --%>
									<form:select path="categoryCode" id="categoryCode">
										<form:option value="" label="-- Chọn Thể Loại --" />
										<form:options items="${categories}"/>
									</form:select>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> Tên Bài Viết </label>

								<div class="col-sm-9">
									<%-- <input type="text" id="title" name="title"
										placeholder="Tên Bài Viết" class="col-xs-10 col-sm-5" value="${model.title}" /> --%>
									<form:input path="title" cssClass="col-xs-10 col-sm-5" id="title"/>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1"> Ảnh Đại Diện </label>

								<div class="col-sm-9">
									<input type="file" id="thumbnail" name="thumbnail"
										placeholder="Link Ảnh Đại Diện" class="col-xs-10 col-sm-5" value="${model.thumbnail}" />
								
								</div>
							</div>

							<div class="form-group">
								<label for="shortDescription"
									class="col-sm-3 control-label no-padding-right">Mô Tả
									Ngắn:</label>
								<div class="col-sm-9">
									<%-- <textarea class="form-control" rows="5" cols="10"
										id="shortDescription" name="shortDescription">${model.shortDescription}</textarea> --%>
									<form:textarea path="shortDescription" cssClass="form-control" rows="5" cols="10" id="shortDescription"/>
								</div>
							</div>

							<div class="form-group">
								<label for="content"
									class="col-sm-3 control-label no-padding-right">Nội
									Dung Bài Viết:</label>
								<div class="col-sm-9">
									<%-- <textarea class="form-control" rows="5" cols="20" id="content"
										name="content">${model.content}</textarea> --%>
									<form:textarea path="content" cssClass="form-control" id="content" rows="5" cols="20" cssStyle="height: 640px"/>
								</div>
							</div>
			

							<div class="clearfix form-actions">
								
								<c:set var="btnAddOrUpdate" value="Thêm Bài Viết"></c:set>
								<c:if test="${not empty model.id}">
									<c:set var="btnAddOrUpdate" value="Cập Nhật Bài Viết"></c:set>
								</c:if>
								<div class="col-md-offset-3 col-md-9">
									<button class="btn btn-info" type="button"
										id="btnAddOrUpdateNew">
										<i class="ace-icon fa fa-check bigger-110"></i> ${btnAddOrUpdate}
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
									</button>
								</div>
							</div>

						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
		var editor = '';
		$(document).ready(function (){
			editor = CKEDITOR.replace('content');
		});
		
		$('#btnAddOrUpdateNew').click(function(e) {
			e.preventDefault();
			var formData = {};
			formData = $('#formSubmit').serializeArray();
			console.log(formData);
			var data = {};
			var check = true;
			$.each(formData, function(i, v) {
				if("id" == v.name){
					data["" + v.name + ""] = v.value;
				}else if ("content" == v.name){
					data['content'] = editor.getData();
					//return true; //tương đương lệnh continue
				}else{
					if(v.value){
						data["" + v.name + ""] = v.value;			
					}else{
						alert("Vui long nhập đủ thông tin!\nĐang thiếu trường "+v.name);
						check = false;
						return false; //tương đương lệnh break
					}
				}
			});
			if(check){
				console.log(JSON.stringify(data))
				if("" == data["id"]){
					alert("Bạn muốn thêm New mới");
					addNew(data)
				}else{
					alert("Bạn muốn cập nhật bài viết");
					updateNew(data);	
				}	
			}
		});
		
		function addNew(data){
			$.ajax({
				url : "${NewAPIURL}",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json",
				success : function(s){
					console.log(s);
					alert("Thêm Thành Công :Đ");
					window.location.href = '${EditNewURL}' + '?id=' + s.id + '&message=insert_success';
				},
				error : function(e){
					console.log(e);
					alert("Thêm Thất Bại!");
					window.location.href = '${ListNewURL}' + '&message=system_error';
				}
			});
		}
		
		function updateNew(data){
			$.ajax({
				url : '${NewAPIURL}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(s){
					console.log(s);
					alert("Cập Nhật Thành Công :Đ");
					window.location.href = '${EditNewURL}' + '?id=' + s.id + '&message=update_success';
				},
				error : function(e){
					console.log(e);
					alert("Cập Nhật Thất Bại!");
					window.location.href = '${EditNewURL}' + '?id=' + data["id"] + '&message=system_error';
				}
			});	
		}
	</script>
</body>
</html>
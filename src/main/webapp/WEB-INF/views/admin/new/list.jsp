<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:url var="NewAPIURL" value="/api/new" />
<c:url var="ListNewURL" value = "/admin/new/danh-sach?page=1&limit=2" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách bài viết</title>
	</head>

	<body>
		<div class="main-content">
		<form action="<c:url value="/admin/new/danh-sach"/>" id="formSubmit" method="get">
			
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Trang chủ</a>
							</li>
						</ul>
						<!-- /.breadcrumb -->
					</div>
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<c:url var="createNewURL" value="/admin/new/chinh-sua" />
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm bài viết' href='${createNewURL}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa bài viết'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
									
									<c:if test="${not empty message }">
										<div class="alert alert-${alert } alert-dismissible">
										  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
										  <strong>${alert}!</strong> ${message}.
										</div>
									</c:if>
												
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th> <input type="checkbox" id="checkAll" /> </th>
														<th>Tên bài viết</th>
														<th>Mô tả ngắn</th>
														<th>Thao tác</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td> <input type="checkbox" id="checkBox_${item.id}" value="${item.id}" /> </td>
															<td>${item.title}</td>
															<td>${item.shortDescription}</td>
															<td>		
																<c:url var="updateNewURL" value="/admin/new/chinh-sua">
																	<c:param name="id" value="${item.id}" />
																</c:url>													
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='${updateNewURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<input type="hidden" value="" name="page" id="page">
											<input type="hidden" value="" name="limit" id="limit">
											<ul class="pagination" id="pagination"></ul>								
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form>
		</div>
		<!-- /.main-content -->
<!-- 		<script>
		$(function () {
			var totalPage = ${model.totalPage}
			var currentPage = ${model.page};
	        window.pagObj = $('#pagination').twbsPagination({
	            totalPages: totalPage,
	            visiblePages: 10,
	            startPage : currentPage,
	            onPageClick: function (event, page) {
	             	$('#limit').val(2);
	             	$('#page').val(page);
	                $('#formSubmit').submit();
	            }
	        });
	    });
		</script> -->
		
		<script>
			var totalPages = ${model.totalPage};
			var currentPage = ${model.page};
			$(function () {
		        window.pagObj = $('#pagination').twbsPagination({
		            totalPages: totalPages,
		            visiblePages: 10,
		            startPage: currentPage,
		            onPageClick: function (event, page) {
		            	if (currentPage != page) {
		            		$('#limit').val(2);
							$('#page').val(page);
							$('#formSubmit').submit();
						}
		            }
		        });
		    });
		
			function warningBeforeDelete(){
				swal({
					  title: "Are you sure?",
					  text: "You will not be able to recover this imaginary file!",
					  type: "warning",
					  showCancelButton: true,
					  confirmButtonClass: "btn-danger",
					  //cancelButtonClass: "btn-success",
					  confirmButtonText: "Yes, delete it!",
					  cancelButtonText: "No, cancel plx!",
					  /* closeOnConfirm: false,
					  closeOnCancel: false */
					}).then
					(function(isConfirm) {
					  if (isConfirm) {
						var data = {};
						var ids = $('tbody input[type=checkbox]:checked').map(function(){
							return $(this).val();
						}).get();
						//data["ids"] = ids;
						if(ids === undefined || ids.length == 0){
							swal("Good job!", "Vui lòng chọn bài viết cần xóa", "error")
						}else{
							deleteNew(ids);	
						}
						//swal("Deleted!", "Your imaginary file has been deleted.", "success");
					  } else {
					    swal("Cancelled", "Your imaginary file is safe :)", "error");
					  }
					});
			}
			
			function deleteNew(ids){
				$.ajax({
					url : '${NewAPIURL}',
					type : 'DELETE',
					contentType : 'application/json',
					data : JSON.stringify(ids),
					success : function(s){
						swal("Deleted!", "Your imaginary file has been deleted.", "success");
						window.location.href = '${ListNewURL}' + '&message=delete_success';
					},
					error : function(e){
						swal("Cancelled", "Your imaginary file is safe :)", "error");
						window.location.href = '${ListNewURL}' + '&message=system_error';
					}
				});
			}
		</script>
	</body>
	</html>
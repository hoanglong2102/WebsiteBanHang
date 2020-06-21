<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Update Order</title>

</head>


<body>

	<div class="card" style="width: 40rem;">
		<h2 class="card-title">
			<c:if test="${mode == 'ADD'}">
			Thêm Hóa đơn
		</c:if>
			<c:if test="${mode == 'EDIT'}">
			Cập nhật trạng thái đơn hàng
		</c:if>

		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/order/save" />
			<form:form enctype="multipart/form-data" method="POST"
				action="${saveUrl}" modelAttribute="order">
				<form:input type="hidden" path="id" id="id" />
				<form:input type="hidden" path="customer" id="customeId" />
				<form:input path="amount" type="hidden" id="amount" />
				<form:input path="orderDate" type="hidden" id="orderDate" />
				<form:input path="totalQuanity" type="hidden" id="totalQuanity" />
				<form:input path="hour" type="hidden" id="Hour" />
				<form:input path="minute" type="hidden" id="totalQuanity" />
				<div class="form-group">
					<div>
						<label>Trạng thái: </label>
					</div>
					<form:select path="status">
						<c:if test="${order.status==0}">
							<option selected value="0">Đang chờ xử lý</option>
							<option value="1">Đang xử lý</option>
							<option value="2">Đã xử lý</option>
							<option value="3">Đã hủy đơn</option>
						</c:if>

						<c:if test="${order.status==1}">
							<option value="0">Đang chờ xử lý</option>
							<option selected value="1">Đang xử lý</option>
							<option value="2">Đã xử lý</option>
							<option value="3">Đã hủy đơn</option>
						</c:if>
						<c:if test="${order.status==2}">
							<option value="0">Đang chờ xử lý</option>
							<option value="1">Đang xử lý</option>
							<option selected value="2">Đã xử lý</option>
							<option value="3">Đã hủy đơn</option>
						</c:if>
						<c:if test="${order.status==3}">
							<option value="0">Đang chờ xử lý</option>
							<option value="1">Đang xử lý</option>
							<option value="2">Đã xử lý</option>
							<option selected value="3">Đã hủy đơn</option>
						</c:if>
					</form:select>
				</div>



				<%-- <div class="form-group">
				<label for="orderDate">Ngày: </label>
				<form:input path="orderDate" type="text" class="form-control" id="orderDate"/>
			</div> --%>
				<%-- <div class="form-group">
				<label for="created">Created: </label>
				<form:input path="created" type="text" class="form-control" id="created"/>
			</div>
			<div class="form-group">
				<label for="image">Image: </label>
				<img src="<c:url value="/uploads/${product.image}" />" height="200" width="200"/>
				<form:input  path="image" class="form-control"  id="image" name="image" type="file"/>
			</div> --%>
				<div class="btn-group">
					<button type="submit" class="btn btn-primary" value="Save">
						Lưu</button>
					<button type="reset" class="btn btn-light" value="Reset">
						<a href="/admin/order/"><i class="fas fa-undo"></i> Quay lại</a>
					</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cập nhật người dùng</title>
  <script type="text/javascript">
    function blockSpecialChar(e){
        var k;
        document.all ? k = e.keyCode : k = e.which;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 20 || (k >= 48 && k <= 57));
        }
    </script>
</head>


<body>
	<c:if test="${not empty errorMessage }">
		<div class="alert alert-danger" role="alert">${errorMessage }</div>
	</c:if>
	<div class="card" style="width: 40rem;">
		<h2 class="card-title">
			<c:if test="${mode == 'ADD'}">
			Thêm người dùng
		</c:if>
			<c:if test="${mode == 'EDIT'}">
			Cập nhật người dùng
		</c:if>

		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/user/save" />
			<form:form enctype="multipart/form-data" method="POST"
				action="${saveUrl}" modelAttribute="user">
				<form:input type="hidden" path="id" id="id" />
				<c:if test="${mode == 'EDIT'}">
					<form:input type="hidden" path="userName" id="userName" />
				</c:if>
				<c:if test="${mode == 'EDIT'}">
					<form:input type="hidden" path="userType" id="userType" />
				</c:if>

				<form:input type="hidden" path="password" id="password" />
				<form:input type="hidden" path="isActive" id="isActive" />
				<c:if test="${mode == 'ADD'}">
					<div class="form-group">
						<label for="userName">Tên đăng nhập</label>
						<form:input path="userName" type="text" class="form-control"
							id="userName" onkeypress="return blockSpecialChar(event)"/>
					</div>
				</c:if>
				<div class="form-group">
					<label for="firstName">Họ</label>
					<form:input path="firstName" type="text" class="form-control"
						id="firstName"/>
				</div>
				<div class="form-group">
					<label for="lastName">Tên</label>
					<form:input path="lastName" type="text" class="form-control"
						id="lastName"/>
				</div>
				<div class="form-group">
					<label for="email">Email: </label>
					<form:input path="email" type="email" class="form-control"
						 id="email" />
					<form:errors path="email" cssClass="text-danger" />
				</div>
				<div class="form-group">
					<label for="phoneNumber">Số điện thoại: </label>
					<form:input path="phoneNumber" type="text" class="form-control"
						pattern="[0-9]{6,11}"
						title="Sô điện không hợp lệ hoặc sô điện thoại phải có từ 6 đến 11 chữ số"
						 id="phoneNumber" />
				</div>
				<div class="form-group">
					<label for="profileImageFile">Hình ảnh: </label> <img
						src="<c:url value="/uploads/${user.profileImage}" />" height="200"
						width="200" />
					<form:input path="profileImageFile" class="form-control"
						id="profileImageFile" name="profileImageFile" type="file" />
				</div>
				<c:if test="${mode == 'ADD'}">
				<%-- <div class="form-group">
					<label for="permissions" style="margin-right: 20px;">Loại
						phân quyền: </label>
					<form:select multiple="true" path="permissionIdList">
						<c:forEach items="${permissions1}" var="permission">
							<c:set var="iselected" value="false" />
							<c:forEach items="${user.permissions }" var="c">
								<c:if test="${permission.id == c.id }">
									<c:set var="iselected" value="true" />
									<form:option selected="selected" value="${permission.id}">${permission.permissionName}</form:option>
								</c:if>
							</c:forEach>

							<c:if test="${iselected == false }">
								<form:option value="${permission.id}">${permission.permissionName}</form:option>
							</c:if>
						</c:forEach>

					</form:select>
				</div> --%>
				
				<label for="userType">Chọn quyền:</label>
					<form:select path="userType.id" id="userType">
						<c:forEach items="${userTypes}" var="userType">
									<form:option value="${userType.id}">${userType.name}</form:option>
						</c:forEach>
					</form:select>
				
				
				</c:if>
			
		</div>
		<center>
				<div class="btn-group">
					<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Lưu</button>
					<button type="reset" class="btn btn-light" value="Reset">
						<a href="/admin/user/"><i class="fas fa-undo"></i> Quay lại</a>
					</button>
				</div>
				</center>
				</form:form>
	</div>
</body>
</html>
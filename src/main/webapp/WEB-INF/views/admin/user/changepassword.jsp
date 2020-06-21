<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.inputpassword {
	margin-left: 50px;
}
</style>
</head>
<body>
	<div class="card" style="width: 45rem;">
		<h2 class="card-title">Thay đổi mật khẩu</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/profile/updatepassword/${username}" />
			<form:form method="POST" action="${saveUrl}">
				<div class="form-group">
					<label for="oldpassword" style="margin-left: 58px;">Mật
						khẩu cũ:</label> <input type="password" name="oldpassword"
						class="inputpassword" id="oldpassword" />
				</div>
				<div class="form-group">
					<label for="newpassword">Nhập mật khẩu mới:&nbsp;</label> <input
						type="password" name="newpassword" class="inputpassword"
						id="newpassword" />
				</div>
				<div class="form-group">
					<label for="enterpassword">Xác nhận mật khẩu:&nbsp; </label> <input
						type="password" name="enterpassword" class="inputpassword"
						id="enterpassword">
				</div>
				<c:if test="${kq == false}">
					<div class="alert alert-danger" role="alert">${message}</div>
				</c:if>
				<div class="btn-group">
					<button type="submit" class="btn btn-primary">Thay đổi</button>
					<button type="reset" class="btn btn-light" value="Reset">
						<a href="/admin/user/"><i class="far fa-window-close"></i></i> Hủy</a>
					</button>
				</div>
			</form:form>
		</div>
	</div>

	<!-- here we are importing the jquery file which is downloaded -->
	<script language="javascript" src="/resources/js/jquery-3.1.1.js"></script>
	<script language="javascript" src="/resources/js/jquery.validate.js"></script>

</body>
</html>
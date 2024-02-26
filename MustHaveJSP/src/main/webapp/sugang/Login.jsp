<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Custom fonts for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
	
<style type="text/css">

#backimg{

padding:0;
margin:0;
opacity: 0.9;
width: 100%;
height: 100%;

position: absolute;
left: 0;
top: 0;
z-index: -10;
}

</style>	
	
<title>오삼대학교</title>
</head>
<body class="bg-gradient-primary">

<img src="../img/university.jpg" id="backimg"> 

<jsp:include page="../popup/PopupMain.jsp"/>

	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">로그인 페이지</h1>
									</div>

									<form class="user" action="./login.sg" method="post" name="loginFrm"
										onsubmit="return validateForm(this);">
										<div class="form-group">
											학번<input type="text" name="stu_num" class="form-control form-control-user"
												id="exampleInputEmail" aria-describedby="emailHelp"
												placeholder="학번 입력">
										</div>
										<div class="form-group">
											비밀번호<input type="password" name="pw" class="form-control form-control-user"
												id="exampleInputPassword" placeholder="비밀번호 입력">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">정보 기억하기</label>
											</div>
										</div>
										<input type="submit" value="로그인하기" class="btn btn-primary btn-user btn-block"></input>
										<!-- <hr> -->
<!-- 										<a href="index.html" class="btn btn-google btn-user btn-block">
											<i class="fab fa-google fa-fw"></i> Login with Google
										</a>
										<a href="index.html"
											class="btn btn-facebook btn-user btn-block"> <i
											class="fab fa-facebook-f fa-fw"></i> Login with Facebook
										</a> -->
									</form>
									<!-- <hr> -->
									<div class="text-center">
<!-- 										<a class="small" href="forgot-password.html">Forgot
											Password?</a> -->
									</div>
									<div class="text-center">
										<!-- <a class="small" href="register.html">Create an Account!</a> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>
	<script>
		function validateForm(form) {
			if (!form.stu_num.value) {
				alert("학번을 입력하세요.");
				form.stu_num.focus(); //포커싱
				return false;
			}
			if (form.pw.value == "") {
				alert("패스워드를 입력하세요."); 
				form.pw.focus(); //포커싱
				return false;
			}
		}
	</script>
</body>
</html>
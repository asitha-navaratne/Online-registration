<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.asith.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&display=swap"
	rel="stylesheet">
<link rel="apple-touch-icon" sizes="180x180"
	href="resources/images/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="resources/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicons/favicon-16x16.png">
<link rel="manifest" href="resources/images/favicons/site.webmanifest">
<link rel="mask-icon"
	href="resources/images/favicons/safari-pinned-tab.svg" color="#ffa734">
<link rel="shortcut icon" href="resources/images/favicons/favicon.ico">
<meta name="msapplication-TileColor" content="#ffa734">
<meta name="msapplication-config"
	content="resources/images/favicons/browserconfig.xml">
<meta name="theme-color" content="#ffa734">
<link rel="stylesheet" href="resources/style.css">
<title>Edit Profile</title>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	User user = (User) session.getAttribute("user");

	if (user == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid min-vh-100">
		<div class="row min-vh-100">
			<div class="col-10 m-auto py-4">
				<div class="card">
					<div class="col">
						<div class="ps-3 pt-3">
							<a href="profile.jsp" class="logout-btn">Back</a>
						</div>
						<img src="resources/images/icon-edit.svg"
							alt="User Changing Details"
							class="img-fluid d-block mx-auto mt-3 svg-image">
						<div class="text-center">
							<h2 class="text-capitalize">edit your details</h2>
						</div>
						<p class="text-center pt-3 text-danger">&#8203;${errorMessage}</p>
						<form action="edit" method="post" class="m-3">
							<div class="row">
								<div class="col-md-6 col-12">
									<input type="hidden" name="uname" value="${user.getUname()}"
										required>
									<div class="mb-3">
										<label for="fname" class="form-label">First name</label> <input
											type="text" name="fname" id="fname" class="form-control"
											value="${user.getFname()}" autofocus required>
									</div>
									<div class="mb-3">
										<label for="lname" class="form-label">Last name</label> <input
											type="text" name="lname" id="lname" class="form-control"
											value="${user.getLname()}" required>
									</div>
									<div class="mb-3">
										<label for="field" class="form-label">Field of
											interest</label> <input type="text" name="field" id="field"
											class="form-control" value="${user.getField()}">
									</div>
								</div>
								<div class="col-md-6 col-12">
									<div class="mb-3">
										<label for="email" class="form-label">Email</label> <input
											type="email" name="email" id="email" class="form-control"
											value="${user.getEmail()}" required>
									</div>
									<div class="mb-3">
										<label for="pass" class="form-label">Password</label> <input
											type="password" name="pass" id="pass" class="form-control"
											placeholder="*At least 6 characters"
											value="${user.getPass()}" required>
									</div>
									<div class="mb-3">
										<label for="cpass" class="form-label">Confirm password</label>
										<input type="password" name="cpass" id="cpass"
											class="form-control" placeholder="*At least 6 characters"
											value="${user.getPass()}" required>
									</div>
									<div class="mb-4 form-check">
										<input type="checkbox" class="form-check-input"
											id="show-password"
											onclick="showPassword(); showConfirmPassword()"> <label
											for="show-password">Show Password</label>
									</div>
								</div>
								<div class="mb-3">
									<input type="submit" value="Submit"
										class="btn btn-primary btn-lg d-block mx-auto mt-3">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/script.js"></script>
</body>
</html>
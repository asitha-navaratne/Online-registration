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
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&display=swap"
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
<title>Delete Account</title>
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
	else {
	%>
	<div class="container-fluid vh-100">
		<div class="row h-100">
			<div class="col-10 col-xl-8 m-auto">
				<div class="card border-0 overflow-hidden">
					<div class="row">
						<div class="col d-none d-md-block tile-image-delete"></div>
						<div class="col p-3">
							<div class="ps-3 pt-3">
								<a href="profile.jsp" class="logout-btn">Back</a>
							</div>
							<img src="resources/images/icon-delete.svg" alt="User Deleting Account"
								class="img-fluid d-block mx-auto svg-image">
							<div class="text-center">
								<h2 class="text-capitalize">Delete Account</h2>
								<p class="text-capitalize mt-3 mb-1 px-2">please enter your password
									to confirm account deletion</p>
							</div>
							<p class="text-center my-2 text-danger">&#8203;${errorMessage}</p>
							<form action="delete" method="post" class="mx-4">
								<div class="mb-3">
									<label for="pass" class="form-label">Password</label> <input
										type="password" name="pass" id="pass" class="form-control"
										autofocus required>
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="show-password" onclick="showPassword()" /> <label
										for="show-password">Show Password</label>
								</div>
								<div class="my-4">
									<input type="submit" value="Delete Account"
										class="btn btn-primary btn-lg d-block mx-auto" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<script src="resources/script.js"></script>
</body>
</html>
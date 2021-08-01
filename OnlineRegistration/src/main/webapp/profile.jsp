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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
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
<title>Profile</title>
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
	<div class="container-fluid">
		<div class="row min-vh-100 m-1">
			<div class="col-11 col-xl-9 m-auto">
				<div class="card border-0 text-break overflow-hidden">
					<div class="row">
						<div class="col">
							<div class="ps-3 pt-3">
								<a href="logout" class="logout-btn">Log out</a>
							</div>
							<img src="resources/images/icon-profile.svg" alt="User Avatar"
								class="img-fluid d-block mx-auto svg-image">
							<div class="text-center">
								<h2 class="text-capitalize mt-2 mb-4">welcome,
									${user.getFname()}!</h2>
							</div>
							<div class="ms-4 pe-3">
								<table class="table table-borderless">
									<tr>
										<th>Name</th>
										<td>${user.getFname()}&nbsp;${user.getLname()}</td>
									</tr>
									<tr>
										<th>User name</th>
										<td>${user.getUname()}</td>
									</tr>
									<tr>
										<th>Email</th>
										<td>${user.getEmail()}</td>
									</tr>
									<tr>
										<th>Field of interest</th>
										<td>${user.getField()}</td>
									</tr>
								</table>
							</div>
							<div class="ms-5 mb-3">
								<a href="retrieve" class="d-block p-2"><i
									class="bi bi-people-fill icon"></i><span class="p-2">Find
										Users</span></a> <a href="edit.jsp" class="d-block p-2"><i
									class="bi bi-pencil-fill icon"></i><span class="p-2">Edit
										Details</span></a> <a href="delete.jsp" class="d-block p-2"><i
									class="bi bi-person-x-fill icon"></i><span class="p-2">Delete
										Account</span></a>
							</div>
						</div>
						<div class="col d-none d-md-block tile-image-profile"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
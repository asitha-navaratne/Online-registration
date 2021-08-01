<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Sign Up</title>
</head>
<body>
	<div class="container-fluid min-vh-100">
		<div class="row min-vh-100">
			<div class="col-10 m-auto py-4">
				<div class="card">
					<div class="col">
						<img src="resources/images/icon-register.svg"
							alt="Users getting Registered"
							class="img-fluid d-block mx-auto mt-3 svg-image">
						<div class="text-center">
							<h2 class="text-capitalize">sign up</h2>
						</div>
						<p class="text-center pt-3 text-danger">&#8203;${errorMessage}</p>
						<form action="register" method="post" class="m-3">
							<div class="row">
								<div class="col-md-6 col-12">
									<div class="mb-3">
										<label for="uname" class="form-label">User name*</label> <input
											type="text" name="uname" id="uname" class="form-control"
											autofocus required>
									</div>
									<div class="mb-3">
										<label for="fname" class="form-label">First name</label> <input
											type="text" name="fname" id="fname" class="form-control"
											required>
									</div>
									<div class="mb-3">
										<label for="lname" class="form-label">Last name</label> <input
											type="text" name="lname" id="lname" class="form-control"
											required>
									</div>
									<div class="mb-3">
										<label for="field" class="form-label">Field of
											interest</label> <input type="text" name="field" id="field"
											class="form-control">
									</div>
								</div>
								<div class="col-md-6 col-12">
									<div class="mb-3">
										<label for="email" class="form-label">Email</label> <input
											type="email" name="email" id="email" class="form-control"
											required>
									</div>
									<div class="mb-3">
										<label for="pass" class="form-label">Password</label> <input
											type="password" name="pass" id="pass" class="form-control"
											placeholder="*At least 6 characters" required>
									</div>
									<div class="mb-3">
										<label for="cpass" class="form-label">Confirm password</label>
										<input type="password" name="cpass" id="cpass"
											class="form-control" placeholder="*At least 6 characters"
											required>
									</div>
									<div class="mb-4 form-check">
										<input type="checkbox" class="form-check-input"
											id="show-password"
											onclick="showPassword(); showConfirmPassword()"> <label
											for="show-password">Show Password</label>
									</div>
									<div class="form-text">*User name cannot be changed later
										on!</div>
								</div>
								<div class="mb-3">
									<input type="submit" value="Submit"
										class="btn btn-primary btn-lg d-block mx-auto mt-3">
								</div>
							</div>
						</form>
						<div class="form-text text-center">Already have an account?
						</div>
						<div class="form-text text-center mb-3">
							<a href="login.jsp">Sign in</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/script.js"></script>
</body>
</html>
const showPassword = () => {
	var field = document.getElementById("pass");
	if (field.type === "password") {
		field.type = "text";
	}
	else {
		field.type = "password";
	}
}

const showConfirmPassword = () => {
	var field = document.getElementById("cpass");
	if (field.type === "password") {
		field.type = "text";
	}
	else {
		field.type = "password";
	}
}
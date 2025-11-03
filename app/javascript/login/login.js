import $ from "jquery";

import { login } from "../application"; // import hàm login từ application.js

$(document).ready(function () {
});

$("#submitButton").on("click", async function (e) {
    e.preventDefault();

    const email = $("#email").val();
    const password = $("#password").val();

    try {
        const data = await login(email, password);
        alert("Login thành công!");
    } catch (err) {
        alert(err.error || "Đăng nhập thất bại");
    }
});

function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(String(email).toLowerCase());
}

function validatePassword(password) {
    return password.length >= 6;
}

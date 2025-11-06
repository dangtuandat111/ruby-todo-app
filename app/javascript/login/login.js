import $ from "jquery";
import * as constants from "../common/constant";

import { login, showToast } from "../application";
import {validateMessage} from "../common/constant"; // import hàm login từ application.js

$(document).ready(function () {
});

$("#submitButton").on("click", async function (e) {
    e.preventDefault();

    const email = $("#email").val();
    const password = $("#password").val();

    try {
        if (checkBeforeSubmit(email, password)) {
            alert(1);
            let data = await login(email, password);
            console.log(data);
            location.reload();
            return;
        }
        showToast(constants.toastType.ERROR);
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

function checkBeforeSubmit(email, password) {
    if (!validateEmail(email)) {
        showToast(constants.toastType.ERROR, constants.validateMessage.EMAIL);
        return false;
    }
    if (!validatePassword(password)) {
        showToast(constants.toastType.ERROR, constants.validateMessage.PASSWORD);
        return false;
    }
    return true;
}

import $ from "jquery";
import * as constants from "../common/constant";
import {login, showToast} from "../application";

let checkboxToggle = false;

$(document).ready(function () {
});

$("#submitButton").on("click", async function (e) {
    e.preventDefault();

    const email = $("#email").val();
    const password = $("#password").val();
    try {
        if (checkBeforeSubmit(email, password)) {
            let data = await log    in(email, password, checkboxToggle);
            console.log(data);
            location.reload();
        }
    } catch (err) {
        console.log(err);
        alert(err.error || "Đăng nhập thất bạisss");
    }
});

$('input[id="checkboxLabelOne"]').on("change", function (e) {
    checkboxToggle = $(this).is(":checked");
    console.log("Checkbox toggled:", checkboxToggle);

    $(this).closest('label').find('span').toggleClass('opacity-0', !checkboxToggle);
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

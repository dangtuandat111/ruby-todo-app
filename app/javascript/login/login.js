import $ from "jquery";

$(document).ready(function () {
    $("#login-form").on("submit", async function (e) {
        e.preventDefault();

        const email = $("#email").val();
        const password = $("#password").val();

        try {
            const data = await login(email, password); // dùng login() bạn đã viết
            alert("Login thành công!");
        } catch (err) {
            alert(err.error || "Đăng nhập thất bại");
        }
    });
});
alert(1);
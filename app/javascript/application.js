// Entry point for the build script in your package.json
import $ from "jquery";
import * as constants from "./common/constant";

// Show toast
export function showToast (toastType, message = '') {
    let body = $('body');
    // TODO: Update for many toastType
    switch (toastType) {
        case constants.toastType.ERROR:
            let errorToast = body.find('.toast[role="alert"]').clone();
            body.append(errorToast)
            // Append in body
            errorToast.append(errorToast).fadeIn().delay(3000).fadeOut(500, function () {
                errorToast.remove()
            });

            toast.addClass('error').text(message).fadeIn().delay(3000).fadeOut();
            break;
        case constants.toastType.SUCCESS:
            let successToast = body.find('.toast[role="success"]').clone();

            body.append(successToast)
            successToast.fadeIn().delay(3000).fadeOut(500, function () {
                console.log('remove');
                successToast.remove()
            });

            // successToast.addClass('success').text(message).fadeIn().delay(3000).fadeOut();
            break;
        default:
    }
}

export async function login(email, password) {
    const url = $('.form-action').attr('action-href');
    const res = await fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password })
    });
    if (!res.ok) {
        const err = await res.json().catch(() => ({ error: 'Login failed' }));
        throw err;
    }
    const data = await res.json();
    return data;
}

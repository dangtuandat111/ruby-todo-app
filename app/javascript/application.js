// Entry point for the build script in your package.json
import $ from "jquery";
import * as constants from "./common/constant";

// Show toast
export function showToast (toastType, message = '') {
    console.trace();
    let body = $('body');
    // TODO: Update for many toastType
    switch (toastType) {
        case constants.toastType.ERROR:
            let errorToast = body.find('.toast[role="alert"]').first().clone().removeClass('display-none');
            errorToast.find('.toast-message').text(message);
            body.find('.toast-notification').append(errorToast)
            // Append in body
            errorToast.append(errorToast).fadeIn().delay(3000).fadeOut(500, function () {
                // errorToast.remove()
            });

            break;
        case constants.toastType.SUCCESS:
            // TODO: Update success toast
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

export async function login(email, password, rememberMe) {
    const url = $('.form-action').attr('action-href');
    const res = await fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password, rememberMe })
    });
    if (!res.ok) {
        const err = await res.json().catch(() => ({ error: 'Login failed' }));
        throw err;
    }
    const data = await res.json();
    return data;
}

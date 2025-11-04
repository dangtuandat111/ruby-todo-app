// Entry point for the build script in your package.json
import $ from "jquery";

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

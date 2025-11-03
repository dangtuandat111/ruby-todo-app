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
    localStorage.setItem('auth_token', data.token);
    return data;
}

export function authFetch(url, opts = {}) {
    const token = localStorage.getItem('auth_token');
    opts.headers = Object.assign({ 'Content-Type': 'application/json' }, opts.headers || {});
    if (token) opts.headers['Authorization'] = `Bearer ${token}`;
    return fetch(url, opts);
}
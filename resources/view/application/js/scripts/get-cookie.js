/*
 *
 * função recuperar valor do cookie
 */
function getCookie(k) {
    let cookies = " " + document.cookie;
    let key = " " + k + "=";
    let start = cookies.indexOf(key);

    if (start === -1) return null;

    let pos = start + key.length;
    let last = cookies.indexOf(";", pos);

    if (last !== -1) return cookies.substring(pos, last);

    return cookies.substring(pos);
}
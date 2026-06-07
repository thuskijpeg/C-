// Apply theme on page load
function applyTheme(theme) {
    if (theme === 'dark') {
        document.body.classList.add('dark-mode');
        var btn = document.getElementById('btnThemeToggle');
        if (btn) btn.innerText = '☀️ Light Mode';
    } else {
        document.body.classList.remove('dark-mode');
        var btn = document.getElementById('btnThemeToggle');
        if (btn) btn.innerText = '🌙 Dark Mode';
    }
}

// Toggle theme and save to cookie
function toggleTheme() {
    var current = getCookie('theme');
    var newTheme = current === 'dark' ? 'light' : 'dark';
    setCookie('theme', newTheme, 365);
    applyTheme(newTheme);
}

// Set cookie
function setCookie(name, value, days) {
    var expires = '';
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = '; expires=' + date.toUTCString();
    }
    document.cookie = name + '=' + value + expires + '; path=/';
}

// Get cookie
function getCookie(name) {
    var nameEQ = name + '=';
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
    }
    return 'light';
}

// Run on page load
window.onload = function () {
    var theme = getCookie('theme');
    applyTheme(theme);
};


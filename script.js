// ── Cached DOM References ──────────────────────────────────────
const toggle = document.getElementById('dark-toggle');
const label = document.getElementById('toggle-label');
const pwInput = document.getElementById('password');
const eyeBtn = document.getElementById('eye-btn');
const eyeIcon = document.getElementById('eye-icon');
const loginForm = document.getElementById('login-form');
const signinBtn = document.getElementById('signin-btn');
const toastEl = document.getElementById('toast');

// ── Dark Mode ──────────────────────────────────────────────────
// Persist preference in localStorage; fall back to OS preference
const savedTheme = localStorage.getItem('theme');
let dark = savedTheme
    ? savedTheme === 'dark'
    : window.matchMedia('(prefers-color-scheme: dark)').matches;

function applyDark(isDark) {
    document.body.classList.toggle('dark', isDark);
    label.textContent = isDark ? 'Light Mode' : 'Dark Mode';
    localStorage.setItem('theme', isDark ? 'dark' : 'light');
}

applyDark(dark);

toggle.addEventListener('click', () => {
    dark = !dark;
    applyDark(dark);
});

// ── Password Eye Toggle ────────────────────────────────────────
const eyeOpen = `<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>`;
const eyeClosed = `<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>`;

eyeBtn.addEventListener('click', () => {
    const show = pwInput.type === 'password';
    pwInput.type = show ? 'text' : 'password';
    eyeIcon.innerHTML = show ? eyeClosed : eyeOpen;
    eyeBtn.setAttribute('aria-pressed', String(show));
});

// ── Toast Notification ─────────────────────────────────────────
let toastTimer = null;

function showToast(msg, duration = 2500) {
    toastEl.textContent = msg;
    toastEl.classList.add('show');
    if (toastTimer) clearTimeout(toastTimer);          // prevent overlap
    toastTimer = setTimeout(() => {
        toastEl.classList.remove('show');
        toastTimer = null;
    }, duration);
}

// ── Sign In Form Validation & Submit ──────────────────────────
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

loginForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const email = document.getElementById('email').value.trim();
    const pass = pwInput.value;

    if (!email) { showToast('⚠️ Please enter your email'); return; }
    if (!EMAIL_RE.test(email)) { showToast('⚠️ Please enter a valid email'); return; }
    if (!pass) { showToast('⚠️ Please enter your password'); return; }

    signinBtn.textContent = 'Signing in…';
    signinBtn.disabled = true;

    setTimeout(() => {
        showToast('🎉 Welcome back!');
        signinBtn.textContent = 'Sign In';
        signinBtn.disabled = false;
    }, 1800);
});

// ── Ripple Effect on Sign In Button ───────────────────────────
signinBtn.addEventListener('click', function (e) {
    const ripple = document.createElement('span');
    ripple.className = 'ripple';
    const rect = this.getBoundingClientRect();
    const size = Math.max(rect.width, rect.height);
    ripple.style.cssText = `width:${size}px;height:${size}px;left:${e.clientX - rect.left - size / 2}px;top:${e.clientY - rect.top - size / 2}px`;
    this.appendChild(ripple);
    ripple.addEventListener('animationend', () => ripple.remove(), { once: true });
});

// ── Social Login Buttons (data-driven) ────────────────────────
const SOCIAL_TOASTS = {
    'btn-google': '🔵 Redirecting to Google…',
    'btn-facebook': '🔵 Redirecting to Facebook…',
    'btn-apple': '🍎 Redirecting to Apple…',
};

Object.entries(SOCIAL_TOASTS).forEach(([id, msg]) => {
    document.getElementById(id).addEventListener('click', () => showToast(msg));
});

// ── Forgot Password / Sign Up ──────────────────────────────────
document.getElementById('forgot-link').addEventListener('click', e => {
    e.preventDefault();
    showToast('📧 Password reset email sent!');
});
document.getElementById('signup-link').addEventListener('click', e => {
    e.preventDefault();
    showToast('📝 Sign Up coming soon!');
});

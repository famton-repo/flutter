// ── Dark Mode ──────────────────────────────────────────────────
const toggle = document.getElementById('dark-toggle');
const label = document.getElementById('toggle-label');
let dark = false;

// Respect OS preference on load
if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
    document.body.classList.add('dark');
    label.textContent = 'Light Mode';
    dark = true;
}

toggle.addEventListener('click', () => {
    dark = !dark;
    document.body.classList.toggle('dark', dark);
    label.textContent = dark ? 'Light Mode' : 'Dark Mode';
});

// ── Password Eye Toggle ────────────────────────────────────────
const pwInput = document.getElementById('password');
const eyeBtn = document.getElementById('eye-btn');
const eyeIcon = document.getElementById('eye-icon');

const eyeOpen = `<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>`;
const eyeClosed = `<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>`;

eyeBtn.addEventListener('click', () => {
    const show = pwInput.type === 'password';
    pwInput.type = show ? 'text' : 'password';
    eyeIcon.innerHTML = show ? eyeClosed : eyeOpen;
});

// ── Toast Notification ─────────────────────────────────────────
function showToast(msg, duration = 2500) {
    const toast = document.getElementById('toast');
    toast.textContent = msg;
    toast.classList.add('show');
    setTimeout(() => toast.classList.remove('show'), duration);
}

// ── Sign In Form ───────────────────────────────────────────────
document.getElementById('login-form').addEventListener('submit', (e) => {
    e.preventDefault();
    const email = document.getElementById('email').value.trim();
    const pass = document.getElementById('password').value;

    if (!email) { showToast('⚠️ Please enter your email'); return; }
    if (!pass) { showToast('⚠️ Please enter your password'); return; }

    const btn = document.getElementById('signin-btn');
    btn.textContent = 'Signing in…';
    btn.disabled = true;

    setTimeout(() => {
        showToast('🎉 Welcome back!');
        btn.textContent = 'Sign In';
        btn.disabled = false;
    }, 1800);
});

// ── Ripple Effect on Sign In Button ───────────────────────────
document.getElementById('signin-btn').addEventListener('click', function (e) {
    const ripple = document.createElement('span');
    ripple.className = 'ripple';
    const rect = this.getBoundingClientRect();
    const size = Math.max(rect.width, rect.height);
    ripple.style.cssText = `width:${size}px;height:${size}px;left:${e.clientX - rect.left - size / 2}px;top:${e.clientY - rect.top - size / 2}px`;
    this.appendChild(ripple);
    ripple.addEventListener('animationend', () => ripple.remove());
});

// ── Social Login Buttons ───────────────────────────────────────
document.getElementById('btn-google').addEventListener('click', () => showToast('🔵 Redirecting to Google…'));
document.getElementById('btn-facebook').addEventListener('click', () => showToast('🔵 Redirecting to Facebook…'));
document.getElementById('btn-apple').addEventListener('click', () => showToast('🍎 Redirecting to Apple…'));

// ── Forgot Password / Sign Up ──────────────────────────────────
document.getElementById('forgot-link').addEventListener('click', e => { e.preventDefault(); showToast('📧 Password reset email sent!'); });
document.getElementById('signup-link').addEventListener('click', e => { e.preventDefault(); showToast('📝 Sign Up coming soon!'); });

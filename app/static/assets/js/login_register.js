document.addEventListener('DOMContentLoaded', function() {
    function setupPasswordToggle(toggleId, passwordId) {
        const togglePassword = document.getElementById(toggleId);
        const passwordField = document.getElementById(passwordId);

        if (togglePassword && passwordField) {
            togglePassword.addEventListener('click', function() {
                const type = passwordField.type === 'password' ? 'text' : 'password';
                passwordField.type = type;

                const icon = togglePassword.querySelector('i');
                if (type === 'password') {
                    icon.classList.remove('bi-eye-slash');
                    icon.classList.add('bi-eye');
                } else {
                    icon.classList.remove('bi-eye');
                    icon.classList.add('bi-eye-slash');
                }
            });
        }
    }

    // Configura el toggle para el formulario de login
    setupPasswordToggle('togglePasswordLogin', 'passwordLogin');

    // Configura el toggle para el formulario de registro
    setupPasswordToggle('togglePasswordRegister', 'passwordRegister');
    setupPasswordToggle('toggleRepeatPassword', 'repeatPasswordRegister');
});

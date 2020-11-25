document.addEventListener('turbolinks:load', function() {
    var confirmation = document.querySelector('#confirm_password')
    if (confirmation) { confirmation.addEventListener('input', passMatch) }
});

function passMatch(){
    var password = document.getElementById("password");
    var password_confirmation = document.getElementById("confirm_password")

    if (password_confirmation.value === "")
        return

    if (password.value === password_confirmation.value) {
        password.style.borderColor = "green"
        password_confirmation.style.borderColor = "green"
    } else {
        password.style.borderColor = "red"
        password_confirmation.style.borderColor = "red"
    }
}

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
        password.style.removeProperty('borderColor')
        password_confirmation.style.removeProperty('borderColor')

        password.style.borderColor = "green"
        password_confirmation.style.borderColor = "green"
    } else {
        password.style.removeProperty('borderColor')
        password_confirmation.style.removeProperty('borderColor')
        
        password.style.borderColor = "red"
        password_confirmation.style.borderColor = "red"
    }
}

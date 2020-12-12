document.addEventListener('turbolinks:load', function() {
	var checkboxes = document.querySelectorAll('.checkBox')
 	if (checkboxes) { 
 		for (var i = 0; i < checkboxes.length; i++) {
 			checkboxes[i].addEventListener('change', answerExistenceCheck) 
 		}
 	}
});

function anyChecked() {
	var checkboxes = document.querySelectorAll('.checkBox')
	for (var i = 0; i < checkboxes.length; i++) {
		if (checkboxes[i].checked) return false
	}
	return true
}

function answerExistenceCheck() {
	button = document.querySelector('.next')
	button.disabled = anyChecked()
}
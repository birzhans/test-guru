document.addEventListener('turbolinks:load', function () {
    var content = document.querySelector('#timeLeft');
    n = parseInt(document.querySelector('.remaining').textContent) 

    if (content) content.addEventListener('*', timeLeft(n))
});

function timeLeft(duration) {
	var content = document.querySelector('#timeLeft');
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        content.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}
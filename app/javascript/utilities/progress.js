document.addEventListener('turbolinks:load', function () {
    var button = document.querySelector('.next');
    if (button) button.addEventListener('click', addProgress(button.dataset.progress))
});

function addProgress(progress) {
    document.querySelector('.progress-bar').style["width"] = progress + "%"
}

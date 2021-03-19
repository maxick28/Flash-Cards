const stopwatch = document.getElementById('stopwatch');
const startGameButton = document.getElementById('start-game-button');
let seconds = 0;
let minutes = 0;

function updateStopwatch() {
    seconds++;
    if (seconds >= 60) {
        seconds = 0;
        minutes++;
    }

    stopwatch.textContent = (minutes ? (minutes > 9 ? minutes : "0" + minutes) : "00") + ":" + (seconds > 9 ? seconds : "0" + seconds);

    timer();
}

function timer() {
    window.t = setTimeout(updateStopwatch, 1000);
}

startGameButton.onclick = timer;

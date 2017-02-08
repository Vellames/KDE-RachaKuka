var gameStartTime = new Date();

function incrementStep(){
    gameWindow.actualStep++;
}

function calcGamePlayTime(){
    var actualDate = new Date();

    var totalMs = actualDate.getTime() - gameStartTime.getTime()
    var totalSeconds = Math.floor(totalMs / 1000);

    var minutes = Math.floor(totalSeconds / 60);
    var seconds = Math.floor(totalSeconds - (minutes * 60))

    if(seconds < 10){
        seconds = "0" + seconds;
    }

    gameplayTime.text = "Time: " + minutes + ":" + seconds;
}

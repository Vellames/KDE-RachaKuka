var gameStartTime = new Date();

var isPlaying = false;

function incrementStep(){
    gameWindow.actualStep++;
}

function resetSteps(){
    gameWindow.actualStep = 0;
}

function calcGamePlayTime(){

    if(!isPlaying) {
        return false;
    }

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

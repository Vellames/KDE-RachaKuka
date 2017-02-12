/**
  * Save the start date of game
  */
var gameStartTime = new Date();

/**
  * Control if the gaming is running
  */
var isPlaying = false;

/**
 * Increment the step count
 * @author Cassiano Vellames <c.vellames@outlook.com>
 */

function incrementStep(){
    gameWindow.actualStep++;
}

/**
 * Reset the steps count
 * @author Cassiano Vellames <c.vellames@outlook.com>
 */

function resetSteps(){
    gameWindow.actualStep = 0;
}

/**
 * Calculate the playing time
 * @author Cassiano Vellames <c.vellames@outlook.com>
 */
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

/**
 * Verify if player win the game
 * @return boolean - Returns if the player win the game
 * @author Cassiano Vellames <c.vellames@outlook.com>
 */
function playerWins(){

    // Init matrixGame
    var matrixGame = [];
    for ( var i = 0; i < gameWindow.rows; i++ ) {
        matrixGame[i] = [];
    }

    // Organize the matrix to check condition of win
    for(var i = 0; i < gameArea.children.length; i++){
        matrixGame[gameArea.children[i].actualRow - 1][gameArea.children[i].actualColumn - 1] = gameArea.children[i].value;
    }

    // Verify if player win the game
    var lastRectValue = 0;
    for(var rowsCount = 0; rowsCount < gameWindow.rows; rowsCount++){
        for(var columnsCount = 0; columnsCount < gameWindow.columns; columnsCount++){
            var actualRectValue = matrixGame[rowsCount][columnsCount];
            var checkSum = (actualRectValue - 1) - lastRectValue;
            if(checkSum != 0){
               return false;
            }
            lastRectValue = actualRectValue;
        }
    }

    isPlaying = false;
    gameplayTimer.stop();
    return true;
}

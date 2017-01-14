var matrixGame = [];

/**
  * Create all the rects of the game
  * @author Cassiano Vellames <c.vellames@outlook.com>
  */
function createComponents() {

    /**
      * Number of columns in game
      */
    var gameColumns = appWindow.columns;

    /**
      * Number of rows in game
      */
    var gameRows = appWindow.rows;

    /**
      * Width of each rect
      */
    var rectWidth = appWindow.width / gameColumns;

    /**
      * Height of each rect
      */
    var rectHeight = appWindow.height / gameRows;

    /**
      * Possible values to rects
      */
    var possibleNumbers = getPossibleNumbers(gameColumns, gameRows);


    // Create the rects
    for(var columnsCount = 1; columnsCount <= gameColumns; columnsCount++){
        for(var rowsCount = 1; rowsCount <= gameRows; rowsCount++){

            // If the creator are in the last rect, render an empty rect
            if(rowsCount === gameRows && columnsCount === gameColumns){
                continue;
                // TODO: Create empty rect
            }

            var component = Qt.createComponent("Rect.qml");
            if (component.status === Component.Ready){

                // Get random index o put in value of rect
                var index = Math.floor(Math.random() * (possibleNumbers.length - 1));

                var params = {
                    actualColumn: columnsCount,
                    actualRow: rowsCount,
                    x: ((columnsCount - 1) * appWindow.defaultWidth) + (columnsCount),
                    y: ((rowsCount - 1) * appWindow.defaultHeight) + (rowsCount),
                    value: possibleNumbers[index]
                 };

                var sprite = component.createObject(appWindow, params);

                // Add the value in the array of rect values
                console.log(possibleNumbers[index]);
                matrixGame.push(possibleNumbers[index]);

                // Remove used value
                possibleNumbers.splice(index, 1);
            }
        }
    }
}

/**
  * Move a rect to another place
  * @author Cassiano Vellames <c.vellames@outlook.com>
  */
function moveRect(rect){

    // Verify the position of blank rect
    var blankInRight    = ((blankRect.actualColumn === (rect.actualColumn + 1) && blankRect.actualRow === rect.actualRow));
    var blankInLeft     = ((blankRect.actualColumn === (rect.actualColumn - 1) && blankRect.actualRow === rect.actualRow));
    var blankInTop      = ((blankRect.actualRow === (rect.actualRow + 1) && blankRect.actualColumn === rect.actualColumn));
    var blankInBottom   = ((blankRect.actualRow === (rect.actualRow - 1) && blankRect.actualColumn === rect.actualColumn));

    if(!blankInRight && !blankInLeft && !blankInTop && !blankInBottom){
        console.log("Impossible move rect");
        return;
    }

    // Change the positions of target rect and blank rect
    var blankRectColumn = blankRect.actualColumn;
    var blankRectRow = blankRect.actualRow;

    var rectColumn = rect.actualColumn;
    var rectRow = rect.actualRow;

    rect.actualColumn = blankRectColumn;
    rect.actualRow = blankRectRow

    blankRect.actualColumn = rectColumn;
    blankRect.actualRow = rectRow;

    // Apply the modification in X and Y in the rect
    rect.x = getXRect(rect.actualColumn, appWindow.defaultWidth);
    rect.y = getYRect(rect.actualRow, appWindow.defaultHeight);

    // Check if the player win the game
    checkConditionOfWin()
}

// ============= private functions =========== //

var checkConditionOfWin = function(){
    console.log(matrixGame.length);
    for(var i = 0; i < matrixGame.length; i++){
        console.log(matrixGame[i].value);
    }
}

 /**
  * Get the X axis based in column and application width
  * @param int actualColumn - Number of column of the rect
  * @param int applicationWidth - width of application
  * @return int - X axis of rect
  * @author Cassiano Vellames <c.vellames@outlook.com>
  */
var getXRect = function(actualColumn, applicationWidth){
    return ((actualColumn - 1) * applicationWidth) + actualColumn
}

/**
  * Get the Y axis based in passed row and application height
  * @param int actualRow - Number of row of the rect
  * @param int applicationHeight - Height of application
  * @return int - Y axis of rect
  * @author Cassiano Vellames <c.vellames@outlook.com>
  */
var getYRect = function(actualRow, applicationHeight) {
    return (actualRow -1) * applicationHeight + actualColumn
}

/**
  * Return an array with all possible numbers to put in the matrix game
  * @param int gameColumns - Number of columns in game
  * @param int gameRows - Number of rows in game
  * @return array - Array with all possible numbers to put in matrixs game
  * @author Cassiano Vellames <c.vellames@outlook.com>
  */
var getPossibleNumbers = function(gameColumns, gameRows){
    var numberOfRects = (gameColumns * gameRows) - 1

    var possibleNumbers = [];
    for(var i = 1; i <= numberOfRects; i++){
        possibleNumbers.push(i);
    }

    return possibleNumbers;
}

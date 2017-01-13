/**
  * Create all the rects of the game
  * @author Cassiano Vellames <c.vellames@outlook.com>
  */
function createComponents() {

    /**
      * Number of columns in game
      */
    var gameColumns = 3;

    /**
      * Number of rows in game
      */
    var gameRows = 3;

    /**
      * Width of each rect
      */
    var rectWidth = appWindow.width / gameColumns;

    /**
      * Height of each rect
      */
    var rectHeight = appWindow.height / gameRows;

    /**
      * Margin between each rect
      */
    var margins = 2;

    /**
      * Possible values to rects
      */
    var possibleNumbers = [1,2,3,4,5,6,7,8];


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
                    x: ((columnsCount - 1) * appWindow.defaultWidth) + (columnsCount * margins),
                    y: ((rowsCount - 1) * appWindow.defaultHeight) + (rowsCount * margins),
                    value: possibleNumbers[index]
                 };

                var sprite = component.createObject(appWindow, params);

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
    rect.x = getXRect(rect.actualColumn, appWindow.defaultWidth, 2);
    rect.y = ((rect.actualRow - 1) * appWindow.defaultHeight) + (rect.actualRow * margins)
}

var getXRect = function(actualColumn, applicationWidth, margins){
    return ((actualColumn - 1) * applicationWidth) + (actualColumn * margins)
}

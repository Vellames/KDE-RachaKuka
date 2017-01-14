import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import "componentCreator.js" as ComponentCreatorScript

ApplicationWindow {
    // Aplication definitions
    visible: true
    width: 600
    height: 480
    maximumWidth: 600
    maximumHeight: 480
    minimumWidth : 600
    minimumHeight: 480

    title: qsTr("KDE - Racha KuKaa")
    id: appWindow

    // Default size of a rect
    property int defaultWidth : (width / columns)
    property int defaultHeight : (height / rows)

    // Size of game
    property int rows : 3
    property int columns : 3

    // Call the level creator
    Component.onCompleted: ComponentCreatorScript.createComponents();

    // It is necessary a blank rect to use as reference to another rects
    // A rect can only be moved if he are in left, right, top or bottom of the blank rect
    Rectangle{

        id: blankRect
        color: "white"
        width: appWindow.defaultWidth
        height: appWindow.defaultHeight

        // The blank rect always will start in the last position of the matrix
        property int actualColumn : appWindow.rows
        property int actualRow : appWindow.columns

        // Define the position of blank rect
        x: ((actualColumn - 1) * appWindow.defaultWidth) + actualColumn
        y: ((actualRow - 1) * appWindow.defaultHeight) + actualRow

        MouseArea{ anchors.fill: parent }
    }

}

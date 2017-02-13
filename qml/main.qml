import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0
import "../js/level_creator.js" as LevelCreator
import "../js/game_status.js" as GameStatus

ApplicationWindow {
    // Aplication definitions
    visible: true
    width: 600
    height: 480
    maximumWidth: 600
    maximumHeight: 480
    minimumWidth : 600
    minimumHeight: 480

    // Start always in center
    x : Screen.width / 2 - width / 2
    y : Screen.height / 2 - height / 2

    // Close loader if he are open
    onClosing: loader.source = ""

    title: qsTr("KDE - Racha KuKa")
    id: gameWindow

    // Default size of a rect
    property int defaultWidth : (width / columns)
    property int defaultHeight : (height / rows) - ((gameStatus.height + LevelCreator.menuBarHeight) / rows)

    // Size of game
    property int rows : 3
    property int columns : 3

    // Next "New Game" Configurations
    property int nextRows : 3
    property int nextColumns : 3

    // Status
    property int actualStep : 0

    // Gameplay Timer
    Timer {
        id: gameplayTimer
        interval: 1000
        running: true
        repeat: true
        onTriggered: GameStatus.calcGamePlayTime()
    }

    // Menu Game
    menuBar: MenuBar {
        id: menuBar

        Menu {
            title: "Game"
            MenuItem {
                text: "New Game"
                onTriggered: LevelCreator.createComponents()

            }
            MenuItem {
                text: "Configure..."
                onTriggered: {
                    loader.source = "configure.qml"
                }
            }
        }
    }

    // Loader
    Loader { id: loader }

    // Background
    Rectangle{
        color: "#1C1C1C";
        anchors.fill: parent
    }

    // Winner Message
    Text {
        id: txtGameWin
        text: "Congratulations, You Win!"
        font.pixelSize: 30
        color: "#FFF"
        anchors.centerIn: parent
        opacity: 0

        Behavior on opacity {
            NumberAnimation { duration: 500 }
        }
    }

    // Game Status
    Rectangle {
        id: gameStatus;
        color: "#0D0D0D";
        height: 30
        width: gameWindow.width
        x: 0
        y: 0

        RowLayout{
            anchors.fill: parent
            spacing: 2

            Text {
                id: steps;
                text: "Steps: " + gameWindow.actualStep
                color: "#FFFFFF"
                font.pixelSize: 13
                anchors.verticalCenter: parent.verticalCenter
                Layout.minimumWidth: parent.width / 2
            }

            Text {
                id: gameplayTime
                text: "Time: 0:00"
                color: "#FFFFFF"
                font.pixelSize: 13
                anchors.verticalCenter: parent.verticalCenter
                Layout.minimumWidth: parent.width / 2
            }
        }

    }

    Rectangle{
        id: gameArea

        // It is necessary a blank rect to use as reference to another rects
        // A rect can only be moved if he are in left, right, top or bottom of the blank rect
        Rectangle {

            id: blankRect
            color: "#4A4A4A"
            width: gameWindow.defaultWidth
            height: gameWindow.defaultHeight
            opacity: 0;

            border.color: "#121212"

            // The blank rect always will start in the last position of the matrix
            property int actualColumn : gameWindow.rows
            property int actualRow : gameWindow.columns
            property int value: gameWindow.rows * gameWindow.columns

            // Define the position of blank rect
            x: (actualColumn - 1) * gameWindow.defaultWidth
            y: (actualRow - 1) * gameWindow.defaultHeight + gameStatus.height

            Behavior on x {
                NumberAnimation {
                    easing {
                        type: Easing.OutElastic
                        amplitude: 1.0
                        period: 5
                    }
                }
            }

            Behavior on y {
                NumberAnimation {
                    easing {
                        type: Easing.OutElastic
                        amplitude: 1.0
                        period: 5
                    }
                }
            }

            Behavior on opacity {
                NumberAnimation { duration: 500 }
            }

        }

    }

}

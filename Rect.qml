import QtQuick 2.0
import "componentCreator.js" as ComponentCreatorScript
import "game_status.js" as GameStatus

Item {

    property alias actualColumn: rectangle.actualColumn
    property alias actualRow: rectangle.actualRow
    property alias value: rectangle.value

    width: gameWindow.defaultWidth
    height: gameWindow.defaultHeight

    Rectangle{
        id: rectangle
        color: "#1F1F1F"
        anchors.fill: parent

        border.color: "#121212"

        property int actualColumn : parent.actualColumn
        property int actualRow : parent.actualRow
        property int value

        Text{
            anchors.centerIn: parent
            text: parent.value
            color: "#FFFFFF"
            font.pixelSize: 30
            font.bold: Font.MixedCase
        }

        MouseArea{
            anchors.fill: parent
            onClicked: ComponentCreatorScript.moveRect(this.parent.parent)
        }
    }

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
}

import QtQuick 2.0
import "componentCreator.js" as ComponentCreatorScript


Item {

    property alias actualColumn: rectangle.actualColumn
    property alias actualRow: rectangle.actualRow
    property alias value: rectangle.value

    width: appWindow.defaultWidth
    height: appWindow.defaultHeight

    Rectangle{
        id: rectangle
        color: "red"
        anchors.fill: parent

        property int actualColumn : parent.actualColumn
        property int actualRow : parent.actualRow
        property int value

        Text{
            anchors.centerIn: parent
            text: parent.value
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

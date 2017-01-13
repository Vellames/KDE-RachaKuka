import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import "componentCreator.js" as ComponentCreatorScript

ApplicationWindow {
    visible: true
    width: 600
    height: 480
    title: qsTr("KDE - Racha KuKadff")
    id: appWindow

    property int margins: 2
    property int defaultWidth : (width / columns) - (margins * columns)
    property int defaultHeight : (height / rows) - (margins * rows)

    property int rows : 3
    property int columns : 3

    Component.onCompleted: ComponentCreatorScript.createComponents();

    Rectangle{
        id: blankRect
        color: "white"
        width: appWindow.defaultWidth
        height: appWindow.defaultHeight

        property int actualColumn : 3
        property int actualRow : 3

        x: ((actualColumn - 1) * appWindow.defaultWidth) + (actualColumn * margins)
        y: ((actualRow - 1) * appWindow.defaultHeight) + (actualRow * margins)


        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log("blankRect")
            }
        }
    }

}

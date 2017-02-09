import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2

ApplicationWindow {
    // Aplication definitions
    visible: true
    width: 270
    height: 140
    maximumWidth: 270
    maximumHeight: 140
    minimumWidth : 270
    minimumHeight: 140

    // Start always in center
    x : Screen.width / 2 - width / 2
    y : Screen.height / 2 - height / 2


    title: qsTr("KDE - Racha KuKa - Configure")
    id: configureWindow

    /*
        This group is used to configure the size of the game
    */
    GroupBox {
        id: difficulty
        title: "Difficulty"

        RowLayout {
            ExclusiveGroup { id: tabPositionGroup }
            RadioButton {
                text: "Easy"
                checked: true
                exclusiveGroup: tabPositionGroup
                onClicked: {
                    gameWindow.rows = gameWindow.columns = inputRows.text = inputColumns.text = 3;
                    inputRows.readOnly = inputColumns.readOnly = true;

                }
            }
            RadioButton {
                text: "Medium"
                exclusiveGroup: tabPositionGroup
                onClicked: {
                    gameWindow.rows = gameWindow.columns = inputRows.text = inputColumns.text = 4;
                    inputRows.readOnly = inputColumns.readOnly = true;
                }
            }
            RadioButton {
                text: "Hard"
                exclusiveGroup: tabPositionGroup
                onClicked: {
                    gameWindow.rows = gameWindow.columns = inputRows.text = inputColumns.text = 5;
                    inputRows.readOnly = inputColumns.readOnly = true;
                }
            }
            RadioButton {
                text: "Personal"
                exclusiveGroup: tabPositionGroup
                onClicked: {
                    inputRows.readOnly = inputColumns.readOnly = false;
                }
            }
        }
    }

    /*
        Inputs for personal difficulty
    */
    RowLayout{

        id: personalConfigLayout
        anchors.top: difficulty.bottom
        anchors.topMargin: 10
        spacing: 4

        Text {
            id: txtRows
            text: qsTr("Rows")
            color: "#FFF"

            Layout.fillWidth: true
            Layout.preferredWidth: 40
        }

        TextField {
            id: inputRows
            text: "3"
            textColor: "#000"
            readOnly: true
            validator: IntValidator{
                bottom: 3
                top: 11
            }

            Layout.fillWidth: true
            Layout.preferredWidth: 50
        }

        Text {
            id: txtColumns
            text: qsTr("Columns")
            color: "#FFF"

            Layout.fillWidth: true
            Layout.preferredWidth: 60
        }

        TextField {
            id: inputColumns
            text: "3"
            textColor: "#000"
            readOnly: true
            validator: IntValidator{
                bottom: 3
                top: 11
            }

            Layout.fillWidth: true
            Layout.preferredWidth: 50
        }

    }

    Button{
        id: btnApply
        anchors.top: personalConfigLayout.bottom
        anchors.topMargin: 10
        text: "Apply"
        width: 85
        height: 25
        style: ButtonStyle{
            background: Rectangle{
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 2
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#444" : "#232323" }
                    GradientStop { position: 1 ; color: control.pressed ? "#333" : "#323232" }
                }
            }
        }

        onClicked: {
            gameWindow.rows = inputRows.text
            gameWindow.columns = inputColumns.text
        }
    }





}

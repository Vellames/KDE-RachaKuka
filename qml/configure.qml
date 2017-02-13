import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2
import "../js/level_creator.js" as LevelCreator
import "../js/game_status.js" as GameStatus

ApplicationWindow {
    // Aplication definitions
    visible: true
    width: 250
    height: 115
    maximumWidth: 250
    maximumHeight: 115
    minimumWidth : 250
    minimumHeight: 115

    // Start always in center
    x : Screen.width / 2 - width / 2
    y : Screen.height / 2 - height / 2

    onClosing: {
        loader.source = ""
    }

    title: qsTr("KDE - Racha KuKa - Configure")
    id: configureWindow

    // Background
    Rectangle{
        color: "#1C1C1C";
        anchors.fill: parent
    }

    /*
        This group is used to configure the size of the game
    */
    GroupBox {
        id: difficulty
        anchors.horizontalCenter: parent.horizontalCenter

        RowLayout {
            ExclusiveGroup { id: tabPositionGroup }
            RadioButton {
                id: radioButtonEasy
                style:  RadioButtonStyle{
                    label: Text{
                        color: "#FFF";
                        text: "Easy"
                    }
                }
                checked: (gameWindow.nextColumns === 3 && gameWindow.nextRows === 3)
                exclusiveGroup: tabPositionGroup
                onClicked: {
                    inputRows.text = inputColumns.text = 3;
                    inputRows.readOnly = inputColumns.readOnly = true;
                }
            }
            RadioButton {
                id: radioButtonMedium
                style:  RadioButtonStyle{
                    label: Text{
                        color: "#FFF";
                        text: "Medium"
                    }
                }
                checked: (gameWindow.nextColumns === 4 && gameWindow.nextRows === 4)
                exclusiveGroup: tabPositionGroup
                onClicked: {
                    inputRows.text = inputColumns.text = 4;
                    inputRows.readOnly = inputColumns.readOnly = true;
                }
            }
            RadioButton {
                id: radioButtonHard
                style:  RadioButtonStyle{
                    label: Text{
                        color: "#FFF";
                        text: "Hard"
                    }
                }
                checked: (gameWindow.nextColumns === 5 && gameWindow.nextRows === 5)
                exclusiveGroup: tabPositionGroup
                onClicked: {
                    inputRows.text = inputColumns.text = 5;
                    inputRows.readOnly = inputColumns.readOnly = true;
                }
            }
            RadioButton {
                id: radioButtonCustom
                style:  RadioButtonStyle{
                    label: Text{
                        color: "#FFF";
                        text: "Custom"
                    }
                }
                checked: (!radioButtonEasy.checked && !radioButtonMedium.checked && !radioButtonHard.checked)
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
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: txtRows
            text: qsTr("Rows")
            color: "#FFF"

            Layout.fillWidth: true
            Layout.preferredWidth: 40
        }

        TextField {
            id: inputRows
            text: gameWindow.nextRows
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
            text: gameWindow.nextColumns
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
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Apply"
        width: 100
        height: 30
        style: ButtonStyle{
            background: Rectangle{
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 2
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#CECECE" : "#DDD" }
                    GradientStop { position: 1 ; color: control.pressed ? "#DCDCDC" : "#EEE" }
                }
            }
        }

        onClicked: {
            gameWindow.nextRows = inputRows.text
            gameWindow.nextColumns = inputColumns.text
            loader.source = ""
        }
    }

}

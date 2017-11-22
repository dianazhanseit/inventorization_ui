import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

Item {
    id: loginPage
    visible: true
    width: 1360
    height: 720

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: parent.top
    }

    Item {
        id: sign
        visible: true
        width: 1360
        height: 720

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            anchors.top: parent.top
        }

        GroupBox {
            id: groupBox
            x: 482
            y: 176
            width: 396
            height: 368
            opacity: 1
            clip: false
            visible: true
            title: qsTr("")

            Rectangle {
                id: rectangle
                x: -10
                y: -5
                width: 394
                height: 367
                color: "#4e4d4d"
                border.width: 5
                border.color: "#4e4d4d"
                radius: 15

                Rectangle {
                    id: rectangle1
                    x: 4
                    y: 92
                    width: 386
                    height: 182
                    color: "#ffffff"

                }
                Rectangle {
                    id: rectangle2
                    x: 4
                    y: 181
                    width: 386
                    height: 182
                    color: "#ffffff"
                    radius: 15
                }

                TextField {
                    id: textField
                    x: 78
                    y: 144
                    width: 238
                    height: 40
                    text: qsTr("Text Field")
                }

                TextField {
                    id: textField1
                    x: 78
                    y: 214
                    width: 238
                    height: 40
                    text: qsTr("Text Field")
                }

                Button {
                    id: signIn
                    x: 147
                    y: 294
                    text: qsTr("Sign in")
                    checkable: false
                    checked: true
                    highlighted: true
                    onClicked: stack.push([mypage])
                }
            }
        }
    }
}

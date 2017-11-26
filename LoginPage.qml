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


            Rectangle {
                id: rectangle
                x: 483
                y: 176
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

                    Text {
                        id: text1
                        x: 111
                        y: 45
                        color: "#e60b0b"
                        text: qsTr("Invalid login or password")
                        font.bold: true
                        font.family: "Times New Roman"
                        font.pixelSize: 16
                    }

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
                    y: 164
                    width: 238
                    height: 40
                    text: qsTr("Text Field")
                }

                TextField {
                    id: textField1
                    x: 78
                    y: 225
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

                Image {
                    id: image
                    x: 159
                    y: 53
                    width: 76
                    height: 76
                    source: "qrc:/qtquickplugin/images/template_image.png"
                }
            }
        }
    }


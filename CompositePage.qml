import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtGraphicalEffects.private 1.0
import Qt.labs.calendar 1.0
import QtQuick.Templates 2.2
import QtQuick.Extras 1.4
import QtTest 1.2
import QtQuick.Dialogs 1.0
import com.info 1.0

Item {
    id: compositePage
    width: 1360
    height: 720
    visible: true

    Rectangle {
        id: rectangle
        x: 0
        width: 1366
        height: 78
        color: "#2f475f"
        anchors.right: parent.right
        anchors.rightMargin: -6
        anchors.top: parent.top
        anchors.topMargin: 0
    }

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 233
        height: 720
        color: "#171918"
        visible: true

        Rectangle {
            id: homeRect
            x: 0
            y: 77
            width: 233
            height: 105
            color: "#4da194"

            Image {
                id: avatarSmall
                x: 12
                y: 18
                width: 72
                height: 69
                source: Qt.resolvedUrl(personServer.avatarFile)

                property bool rounded: true
                property bool adapt: true

                layer.enabled: rounded
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: avatarSmall.width
                        height: avatarSmall.height
                        Rectangle {
                            anchors.centerIn: parent
                            width: avatarSmall.adapt ? avatarSmall.width : Math.min(
                                                           avatarSmall.width,
                                                           avatarSmall.height)
                            height: avatarSmall.adapt ? avatarSmall.height : width
                            radius: Math.min(width, height)
                        }
                    }
                }
            }

            Text {
                id: welcomeLabel
                x: 101
                y: 28
                width: 59
                height: 16
                color: "#171918"
                text: qsTr("Welcome")
                font.family: "Tahoma"
                font.pixelSize: 14
            }

            Label {
                id: fullNameLabel
                x: 101
                y: 56
                width: 80
                height: 19
                color: "#ffffff"
                text: personServer.firstName + ' ' + personServer.lastName
                font.family: "Tahoma"
                font.pixelSize: 16
            }
        }

        Rectangle {
            id: rdaVinci
            x: 0
            y: 182
            width: 233
            height: 68
            color: "#171918"
            visible: true
            MouseArea {
                id: mouseArea
                width: parent.width
                height: parent.height
                visible: true
                enabled: true
                onClicked: stack.push([daVinci])
            }
        }

        Rectangle {
            id: rNewton
            x: 0
            y: 251
            width: 233
            height: 68
            color: "#171918"
            visible: true
            MouseArea {
                width: parent.width
                height: parent.height
                visible: true
                enabled: true
                onClicked: stack.push([newton])
            }
        }

        Rectangle {
            id: rEinstein
            x: 0
            y: 320
            width: 233
            height: 68
            color: "#171918"
            visible: true
            MouseArea {
                width: parent.width
                height: parent.height
                visible: true
                enabled: true
                onClicked: stack.push([einstein])
            }
        }
    }

    Rectangle {
        id: logoRect
        x: 0
        y: 0
        width: 233
        height: 78
        color: "#343b41"

        Label {
            id: lab
            x: 13
            y: 22
            width: 47
            height: 33
            color: "#ffffff"
            text: qsTr("LAB")
            font.pixelSize: 24
        }

        Label {
            id: lab1
            x: 66
            y: 22
            width: 47
            height: 33
            color: "#64cc6b"
            text: qsTr("APPLICATION")
            font.pixelSize: 24
        }
    }

    Label {
        id: daVinci
        x: 51
        y: 206
        width: 132
        height: 24
        color: "#ffffff"
        text: qsTr("DA VINCI LAB")
        elide: Text.ElideLeft
        renderType: Text.NativeRendering
        textFormat: Text.AutoText
        wrapMode: Text.WrapAnywhere
        topPadding: 0.2
        fontSizeMode: Text.HorizontalFit
        font.family: "Tahoma"
    }

    Label {
        id: daVinci1
        x: 51
        y: 273
        width: 132
        height: 24
        color: "#ffffff"
        text: qsTr("NEWTON LAB")
        textFormat: Text.AutoText
        fontSizeMode: Text.HorizontalFit
        elide: Text.ElideLeft
        wrapMode: Text.WrapAnywhere
        renderType: Text.NativeRendering
        topPadding: 0.2
        font.family: "Tahoma"
    }

    Label {
        id: daVinci2
        x: 51
        y: 342
        width: 132
        height: 24
        color: "#ffffff"
        text: qsTr("EINSTEIN LAB")
        textFormat: Text.AutoText
        fontSizeMode: Text.HorizontalFit
        wrapMode: Text.WrapAnywhere
        elide: Text.ElideLeft
        renderType: Text.NativeRendering
        topPadding: 0.2
        font.family: "Tahoma"
    }

    StackView {
        x: 243
        y: 100
        width: parent.width - x
        height: parent.height - y

        initialItem: homePage
    }

    Component {
        id: homePage
        MyPage{}
    }

//    Component {
//        id: findItems

//    }
}
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

Item {
    id: myPage
    width: 1360
    height: 720
    visible: true
    transformOrigin: Item.Center

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
            id: rMyPage
            x: 0
            y: 77
            width: 233
            height: 105
            color: "#4da194"

            Image {
                id: icon
                x: 12
                y: 18
                width: 72
                height: 69
                source: "qrc:/qtquickplugin/images/template_image.png"

                    property bool rounded: true
                    property bool adapt: true

                    layer.enabled: rounded
                    layer.effect: OpacityMask {
                        maskSource: Item {
                            width: img.width
                            height: img.height
                            Rectangle {
                                anchors.centerIn: parent
                                width: img.adapt ? img.width : Math.min(img.width, img.height)
                                height: img.adapt ? img.height : width
                                radius: Math.min(width, height)
                            }
                        }
                    }
                }


            Text {
                id: text1
                x: 101
                y: 28
                width: 59
                height: 16
                color: "#171918"
                text: qsTr("Welcome")
                font.family: "Tahoma"
                font.pixelSize: 14
            }

            TextEdit {
                id: textEdit
                x: 101
                y: 56
                width: 80
                height: 19
                color: "#ffffff"
                text: qsTr("MASTER NAME")
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
            color: "#4da194"
            visible: false

        }

        Rectangle {
            id: rNewton
            x: 0
            y: 251
            width: 233
            height: 68
            color: "#4da194"
            visible: false
        }
        
        Rectangle {
            id: rEinstein
            x: 0
            y: 320
            width: 233
            height: 68
            color: "#4da194"
            visible: false
        }
        
        Rectangle {
            id: rEinstein1
            x: 0
            y: 387
            width: 233
            height: 68
            color: "#4da194"
            visible: false
        }
    }

    Rectangle {
        id: rectangle2
        x: 0
        y: 0
        width: 233
        height: 78
        color: "#343b41"

        TextEdit {
            id: lab
            x: 13
            y: 22
            width: 47
            height: 33
            color: "#ffffff"
            text: qsTr("LAB")
            font.pixelSize: 24
        }

        TextEdit {
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

    Image {
        id: stimg
        x: 320
        y: 132
        width: 240
        height: 240
        source: "qrc:/qtquickplugin/images/template_image.png"
    }

    TextEdit {
        id: name
        x: 608
        y: 150
        width: 80
        height: 20
        text: qsTr("Name")
        font.pixelSize: 16
    }

    TextEdit {
        id: surname
        x: 608
        y: 196
        width: 80
        height: 20
        text: qsTr("Name")
        font.family: "Verdana"
        font.pixelSize: 16
    }

    TextEdit {
        id: major
        x: 608
        y: 242
        width: 80
        height: 20
        text: qsTr("major")
        font.pixelSize: 16
        font.family: "Verdana"
    }

    Item {
        id: item2
        x: 320
        y: 463
        width: 962
        height: 200
    }
    Item {
        Button {
        id: edit
        x: 374
        y: 385
        width: 132
        height: 60
        text: qsTr("edit")
        highlighted: false
        flat: false
        down: false
        checked: false
        autoRepeat: false
        autoExclusive: false
        hoverEnabled: false
        checkable: false
        activeFocusOnTab: true
        bottomPadding: 0.1
        onClicked: fileDialog.open();

        }
    }

    function openFile(fileUrl) {
        var request = new XMLHttpRequest
        request.open("GET", fileUrl, false)
        request.send(null)
        return request.responseText
        
    }
    FileDialog{
        id: fileDialog
        title: "Please choose the file"
        folder: shortcuts.home
        onAccepted: stimg.image = openFile(fileDialog.fileUrl)
    }
    
    Button {
        id: br
        x: 910
        y: 334
        text: qsTr("Button")
    }
    
    Label {
        id: daVinci3
        x: 51
        y: 414
        width: 132
        height: 24
        color: "#ffffff"
        text: qsTr("STUDENTS")
        font.family: "Tahoma"
        wrapMode: Text.WrapAnywhere
        topPadding: 0.2
        textFormat: Text.AutoText
        renderType: Text.NativeRendering
        fontSizeMode: Text.HorizontalFit
        elide: Text.ElideLeft
    }





}


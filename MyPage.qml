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
    id: myPage
    width: parent.width
    height: parent.height
    visible: true
    transformOrigin: Item.Center

    Rectangle {
        x: 0
        y: 0
        width: 413
        height: 330
        color: "#ffffff"
        radius: 0

        GridLayout {
            id: homePageLayout
            anchors.fill: parent
            width: parent.width
            height: parent.height
            rows: 3
            columns: 2

            Image {
                id: homePageAvatar
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.preferredHeight: 240
                Layout.preferredWidth: 240
                Layout.row: 1
                Layout.column: 1
                Layout.rowSpan: 3
                source: personServer.avatarFile
            }

            Label {
                id: firstNameLabel
                width: 100
                height: 25
                text: "<b>First Name: </b>" + personServer.lastName
                Layout.minimumHeight: 25
                Layout.minimumWidth: 150
                Layout.preferredHeight: 25
                Layout.preferredWidth: 150
                font.family: "Times New Roman"
                Layout.row: 1
                Layout.column: 2
            }

            Label {
                id: lastNameLabel
                height: 25
                text: "<b>Last Name</b>: " + personServer.lastName
                Layout.minimumWidth: 150
                Layout.minimumHeight: 25
                Layout.preferredWidth: 150
                Layout.preferredHeight: 25
                font.family: "Times New Roman"
                font.pixelSize: 12
                Layout.row: 2
                Layout.column: 2
            }

            Label {
                id: schoolLabel
                height: 25
                text: "<b>School: </b>" + personServer.school
                Layout.minimumWidth: 70
                Layout.minimumHeight: 25
                Layout.preferredWidth: 70
                Layout.preferredHeight: 25
                font.family: "Times New Roman"
                font.pixelSize: 12
                Layout.row: 3
                Layout.column: 2
            }
        }
    }

    ColumnLayout {
        x: 450
        y: 0
        width: 420
        height: 500

        Label {
            id: label
            Layout.preferredHeight: 30
            Layout.preferredWidth: 100
            Layout.row: 1
            text: qsTr("Borrowed Items")
            font.pointSize: 12
            font.family: "Times New Roman"
        }

        ListView {
            id: borrowedItemsList
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.preferredWidth: 410
            Layout.preferredHeight: 200
            Layout.row: 2
            Layout.rowSpan: 4
            Component {
                id: itemDelegate
                Rectangle {
                    height: 90
                    width: 200

                    Column {
                        property string fontName: "Times New Roman"
                        property int fontSize: 12
                        Text {
                            font.family: parent.fontName
                            font.pixelSize: parent.fontSize
                            text: "<b>itemID: </b>" + itemID
                        }
                        Text {
                            font.family: parent.fontName
                            font.pixelSize: parent.fontSize
                            text: "<b>Item name: </b>" + itemName
                        }
                        Text {
                            font.family: parent.fontName
                            font.pixelSize: parent.fontSize
                            text: "<b>Lab name: </b>" + labName
                        }
                    }
                }
            }

            delegate: itemDelegate

            model: borrowedItemsModel
        }
    }
}

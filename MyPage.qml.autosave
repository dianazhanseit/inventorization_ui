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
    width: 1360
    height: 720
    visible: true
    transformOrigin: Item.Center

    PersonInfoServer
    {
        id: personServer
        personID: loginInfo.personID
        password: loginInfo.personPassword
        Component.onCompleted: {
            avatarSmall.source = avatarFile
            fullNameLabel.text = firstName + " " + lastName
            schoolLabel.text = schoolLabel.text + school
            homePageAvatar.source = avatarFile
            firstNameLabel.text = firstNameLabel.text + firstName
            lastNameLabel.text = lastNameLabel.text + lastName
        }

        onBorrowedItemsChanged: {
            borrowedItemsModel.clear()
            for (var i = 0; i < borrowedItems.length; ++i)
            {
                borrowedItemsModel.append(borrowedItems[i])
            }
        }
    }

    ListModel {
        id: borrowedItemsModel
        ListElement {
            itemID: 12
            itemName: "flamethrower"
            labName: "swamp"
        }
    }

    Rectangle {
        x: 279
        y: 108
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

            //flow: GridLayout.LeftToRight
            Image {
                id: homePageAvatar
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.preferredHeight: 240
                Layout.preferredWidth: 240
                Layout.row: 1
                Layout.column: 1
                Layout.rowSpan: 3
            }

            Label {
                id: firstNameLabel
                width: 100
                height: 25
                text: "<b>First Name: </b>"
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
                text: "<b>Last Name</b>:  "
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
                text: "<b>School: </b>"
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

    ListView {
        id: borrowedItemsList
        x: 817
        y: 168
        width: 410
        height: 192

        Component {
            id: itemDelegate
            Rectangle {
                height: 90
                width: 200

                Column {
                    property string fontName: "Times New Roman"
                    property int fontSize: 12
                    Text {
                        font.family: fontName
                        font.pixelSize: fontSize
                        text: "<b>itemID: </b>" + itemID
                    }
                    Text {
                        font.family: fontName
                        font.pixelSize: fontSize
                        text: "<b>Item name: </b>" + itemName
                    }
                    Text {
                        font.family: fontName
                        font.pixelSize: fontSize
                        text: "<b>Lab name: </b>" + labName
                    }
                }
            }
        }

        delegate: itemDelegate /* Repeater {
            model: PersonInfoServer.borrowedItems
            Rectangle {
                height: 90
                width: 200

                Column {
                    Text {
                        text: "<b>itemID: </b>" + modelData[index]["itemID"]
                    }
                    Text {
                        text: "<b>Item name: </b>" + modelData[index]["itemName"]
                    }
                    Text {
                        text: "<b>Lab name: </b>" + modelData[index]["labName"]
                    }
                }
            }
        }*/

        model: borrowedItemsModel
    }

    Label {
        id: label
        x: 817
        y: 115
        text: qsTr("Borrowed Items")
        font.pointSize: 12
        font.family: "Times New Roman"
    }

    //    function openFile(fileUrl) {
    //        var request = new XMLHttpRequest
    //        request.open("GET", fileUrl, false)
    //        request.send(null)
    //        return request.responseText
    //    }
    //    FileDialog {
    //        id: fileDialog
    //        title: "Please choose the file"
    //        folder: shortcuts.home
    //        onAccepted: stimg.image = openFile(fileDialog.fileUrl)
    //    }

    //    Button {
    //        id: br
    //        x: 910
    //        y: 334
    //        text: qsTr("Button")
    //    }
}

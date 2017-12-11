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
    width: parent.width
    height: parent.height
    visible: true
    property int sidebarWidth: 235
    property int headerHeight: 80

    StackView {
        id: pageSpaceStack
        x: sidebarWidth
        y: headerHeight
        width: parent.width - x
        height: parent.height - y

        initialItem: findItems
    }

    Component {
        id: homePage
        MyPage {
        }
    }

    Component {
        id: findItems
        FindItemsPage {
        }
    }

    Rectangle {
        id: headerBar
        x: 0
        y: 0
        width: parent.width
        height: headerHeight
        color: "#2f475f"
        anchors.right: parent.right
        anchors.rightMargin: -6
        anchors.top: parent.top
        anchors.topMargin: 0
    }

    Rectangle {
        id: logoRect
        x: 0
        y: 0
        width: sidebarWidth
        height: headerHeight
        color: "#343b41"

        Label {
            id: logoText
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            color: "#ffffff"
            text: "<font color=\"#ffffff\">LAB</font> <font color=\"#64cc6b\">APPLICATION</font>"
            font.pixelSize: 24
        }
    }

    Rectangle {
        id: sideMenu
        x: 0
        y: headerHeight
        width: sidebarWidth
        height: parent.height - 75
        color: "#171918"
        ColumnLayout {
            anchors.top: parent.top
            width: parent.width
            height: 200

//            Rectangle {
//                id: homeRect
//                Layout.preferredWidth: sidebarWidth
//                Layout.preferredHeight: 105
//                color: "#4da194"

//                Image {
//                    id: avatarSmall
//                    x: 12
//                    y: 18
//                    width: 72
//                    height: 69
//                    source: Qt.resolvedUrl(personServer.avatarFile)

//                    property bool rounded: true
//                    property bool adapt: true

//                    layer.enabled: rounded
//                    layer.effect: OpacityMask {
//                        maskSource: Item {
//                            width: avatarSmall.width
//                            height: avatarSmall.height
//                            Rectangle {
//                                anchors.centerIn: parent
//                                width: avatarSmall.adapt ? avatarSmall.width : Math.min(
//                                                               avatarSmall.width,
//                                                               avatarSmall.height)
//                                height: avatarSmall.adapt ? avatarSmall.height : width
//                                radius: Math.min(width, height)
//                            }
//                        }
//                    }
//                }

//                Text {
//                    id: welcomeLabel
//                    x: 101
//                    y: 28
//                    width: 59
//                    height: 16
//                    color: "#171918"
//                    text: qsTr("Welcome")
//                    font.family: "Tahoma"
//                    font.pixelSize: 14
//                }

//                Label {
//                    id: fullNameLabel
//                    x: 101
//                    y: 56
//                    width: 80
//                    height: 19
//                    color: "#ffffff"
//                    text: personServer.firstName + ' ' + personServer.lastName
//                    font.family: "Tahoma"
//                    font.pixelSize: 16
//                }
//            }

            Rectangle {
                id: rfindItems
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
                    onClicked: pageSpaceStack.push(findItems)
                }

                Label {
                    id: daVinci
                    anchors.centerIn: parent
                    color: "#ffffff"
                    text: qsTr("FIND ITEMS")
                    elide: Text.ElideLeft
                    renderType: Text.NativeRendering
                    textFormat: Text.AutoText
                    wrapMode: Text.WrapAnywhere
                    topPadding: 0.2
                    fontSizeMode: Text.HorizontalFit
                    font.family: "Tahoma"
                }
            }
        }
    }

    PersonInfoServer {
        id: personServer
        personID: loginInfo.personID
        password: loginInfo.personPassword

        onBorrowedItemsChanged: {
            borrowedItemsModel.clear()
            for (var i = 0; i < borrowedItems.length; ++i) {
                borrowedItemsModel.append(borrowedItems[i])
            }
        }
    }

    ListModel {
        id: borrowedItemsModel
    }
}

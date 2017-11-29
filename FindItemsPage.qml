import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import com.searching 1.0

Item {
    id: findItemsPage
    width: parent.width
    height: parent.height

    ListModel {
        id: foundItemsModel

    }

    SearchServer {
        id: searchServer
        onSearchResultChanged: {
            foundItemsModel.clear()
            for (var i = 0; i < searchResult.length; ++i)
            {
                foundItemsModel.append(searchResult[i])
            }
        }
    }

    ColumnLayout {
        id: findItemsLayout
        anchors.fill: parent

        RowLayout {
            id: itemNameInputLayout
            width: 100
            height: 100

            TextInput {
                id: itemNameInput
                width: 200
                height: 35
                text: qsTr("")
                Layout.preferredHeight: 35
                Layout.preferredWidth: 200
                font.pixelSize: 12

            }
        }

        CheckBox {
            id: globalSearchBox
            text: qsTr("Global Search")
        }

        CheckBox {
            id: exactMatchBox
            text: qsTr("Exact Match")
        }

        Button {
            id: searchButton
            text: qsTr("search")
            Layout.preferredHeight: 35
            Layout.preferredWidth: 100
            onClicked: {
                searchServer.searchByName(personServer.labID, itemNameInput.text,
                                          exactMatchBox.checked, globalSearchBox.checked)
            }
        }

        ListView {
            id: listView
            x: 0
            y: 0
            Layout.preferredWidth: parent.width
            height: 160
            Layout.preferredHeight: 700
            model: foundItemsModel /*ListModel {
                ListElement {
                    name: "Grey"
                    colorCode: "grey"
                }

                ListElement {
                    name: "Red"
                    colorCode: "red"
                }

                ListElement {
                    name: "Blue"
                    colorCode: "blue"
                }

                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
            }*/
            delegate: Item {
                x: 5
                width: 80
                height: 40
                Row {
                    id: foundItemRow
                    Text {
                        text: "<b>ItemID: </b>" + itemID
                        font.pixelSize: 12
                    }
                    Text {
                        text: "<b>Item Name: </b>" + itemName
                        font.pixelSize: 12
                    }
                    Text {
                        text: "<b>Lab Name: </b>" + labName
                        font.pixelSize: 12
                    }
                    spacing: 10
                }
            }
        }
    }
}

import QtQuick 2.0

Rectangle {
    height: 90
    width: 200

    Column {
        Text {
            text: "<b>itemID: </b>" + itemID
        }
        Text {
            text: "<b>Item name: </b>" + itemName
        }
        Text {
            text: "<b>Lab name: </b>" + labName
        }
    }
}

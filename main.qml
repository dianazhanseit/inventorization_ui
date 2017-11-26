import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0



ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 1360
    height: 720
    title: qsTr("Lab Inventorization")

    StackView {
        id: stack
        initialItem: login
        anchors.fill: parent
    }

    Component
    {
        id: login
        LoginPage{}
    }

    Component
    {
        id: mypage
        MyPage{}
    }
    Component
    {
        id: daVinci
        DaVinci{}
    }
    Component
    {
        id: einstein
        EinsteinLab{}
    }
    Component
    {
        id: newton
        Newton{}
    }
}



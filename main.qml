import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import com.login.credits 1.0


ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 1360
    height: 720
    title: qsTr("Lab Inventorization")
    property string imageURL: "https://www.elastic.co/assets/bltada7771f270d08f6/enhanced-buzz-1492-1379411828-15.jpg"

    LoginInfo
    {
        id: loginInfo
    }

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



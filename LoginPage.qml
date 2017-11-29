import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

Item {
    id: loginPage
    visible: true
    width: 1360
    height: 720

    KeyNavigation.tab: personIDInput

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
            id: bgRect1
            x: 4
            y: 92
            width: 386
            height: 182
            color: "#ffffff"
        }
        Rectangle {
            id: bgRect2
            x: 4
            y: 181
            width: 386
            height: 182
            color: "#ffffff"
            radius: 15
        }

        Label {
            id: personIDLabel
            x: 80
            y: 140
            text: qsTr("personID")
            font.pointSize: 12
            font.family: "Times New Roman"
        }

        Label {
            id: signInStatus
            x: 97
            y: 101
            width: 200
            text: ""
            font.bold: true
            font.family: "Times New Roman"
            font.pixelSize: 16
        }

        Label {
            id: passwordLabel
            x: 78
            y: 215
            text: qsTr("password")
            font.pointSize: 12
            font.family: "Times New Roman"
        }

        TextInput {
            id: personIDInput

            x: 78
            y: 164
            width: 238
            height: 40
            color: "#000000"
            clip: false
            font.pixelSize: 18
            leftPadding: 5
            topPadding: 5
            horizontalAlignment: Text.AlignLeft
            inputMask: "99999999"
            inputMethodHints: Qt.ImhDigitsOnly

            KeyNavigation.tab: passwordInput
        }

        TextInput {
            id: passwordInput
            color: "grey"
            x: 78
            y: 239
            width: 238
            height: 40
            text: ""
            font.pointSize: 18
            leftPadding: 5
            topPadding: 5
            echoMode: TextInput.Password
            maximumLength: 24

            KeyNavigation.tab: signInButton
        }

        Button {
            id: signInButton
            x: 147
            y: 294
            text: qsTr("Sign in")
            checkable: false
            checked: true
            highlighted: true
            onClicked: {
                if (personIDInput.text.length == 0
                        && passwordInput.text.length == 0) {
                    signInStatus.text = "<font color=\"red\">Please fill all of the fields</font>"
                    return
                }

                loginInfo.submitLoginForm(personIDInput.text,
                                          passwordInput.text)
                if (loginInfo.isLoggedIn()) {
                    stack.push(compositePage)
                    return
                }
                signInStatus.text = "<font color=\"red\">UserID and/or password is incorrect</font>"
            }

            KeyNavigation.tab: personIDInput
        }
    }
}

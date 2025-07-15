// ForgotPasswordPage.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import WaterEq 1.0

Rectangle {
    id: forgotPage
    width: 640
    height: 480
    color: "#ffffff"
    radius: 15
    border.color: "#cccccc"
    border.width: 1

    signal backToLoginRequested

    WaterEq {
        id: waterEq
        onPasswordResetResult: (success, message) => {
            statusLabel.text = message
            if (success) {
                console.log("Password reset success, switching to login screen")
                timer.start()
            }
        }
    }

    Timer {
        id: timer
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            forgotPage.visible = false
            forgotPage.backToLoginRequested()
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Reset Password"
            font.pixelSize: 24
            color: "#d32f2f"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: usernameField
            width: 250
            placeholderText: "Enter Username"
        }

        Text {
            text: "Security Question: What is your lucky number?"
            font.pixelSize: 16
        }

        TextField {
            id: answerField
            width: 250
            placeholderText: "Enter your lucky number"
        }

        TextField {
            id: newPasswordField
            width: 250
            echoMode: TextInput.Password
            placeholderText: "Enter new password"
        }

        Label {
            id: statusLabel
            color: "red"
            font.pixelSize: 14
            text: ""
        }

        Row {
            spacing: 20
            Button {
                text: "Reset"
                onClicked: {
                    waterEq.resetPassword(
                        usernameField.text,
                        "What is your lucky number?",
                        answerField.text,
                        newPasswordField.text
                    )
                }
            }
            Button {
                text: "Back"
                onClicked: {


                    forgotPage.backToLoginRequested()  // ✅ Emit the signal to main.qml
                }
            }
        }
    }
}

import QtQuick 2.15
import QtQuick.Controls 2.15
import WaterEq 1.0

Rectangle {
    id: loginScreen
    width: 640
    height: 480
    color: "#fafafa"
    radius: 15
    border.color: "#d1d1d1"
    border.width: 1

    // Close Button (Cross)
    Row {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 10

        // Close Button (Cross)
        Rectangle {
            width: 30
            height: 30
            color: "#d32f2f"
            radius: 5
            border.color: "white"
            border.width: 2
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // Close the application
                    Qt.quit()
                }
            }
            Text {
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 18
                text: "X"
            }
        }
    }

    WaterEq {
        id: waterEq
        onCredentialsChecked: {  // Listen for the credentials check
            if (valid) {
                console.log("Login successful")
                loginPage.visible = false  // Hide the login page
                dashboardLoader.visible = true
                mainScreenLoader.visible = true
            } else {
                errorLabel.text = "Invalid credentials. Please try again."
                errorLabel.visible = true  // Show the error message
            }
        }
    }


    Column {
        anchors.centerIn: parent
        spacing: 25

        Text {
            text: "Login Matrix"
            font.pixelSize: 36
            font.bold: true
            color: "#d32f2f"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // Username label and text field in one row
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Username"
                font.pixelSize: 16
                color: "#333333"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: usernameField
                width: 200
                placeholderText: "Enter your username"
                font.pixelSize: 16
                padding: 10
                background: Rectangle {
                    color: "#ffffff"
                    radius: 8
                    border.color: "#d32f2f"
                    border.width: 1
                }
                focus: true
            }
        }

        // Password label and text field in one row
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Password"
                font.pixelSize: 16
                color: "#333333"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            TextField {
                id: passwordField
                width: 200
                echoMode: TextInput.Password
                placeholderText: "Enter your password"
                font.pixelSize: 16
                padding: 10
                background: Rectangle {
                    color: "#ffffff"
                    radius: 8
                    border.color: "#d32f2f"
                    border.width: 1
                }
            }
        }

        Label {
            id: errorLabel
            text: "Invalid credentials. Please try again."
            color: "red"
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 14
        }

        Button {
            text: "Sign-In"
            width: 200
            height: 50
            font.pixelSize: 18
            background: Rectangle {
                color: "#d32f2f"
                radius: 25
            }
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                // Emit the credentials to check in C++
                waterEq.checkCredentials(usernameField.text, passwordField.text)
            }
        }

        Text {
            text: "Forgot Password?"
            color: "#1976d2"
            font.pixelSize: 16
            font.underline: true
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    loginScreen.visible = false
                    forgotPageLoader.visible = true  // ✅ Make sure you set visible = true
                    forgotPageLoader.active = true
                }
            }
        }

    }
}

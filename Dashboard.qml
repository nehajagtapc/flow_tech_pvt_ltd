import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: dashboardRoot
    width: 2000
    height: 600
    color: "#ffffff"

    // Sidebar Navigation
    Rectangle {
        id: sidebar
        width: 300
        height: parent.height
        color: "#ecf0f1"

        // White highlight strip on the right side
        Rectangle {
            width: 4
            height: parent.height
            color: "white"
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
        }

        Column {
            anchors.fill: parent
            anchors.rightMargin: 4  // Leave space for the highlight
            spacing: 15
            padding: 15

            Text {
                text: "Dashboard"
                font.pixelSize: 24
                font.bold: true
                color: "#2c3e50"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                width: parent.width - 30
                height: 60
                color: "#34495e"
                radius: 8

                Text {
                    anchors.centerIn: parent
                    text: "Liquid Measurement"
                    color: "white"
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: screenLoader.source = "MainScreen.qml"
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }
            }

            Rectangle {
                width: parent.width - 30
                height: 60
                color: "#34495e"
                radius: 8

                Text {
                    anchors.centerIn: parent
                    text: "Gas Measurement"
                    color: "white"
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: screenLoader.source = "GasScreen.qml"
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }

    // Main Content Area
    Loader {
        id: screenLoader
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: sidebar.right
        source: "MainScreen.qml"
    }
}

import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: loadingScreen
    width: 640
    height: 480
    color: "#f0f0f0"

    Column {
        anchors.centerIn: parent
        spacing: 20

        // Loading Text
        Text {
            text: "Loading..."
            font.pixelSize: 24
            font.bold: true
            color: "#d32f2f"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // Animated Loader
        BusyIndicator {
            running: true
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

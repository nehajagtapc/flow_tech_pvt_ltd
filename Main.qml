import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    color: "#f0f0f0"
    visibility: Window.FullScreen

    Loader {
        id: loginPage
        source: "Loginpage.qml"
        anchors.fill: parent
        visible: true
    }

    Loader {
        id: dashboardLoader
        source: "Dashboard.qml"
        anchors.fill: parent
        visible: false  // Hide initially
    }
}

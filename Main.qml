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
        active: true
    }

    Loader {
        id: dashboardLoader
        source: "Dashboard.qml"
        anchors.fill: parent
        visible: false  // Hide initially
    }

    Loader {
           id: forgotPageLoader
           source: "ForgotPasswordPage.qml"
           anchors.fill: parent
           active: false
           visible: false

           onLoaded: {
               if (forgotPageLoader.item && forgotPageLoader.item.backToLoginRequested) {
                   forgotPageLoader.item.backToLoginRequested.connect(() => {
                       console.log("✅ backToLoginRequested signal received")

                       // Hide forgot page
                       forgotPageLoader.active = false
                       forgotPageLoader.visible = false
                       forgotPageLoader.source = "" // Optional: unload completely

                       // Reload login page cleanly
                       loginPage.source = ""  // Clear it
                       loginPage.source = "Loginpage.qml"  // Reload
                       loginPage.active = true
                       loginPage.visible = true

                       console.log("👋 Switched back to Login Page")
                   })
               } else {
                   console.warn("⚠ forgotPageLoader item or signal is missing!")
               }
           }
       }


}

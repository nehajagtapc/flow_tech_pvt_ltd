// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import QtQuick.Layouts 1.15
// import WE_Gas 1.0

// Page {
//     id: gasScreen
//     title: "Gas Measurement"

//     WE_Gas {
//         id: gasCalculator
//     }

//     ColumnLayout {
//         anchors.centerIn: parent
//         spacing: 20
//         width: parent.width * 0.6

//         Label {
//             text: "Flow-Tech Gas Measurement"
//             font.pixelSize: 24
//             font.bold: true
//             horizontalAlignment: Text.AlignHCenter
//             Layout.alignment: Qt.AlignHCenter
//         }

//         TextField {
//             id: gasDensityInput
//             placeholderText: "Enter Gas Density (kg/m³)"
//             font.pixelSize: 16
//             Layout.fillWidth: true
//             inputMethodHints: Qt.ImhFormattedNumbersOnly
//         }

//         TextField {
//             id: flowRateInput
//             placeholderText: "Enter Flow Rate (kg/hr)"
//             font.pixelSize: 16
//             Layout.fillWidth: true
//             inputMethodHints: Qt.ImhFormattedNumbersOnly
//         }

//         TextField {
//             id: pressureInput
//             placeholderText: "Enter Pressure P2 (bar)"
//             font.pixelSize: 16
//             Layout.fillWidth: true
//             inputMethodHints: Qt.ImhFormattedNumbersOnly
//         }

//         TextField {
//             id: temperatureInput
//             placeholderText: "Enter Temperature T2 (°C)"
//             font.pixelSize: 16
//             Layout.fillWidth: true
//             inputMethodHints: Qt.ImhFormattedNumbersOnly
//         }

//         Button {
//             text: "Calculate"
//             font.pixelSize: 16
//             Layout.alignment: Qt.AlignHCenter

//             onClicked: {
//                 const gasDen = parseFloat(gasDensityInput.text)
//                 const flowRate = parseFloat(flowRateInput.text)
//                 const p2 = parseFloat(pressureInput.text)
//                 const t2 = parseFloat(temperatureInput.text)

//                 if (!isNaN(gasDen) && !isNaN(flowRate) && !isNaN(p2) && !isNaN(t2)) {
//                     const kf = gasCalculator.findKF(p2, t2, gasDen)
//                     const we = gasCalculator.getWE(flowRate, kf, gasDen)
//                     resultLabel.text = `Water Equivalent (LPH): ${we.toFixed(2)}`
//                 } else {
//                     resultLabel.text = "Please enter valid numbers."
//                 }
//             }
//         }

//         Label {
//             id: resultLabel
//             text: "Water Equivalent (LPH):"
//             font.pixelSize: 18
//             color: "darkblue"
//             wrapMode: Text.WordWrap
//             horizontalAlignment: Text.AlignHCenter
//             Layout.alignment: Qt.AlignHCenter
//         }
//     }
// }
// import QtQuick 2.15
// import QtQuick.Controls 2.15
// import QtQuick.Layouts 1.15
// import WE_Gas 1.0

// Page {
//     id: gasScreen
//     title: "Gas Measurement"

//     Rectangle {
//         id: mainScreen
//         anchors.fill: parent
//         color: "#e0f7fa"

//         WE_Gas {
//             id: gasCalculator
//         }

//         Column {
//             spacing: 16
//             padding: 10
//             anchors.centerIn: parent

//             Text {
//                        text: "Flow-Tech"
//                        font.pixelSize: 36
//                        font.bold: true
//                        color: "#d32f2f"
//                        anchors.horizontalCenter: parent.horizontalCenter
//                    }

//             Image {
//                 source: "qrc:/images/flowtech_logo.png"
//                 width: 120
//                 height: 80
//                 anchors.horizontalCenter: parent.horizontalCenter
//             }

//             // Gas Density Row
//             RowLayout {
//                 Layout.fillWidth: true
//                 spacing: 15
//                 Label {
//                     text: "Enter Gas Density:"
//                     font.pixelSize: 16
//                     Layout.preferredWidth: 200
//                 }
//                 TextField {
//                     id: gasDensityInput
//                     placeholderText: "Enter Gas Density"
//                     Layout.preferredWidth: 300    // increased width here
//                     height: 40
//                     font.pixelSize: 18
//                     color: "black"
//                     placeholderTextColor: "#888"
//                     background: Rectangle {
//                         color: "white"
//                         border.color: "#ccc"
//                         border.width: 1
//                         radius: 5
//                     }
//                 }
//             }

//             // Flow Rate Row
//             RowLayout {
//                 Layout.fillWidth: true
//                 spacing: 15
//                 Label {
//                     text: "Enter Flow Rate:"
//                     font.pixelSize: 16
//                     Layout.preferredWidth: 200
//                 }
//                 TextField {
//                     id: flowRateInput
//                     placeholderText: "Enter Flow Rate"
//                     Layout.preferredWidth: 300      // kept as is or increase if you want
//                     height: 45
//                     font.pixelSize: 18
//                     color: "black"
//                     placeholderTextColor: "#888"
//                     background: Rectangle {
//                         color: "white"
//                         border.color: "#ccc"
//                         border.width: 1
//                         radius: 5
//                     }
//                 }
//             }

//             // Pressure Row
//             RowLayout {
//                 Layout.fillWidth: true
//                 spacing: 15
//                 Label {
//                     text: "Enter Operating Pressure:"
//                     font.pixelSize: 16
//                     Layout.preferredWidth: 200
//                 }
//                 TextField {
//                     id: pressureInput
//                     placeholderText: "Enter Operating Pressure"
//                     Layout.preferredWidth: 300        // increased width here
//                     height: 40
//                     font.pixelSize: 18
//                     color: "black"
//                     placeholderTextColor: "#888"
//                     background: Rectangle {
//                         color: "white"
//                         border.color: "#ccc"
//                         border.width: 1
//                         radius: 5
//                     }
//                 }
//             }

//             // Temperature Row
//             RowLayout {
//                 Layout.fillWidth: true
//                 spacing: 15
//                 Label {
//                     text: "Enter Operating Temperature:"
//                     font.pixelSize: 16
//                     Layout.preferredWidth: 200
//                 }
//                 TextField {
//                     id: temperatureInput
//                     placeholderText: "Enter Operating Temperature"
//                     Layout.preferredWidth: 300      // increased width here
//                     height: 40
//                     font.pixelSize: 18
//                     color: "black"
//                     placeholderTextColor: "#888"
//                     background: Rectangle {
//                         color: "white"
//                         border.color: "#ccc"
//                         border.width: 1
//                         radius: 5
//                     }
//                 }
//             }

//             // Calculate Button
//             // Buttons Row (Calculate and Refresh side-by-side)
//             Row {
//                 spacing: 30
//                 anchors.horizontalCenter: parent.horizontalCenter

//                 // Calculate Button
//                 Button {
//                     text: "Submit"
//                     font.pixelSize: 16
//                     width: 160
//                     height: 50

//                     background: Rectangle {
//                         color: "#4caf50"  // Green
//                         radius: 6
//                     }

//                     onClicked: {
//                         const gasDen = parseFloat(gasDensityInput.text)
//                         const flowRate = parseFloat(flowRateInput.text)
//                         const p2 = parseFloat(pressureInput.text)
//                         const t2 = parseFloat(temperatureInput.text)

//                         if (!isNaN(gasDen) && !isNaN(flowRate) && !isNaN(p2) && !isNaN(t2)) {
//                             const kf = gasCalculator.findKF(p2, t2, gasDen)
//                             const we = gasCalculator.getWE(flowRate, kf, gasDen)
//                             resultLabel.text = `Water Equivalent (LPH): ${we.toFixed(2)}`
//                             resultLabel.visible = true
//                         } else {
//                             resultLabel.text = "Please enter valid numbers."
//                             resultLabel.visible = true
//                         }
//                     }
//                 }

//                 // Refresh Button
//                 Button {
//                     text: "Refresh"
//                     font.pixelSize: 16
//                     width: 160
//                     height: 50

//                     background: Rectangle {
//                         color: "#d32f2f"  // Red
//                         radius: 6
//                     }

//                     onClicked: {
//                         gasDensityInput.text = ""
//                         flowRateInput.text = ""
//                         pressureInput.text = ""
//                         temperatureInput.text = ""
//                         resultLabel.text = "Water Equivalent (LPH):"
//                         resultLabel.visible = false
//                     }
//                 }
//             }

//             // Result Display
//             Label {
//                 id: resultLabel
//                 text: "Water Equivalent (LPH)"
//                 font.pixelSize: 18
//                 color: "darkblue"
//                 wrapMode: Text.WordWrap
//                 anchors.horizontalCenter: parent.horizontalCenter
//                 Layout.alignment: Qt.AlignHCenter
//                 visible: false   // Initially hidden
//             }
//         }

//         // Close Button (red square)
//         Rectangle {
//             width: 30
//             height: 30
//             color: "#d32f2f"
//             radius: 5
//             border.color: "white"
//             border.width: 2
//             anchors.top: parent.top
//             anchors.right: parent.right
//             anchors.margins: 10
//             MouseArea {
//                 anchors.fill: parent
//                 onClicked: Qt.quit()
//             }
//             Text {
//                 anchors.centerIn: parent
//                 color: "white"
//                 font.pixelSize: 18
//                 text: "X"
//             }
//         }
//     }
// }

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import WE_Gas 1.0

Page {
    id: gasScreen
    title: "Gas Measurement"

    property double float_density : 0.0

    Rectangle {
        id: mainScreen
        anchors.fill: parent
        color: "#e0f7fa"

        WE_Gas {
            id: gasCalculator
        }

        Column {
            spacing: 16
            padding: 10
            anchors.centerIn: parent

            Text {
                text: "Flow-Tech"
                font.pixelSize: 36
                font.bold: true
                color: "#d32f2f"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image {
                source: "qrc:/images/flowtech_logo.png"
                width: 120
                height: 80
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // Gas Density Row
            // Gas Density Row
            RowLayout {
                Layout.fillWidth: true
                spacing: 15

                Label {
                    text: "Gas Density:"
                    font.pixelSize: 16
                    Layout.preferredWidth: 200
                }

                TextField {
                    id: gasDensityInput
                    placeholderText: "Enter Gas Density"
                    Layout.preferredWidth: 300
                    height: 40
                    font.pixelSize: 18
                    color: "black"
                    placeholderTextColor: "#888"
                    background: Rectangle {
                        color: "white"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 5
                    }
                }

                ComboBox {
                    id: densityUnitSelector
                    Layout.preferredWidth: 100
                    height: 40
                    font.pixelSize: 16
                    model: ["kg/m³"]
                }
            }





            // Pressure Row
            RowLayout {
                Layout.fillWidth: true
                spacing: 15
                Label {
                    text: "Operating Pressure:"
                    font.pixelSize: 16
                    Layout.preferredWidth: 200
                }
                TextField {
                    id: pressureInput
                    placeholderText: "Enter Operating Pressure"
                    Layout.preferredWidth: 300
                    height: 40
                    font.pixelSize: 18
                    color: "black"
                    placeholderTextColor: "#888"
                    background: Rectangle {
                        color: "white"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 5
                    }
                }
                ComboBox {
                    id: pressureUnitSelector
                    Layout.preferredWidth: 100
                    height: 40
                    font.pixelSize: 16
                    model: ["kg/cm²"]
                }
            }

            // Temperature Row
            RowLayout {
                Layout.fillWidth: true
                spacing: 15
                Label {
                    text: "Operating Temperature:"
                    font.pixelSize: 16
                    Layout.preferredWidth: 200
                }
                TextField {
                    id: temperatureInput
                    placeholderText: "Enter Operating Temperature"
                    Layout.preferredWidth: 300
                    height: 40
                    font.pixelSize: 18
                    color: "black"
                    placeholderTextColor: "#888"
                    background: Rectangle {
                        color: "white"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 5
                    }
                }
                ComboBox {
                    id: temperatureUnitSelector
                    Layout.preferredWidth: 100
                    height: 40
                    font.pixelSize: 16
                    model: ["°C"]
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 15

                Label {
                    text: "Line Size:"
                    font.pixelSize: 16
                    Layout.preferredWidth: 200
                }

                TextField {
                    id: lineSizeInput
                    placeholderText: "Enter Line Size"
                    Layout.preferredWidth: 300
                    height: 40
                    font.pixelSize: 18
                    color: "black"
                    placeholderTextColor: "#888"
                    background: Rectangle {
                        color: "white"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 5
                    }
                }

                ComboBox {
                    id: lineSizeUnitSelector
                    Layout.preferredWidth: 100
                    height: 40
                    font.pixelSize: 16
                    model: ["mm"]
                }
            }


            RowLayout {
                Layout.fillWidth: true
                spacing: 15

                Label {
                    text: "Maximum Flow Rate:"
                    font.pixelSize: 16
                    Layout.preferredWidth: 200
                }

                TextField {
                    id: flowRateInput
                    placeholderText: "Enter Maximum Flow Rate"
                    Layout.preferredWidth: 300
                    height: 45
                    font.pixelSize: 18
                    color: "black"
                    placeholderTextColor: "#888"
                    background: Rectangle {
                        color: "white"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 5
                    }
                }

                ComboBox {
                    id: unitSelector
                    Layout.preferredWidth: 104
                    height: 45
                    font.pixelSize: 16
                    model: ["kg/hr", "m³/hr", "Nm³/hr","CFH"]
                }
            }


/////////////////////////////////////////////////////////////////////newly added for the material selection
            // Material Selection
            Row {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Label {
                    text: "Float Material:"
                    font.pixelSize: 16
                    color: "black"
                    anchors.verticalCenter: float_material.verticalCenter
                    width: 180
                }

                ComboBox {
                    id: float_material
                    model: ["SS-316", "SS-304", "PTFE(Teflon)", "Aluminium", "Loaded Teflon"]
                    width: 250
                    height: 40
                    font.pixelSize: 16

                    onCurrentTextChanged: {
                        console.log("Selected Material:", currentText);
                        if (currentText === "Loaded Teflon") {
                            // For Loaded Teflon, weights must be entered manually
                            float_density = 0;
                        } else {
                            // Use preset densities
                            if (currentText === "SS-316") {
                                float_density = 8.02;
                            } else if (currentText === "SS-304") {
                                float_density = 7.9;
                            } else if (currentText === "PTFE(Teflon)") {
                                float_density = 2.55;
                            } else if (currentText === "Aluminium") {
                                float_density = 2.21;
                            }
                        }
                        console.log("Updated Float Density:", float_density);
                    }
                }
            }

            // Weight of Float
            Row {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                visible: float_material.currentText === "Loaded Teflon"

                Label {
                    text: "Weight of Float:"
                    font.pixelSize: 16
                    color: "black"
                    verticalAlignment: Text.AlignVCenter
                    width: 180
                }

                TextField {
                    id: weightOfFloatInput
                    placeholderText: "Enter weight of float"
                    width: 250
                    height: 40
                    font.pixelSize: 18
                    color: "black"
                    placeholderTextColor: "#888"
                    background: Rectangle {
                        color: "white"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 5
                    }
                }

                ComboBox {
                    id: unit_flow_weight
                    model: ["grams"]
                    width: 80
                    height: 40
                    font.pixelSize: 16
                    anchors.verticalCenter: weightOfFloatInput.verticalCenter
                }
            }

            // Weight of Water
            Row {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                visible: float_material.currentText === "Loaded Teflon"

                Label {
                    text: "Weight of Water:"
                    font.pixelSize: 16
                    color: "black"
                    verticalAlignment: Text.AlignVCenter
                    width: 180
                }

                TextField {
                    id: weightOfWaterInput
                    placeholderText: "Enter weight of water"
                    width: 250
                    height: 40
                    font.pixelSize: 18
                    color: "black"
                    placeholderTextColor: "#888"
                    background: Rectangle {
                        color: "white"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 5
                    }
                }

                ComboBox {
                    id: unit_flow_water
                    model: ["grams"]
                    width: 80
                    height: 40
                    font.pixelSize: 16
                    anchors.verticalCenter: weightOfWaterInput.verticalCenter
                }
            }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

            // Buttons Row (Calculate and Refresh side-by-side)
            Row {
                spacing: 30
                anchors.horizontalCenter: parent.horizontalCenter

                // Submit Button
                Button {
                    text: "Submit"
                    font.pixelSize: 16
                    width: 160
                    height: 50

                    background: Rectangle {
                        color: "#4CAF50"
                        radius: 6
                    }

                    onClicked: {
                        const gasDen = parseFloat(gasDensityInput.text)
                        const flowRate = parseFloat(flowRateInput.text)
                        const p2 = parseFloat(pressureInput.text)
                        const t2 = parseFloat(temperatureInput.text)
                        const unit = unitSelector.currentText

                        if (!isNaN(gasDen) && !isNaN(flowRate) && !isNaN(p2) && !isNaN(t2)) {
                            const kf = gasCalculator.findKF(p2, t2, gasDen)
                            let we = 0

                            if (unit === "kg/hr") {
                                we = gasCalculator.getWE(flowRate, kf, gasDen)
                            } else if (unit === "m³/hr") {
                                we = gasCalculator.getWEFromCubicMeter(flowRate, kf)
                            } else if (unit === "Nm³/hr") {
                                we = gasCalculator.getWEFromNormalCubicMeter(flowRate, kf)
                            }else if (unit === "CFH") {
                               we = gasCalculator.getWEFromCFH(flowRate, kf)
                            }

                            resultLabel.text = `Water Equivalent (LPH): ${we.toFixed(2)}`
                            resultLabel.visible = true
                            tubeBodyLabel.text = gasCalculator.getTubeBodyInfo(we, float_material.currentText)
                        } else {
                            resultLabel.text = "Please enter valid numbers."
                            resultLabel.visible = true
                            tubeBodyLabel.text = ""
                        }
                    }
                }

                // Refresh Button
                Button {
                    text: "Refresh"
                    font.pixelSize: 16
                    width: 160
                    height: 50

                    background: Rectangle {
                        color: "#f44336"
                        radius: 6
                    }

                    onClicked: {
                        gasDensityInput.text = ""
                        flowRateInput.text = ""
                        pressureInput.text = ""
                        temperatureInput.text = ""
                        unitSelector.currentIndex = 0
                        resultLabel.text = "Water Equivalent (LPH):"
                        resultLabel.visible = false
                    }
                }
            }

            // Result Display
            Label {
                id: resultLabel
                text: "Water Equivalent (LPH)"
                font.pixelSize: 18
                color: "darkblue"
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.alignment: Qt.AlignHCenter
                visible: false
            }
            Text {
                id: tubeBodyLabel
                text: ""
                color: "black"
                font.pixelSize: 16
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.Wrap
                visible: true
            }
        }

        // Close Button
        Rectangle {
            width: 30
            height: 30
            color: "#d32f2f"
            radius: 5
            border.color: "white"
            border.width: 2
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 10
            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()
            }
            Text {
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 18
                text: "X"
            }
        }
    }
}

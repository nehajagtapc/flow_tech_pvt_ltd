import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import WE_Gas 1.0

Page {
    id: gasScreen
    title: "Gas Measurement"

    WE_Gas {
        id: gasCalculator
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20
        width: parent.width * 0.6

        Label {
            text: "Flow-Tech Gas Measurement"
            font.pixelSize: 24
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: gasDensityInput
            placeholderText: "Enter Gas Density (kg/m³)"
            font.pixelSize: 16
            Layout.fillWidth: true
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }

        TextField {
            id: flowRateInput
            placeholderText: "Enter Flow Rate (kg/hr)"
            font.pixelSize: 16
            Layout.fillWidth: true
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }

        TextField {
            id: pressureInput
            placeholderText: "Enter Pressure P2 (bar)"
            font.pixelSize: 16
            Layout.fillWidth: true
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }

        TextField {
            id: temperatureInput
            placeholderText: "Enter Temperature T2 (°C)"
            font.pixelSize: 16
            Layout.fillWidth: true
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }

        Button {
            text: "Calculate"
            font.pixelSize: 16
            Layout.alignment: Qt.AlignHCenter

            onClicked: {
                const gasDen = parseFloat(gasDensityInput.text)
                const flowRate = parseFloat(flowRateInput.text)
                const p2 = parseFloat(pressureInput.text)
                const t2 = parseFloat(temperatureInput.text)

                if (!isNaN(gasDen) && !isNaN(flowRate) && !isNaN(p2) && !isNaN(t2)) {
                    const kf = gasCalculator.findKF(p2, t2, gasDen)
                    const we = gasCalculator.getWE(flowRate, kf, gasDen)
                    resultLabel.text = `Water Equivalent (LPH): ${we.toFixed(2)}`
                } else {
                    resultLabel.text = "Please enter valid numbers."
                }
            }
        }

        Label {
            id: resultLabel
            text: "Water Equivalent (LPH):"
            font.pixelSize: 18
            color: "darkblue"
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }
    }
}

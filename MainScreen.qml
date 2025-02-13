import QtQuick 2.15
import QtQuick.Controls 2.15
import WaterEq 1.0

Rectangle {
    id: mainScreen
    width: 640
    height: 480
    color: "#f0f0f0"

    property double float_density : 0.0

    WaterEq {
        id: waterEqInstance
    }

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
    Column {
        spacing: 16
        padding: 20
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

        // Operating Pressure
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: "Operating Pressure:"
                font.pixelSize: 16
                color: "#555"
                anchors.verticalCenter: operatingPressureInput.verticalCenter
                width: 180
            }

            TextField {
                id: operatingPressureInput
                placeholderText: "Enter operating pressure"
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

            ComboBox
            {
                model : ["kg/cm2","psi","bar","mmHg"]
                anchors.verticalCenter: operatingPressureInput.verticalCenter
            }
        }

        // Operating Temperature
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: "Operating Temperature:"
                font.pixelSize: 16
                color: "#555"
                anchors.verticalCenter: opTempInput.verticalCenter
                width: 180
            }

            TextField {
                id: opTempInput
                placeholderText: "Enter operating temperature"
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

            ComboBox
            {
                model : ["°C","K","°F"]
                anchors.verticalCenter: opTempInput.verticalCenter
            }
        }

        // Viscosity
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: "Viscosity of Liquid:"
                font.pixelSize: 16
                color: "#555"
                anchors.verticalCenter: viscosityInput.verticalCenter
                width: 180
            }

            TextField {
                id: viscosityInput
                placeholderText: "Enter viscosity"
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

            ComboBox
            {
                model : ["cP"]
                anchors.verticalCenter: viscosityInput.verticalCenter
            }
        }

        // Line Size
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: "Line Size:"
                font.pixelSize: 16
                color: "#555"
                anchors.verticalCenter: lineSizeInput.verticalCenter
                width: 180
            }

            TextField {
                id: lineSizeInput
                placeholderText: "Enter line size"
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

            ComboBox
            {
                model : ["mm","inch"]
                anchors.verticalCenter: lineSizeInput.verticalCenter
            }
        }

        // Liquid Density
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: "Liquid Density:"
                font.pixelSize: 16
                color: "#555"
       anchors.verticalCenter: densityLiquidInput.verticalCenter
                width: 180
            }

            TextField {
                id: densityLiquidInput
                placeholderText: "Enter liquid density"
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

            ComboBox
            {
                id : density_unit
                model : ["kg/m^3","gram/cc"]
                anchors.verticalCenter: densityLiquidInput.verticalCenter
            }
        }

        // Maximum Flow
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: "Maximum Flow:"
                font.pixelSize: 16
                color: "#555"
                anchors.verticalCenter: maxFlowInput.verticalCenter
                width: 180
            }

            TextField {
                id: maxFlowInput
                placeholderText: "Enter max flow"
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

            ComboBox
            {
                id : maxFlowUnit
                model : ["LPH","m3/Hr","Kg/Hr"]
                anchors.verticalCenter: maxFlowInput.verticalCenter
            }
        }



        // Material Selection
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                text: "Float Material:"
                font.pixelSize: 16
                color: "#555"
                anchors.verticalCenter : float_material.verticalCenter
                width: 180
            }

            ComboBox {
                id: float_material
                model: ["SS-316", "SS-304", "PTFE(Teflon)", "Aluminium", "Loaded Teflon"]
                displayText: currentText
                width: 250
                height: 40
                onCurrentTextChanged: {
                    if (currentText === "Loaded Teflon") {
                        weightOfFloatInput.visible = true;
                        weightOfWaterInput.visible = true;
                    } else {
                        float_density = currentText === "SS-316" || currentText === "SS-304" ? 8.02
                                      : currentText === "PTFE(Teflon)" ? 2.55
                                      : 2.21; // Aluminium
                        weightOfFloatInput.visible = false;
                        weightOfWaterInput.visible = false;
                    }
                }
            }
        }

        // Weight of Float
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            visible: float_material.currentText === "Loaded Teflon" // Updated binding

            Label {
                text: "Weight of Float:"
                font.pixelSize: 16
                color: "#555"
                verticalAlignment: Text.AlignVCenter
                width: 180
            }

            TextField {
                id: weightOfFloatInput
                // visible: false
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

            ComboBox
            {
                id : unit_flow_weight
                model : ["grams"]
                anchors.verticalCenter: weightOfFloatInput.verticalCenter
            }
        }

        // Weight of Water
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter            
            visible: float_material.currentText === "Loaded Teflon" // Updated binding


            Label {
                text: "Weight of Water:"
                font.pixelSize: 16
                color: "#555"
                verticalAlignment: Text.AlignVCenter
                width: 180
            }

            TextField {
                id: weightOfWaterInput
                // visible: false
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

            ComboBox
            {
                id : unit_flow_water
                model : ["grams"]
                anchors.verticalCenter: weightOfWaterInput.verticalCenter
            }
        }

        // Submit Button
        // Submit and Refresh Buttons
        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20

            // Submit Button
            Button {
                id: calculateButton
                width: 200
                height: 50
                background: Rectangle {
                    color: "#4CAF50"
                    radius: 8
                }
                contentItem: Text {
                    text: "Submit"
                    color: "white"
                    font.pixelSize: 18
                    anchors.centerIn: calculateButton
                }
                onClicked: {
                    if (float_material.currentText === "Loaded Teflon") {
                        if (maxFlowInput.text === "" || densityLiquidInput.text === "" ||
                            weightOfWaterInput.text === "" || weightOfFloatInput.text === "") {
                            resultLabel.text = "All fields are required!";
                        } else {

                            if(density_unit.currentText == "gram/cc")
                            {
                                if(maxFlowUnit.currentText == "Kg/Hr")
                                {
                                    float_density = waterEqInstance.getfloatDensity(parseFloat(weightOfFloatInput.text), parseFloat(weightOfWaterInput.text));
                                    var result = waterEqInstance.getWaterEq(parseFloat(maxFlowInput.text), (parseFloat(densityLiquidInput.text)/1000), float_density);
                                    resultLabel.text = "Water Equivalent: " + result.toFixed(6);
                                }

                                else if(maxFlowUnit.currentText == "m3/Hr")
                                {
                                    float_density = waterEqInstance.getfloatDensity(parseFloat(weightOfFloatInput.text), parseFloat(weightOfWaterInput.text));
                                    var result = waterEqInstance.getWaterEq((parseFloat(maxFlowInput.text)*1000), (parseFloat(densityLiquidInput.text)/1000), float_density);
                                    resultLabel.text = "Water Equivalent: " + result.toFixed(6);
                                }

                                else
                                {
                                    float_density = waterEqInstance.getfloatDensity(parseFloat(weightOfFloatInput.text), parseFloat(weightOfWaterInput.text));
                                    var result = waterEqInstance.getWaterEq(parseFloat(maxFlowInput.text), (parseFloat(densityLiquidInput.text)/1000), float_density);
                                    resultLabel.text = "Water Equivalent: " + result.toFixed(6);
                                }


                            }

                            else
                            {
                                if(maxFlowUnit.currentText == "Kg/Hr")
                                {
                                    float_density = waterEqInstance.getfloatDensity(parseFloat(weightOfFloatInput.text), parseFloat(weightOfWaterInput.text));
                                    var result = waterEqInstance.getWaterEq(parseFloat(maxFlowInput.text), parseFloat(densityLiquidInput.text), float_density);
                                    resultLabel.text = "Water Equivalent: " + result.toFixed(6);
                                }

                                else if(maxFlowUnit.currentText == "m3/Hr")
                                {
                                    float_density = waterEqInstance.getfloatDensity(parseFloat(weightOfFloatInput.text), parseFloat(weightOfWaterInput.text));
                                    var result = waterEqInstance.getWaterEq((parseFloat(maxFlowInput.text)*1000), parseFloat(densityLiquidInput.text), float_density);
                                    console.log("Here");
                                    resultLabel.text = "Water Equivalent: " + result.toFixed(6);
                                }

                                else
                                {
                                    float_density = waterEqInstance.getfloatDensity(parseFloat(weightOfFloatInput.text), parseFloat(weightOfWaterInput.text));
                                    var result = waterEqInstance.getWaterEq(parseFloat(maxFlowInput.text), parseFloat(densityLiquidInput.text), float_density);
                                    resultLabel.text = "Water Equivalent: " + result.toFixed(6);
                                }
                            }


                        }
                    } else {
                        if (maxFlowInput.text === "" || densityLiquidInput.text === "") {
                            resultLabel.text = "All fields are required!";
                        } else {

                            if(maxFlowUnit.currentText == "Kg/Hr")
                            {
                                var result = waterEqInstance.getWaterEq(parseFloat(maxFlowInput.text)*parseFloat(densityLiquidInput.text), parseFloat(densityLiquidInput.text), float_density);
                                resultLabel.text = "Water Equivalent: " + result.toFixed(6);
                            }

                            else if(maxFlowUnit.currentText == "m3/Hr")
                            {
                                var result = waterEqInstance.getWaterEq(parseFloat(maxFlowInput.text)*1000, parseFloat(densityLiquidInput.text), float_density);
                                resultLabel.text = "Water Equivalent: " + result.toFixed(6);
                            }

                            else
                            {
                                var result = waterEqInstance.getWaterEq(parseFloat(maxFlowInput.text), parseFloat(densityLiquidInput.text), float_density);
                                resultLabel.text = "Water Equivalent: " + result.toFixed(6);
                            }

                        }
                    }
                }
            }

            // Refresh Button
            Button {
                id: refreshButton
                width: 200
                height: 50
                background: Rectangle {
                    color: "#f44336"
                    radius: 8
                }
                contentItem: Text {
                    text: "Refresh"
                    color: "white"
                    font.pixelSize: 18
                    anchors.centerIn: refreshButton
                }
                onClicked: {
                    // Reset all TextField values
                    operatingPressureInput.text = "";
                    opTempInput.text = "";
                    viscosityInput.text = "";
                    lineSizeInput.text = "";
                    maxFlowInput.text = "";
                    densityLiquidInput.text = "";
                    weightOfFloatInput.text = "";
                    weightOfWaterInput.text = "";

                    // Reset ComboBox selection
                    float_material.currentIndex = -1; // No selection
                    float_density = 0.0;

                    // Reset visibility of float-specific fields
                    weightOfFloatInput.visible = false;
                    weightOfWaterInput.visible = false;

                    // Reset the result label
                    resultLabel.text = "";
                }
            }
        }


        // Result Label
        Label {
            id: resultLabel
            font.pixelSize: 18
            color: "#555"
            padding: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}

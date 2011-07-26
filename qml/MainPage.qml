import QtQuick 1.1
import com.meego 1.0

Page {
    id: mainPage
    tools: commonTools

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        spacing: 5

        Label {
            text: qsTr("Focal length:") + " " + focalSlider.value + " mm"
        }

        Slider {
            id: focalSlider
            minimumValue: 1
            maximumValue: 300
            stepSize: 1
            value: 35
        }

        Label {
            text: qsTr("Aperture:") + " f/" + (apertureSlider.value / 10)
        }

        Slider {
            id: apertureSlider
            minimumValue: 1
            maximumValue: 320
            stepSize: 1
            value: 28
        }

        Label {
            text: qsTr("Distance:") + " " + (distanceSlider.value / 100) + " m"
        }

        Slider {
            id: distanceSlider
            minimumValue: 10
            maximumValue: 10000
            stepSize: 10
            value: 10
        }

        Label {
            text: qsTr("Hyperfocal distance:") + " " + (Math.round(value / 100) / 10) + " m"
            id: hyperFocal
            property int value: (((focalSlider.value * focalSlider.value) / (0.020 * apertureSlider.value / 10)) + focalSlider.value)
        }

    }

    ListModel {
        id: focalModel
        ListElement { name: "15 mm" }
        ListElement { name: "35 mm" }
        ListElement { name: "50 mm" }
    }

    SelectionDialog {
        id: focalSelectionDialog
        titleText: "Focal length"
        selectedIndex: 1
        model: focalModel
    }
}

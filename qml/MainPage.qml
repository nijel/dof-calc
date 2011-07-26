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
            text: qsTr("Distance:") + " " + (distanceSlider.value / 1000) + " m"
        }

        Slider {
            id: distanceSlider
            minimumValue: 100
            maximumValue: 100000
            stepSize: 100
            value: 1000
        }

        Label {
            text: qsTr("Hyperfocal distance:") + " " + (Math.round(value / 100) / 10) + " m"
            id: hyperFocal
            property int value: (((focalSlider.value * focalSlider.value) / (0.020 * apertureSlider.value / 10)) + focalSlider.value)
        }

        Label {
            text: qsTr("Depth of field:")
        }

        Label {
            text: "  " + qsTr("Near limit:") + " " + (Math.round(value / 100) / 10) + " m"
            id: nearLimit
            property int value:  ((hyperFocal.value - focalSlider.value) * distanceSlider.value) / (hyperFocal.value + distanceSlider.value - (2 * focalSlider.value));
        }

        Label {
            text: "  " + qsTr("Far limit:") + " " + (value >= 10000000 ? qsTr("infinity") : (Math.round(value / 100) / 10) + " m")
            id: farLimit
            property int value: (hyperFocal.value - distanceSlider.value <= 0) ? 10000000 : (((hyperFocal.value - focalSlider.value) * distanceSlider.value) / (hyperFocal.value - distanceSlider.value));
        }

        Label {
            text: "  " + qsTr("Total:") + " " + (farLimit.value >= 10000000 ? qsTr("infinite") : (Math.round((farLimit.value - nearLimit.value) / 100) / 10) + " m")
            id: dofTotal
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

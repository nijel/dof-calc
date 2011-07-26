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
            text: qsTr("Focal length:")
        }

        Button {
            id: focal
            text: selected
            onClicked: focalSelectionDialog.open()
            property string selected: focalSelectionDialog.selected
            property int value: focalSelectionDialog.value

        }

        Label {
            text: qsTr("Aperture:")
        }

        Button {
            id: aperture
            text: selected
            onClicked: apertureSelectionDialog.open()
            property string selected: apertureSelectionDialog.selected
            property double value: apertureSelectionDialog.value
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
            property int value: (((focal.value * focal.value) / (0.020 * aperture.value)) + focal.value)
        }

        Label {
            text: qsTr("Depth of field:")
        }

        Label {
            text: "  " + qsTr("Near limit:") + " " + (Math.round(value / 100) / 10) + " m"
            id: nearLimit
            property int value:  ((hyperFocal.value - focal.value) * distanceSlider.value) / (hyperFocal.value + distanceSlider.value - (2 * focal.value));
        }

        Label {
            text: "  " + qsTr("Far limit:") + " " + (value >= 10000000 ? qsTr("infinity") : (Math.round(value / 100) / 10) + " m")
            id: farLimit
            property int value: (hyperFocal.value - distanceSlider.value <= 0) ? 10000000 : (((hyperFocal.value - focal.value) * distanceSlider.value) / (hyperFocal.value - distanceSlider.value));
        }

        Label {
            text: "  " + qsTr("Total:") + " " + (farLimit.value >= 10000000 ? qsTr("infinite") : (Math.round((farLimit.value - nearLimit.value) / 100) / 10) + " m")
            id: dofTotal
        }
    }

    FocalSelection {
        id: focalSelectionDialog
    }

    ApertureSelection {
        id: apertureSelectionDialog
    }
}

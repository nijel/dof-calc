import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: mainPage
    tools: commonTools

    Grid {
        columns: screen.currentOrientation == Screen.Landscape || screen.currentOrientation == Screen.LandscapeInverted ? 2 : 1
        anchors.margins: 10
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        spacing: 10

        Column {
            id: inputColumn

            spacing: 5

            Label {
                text: qsTr("Camera:")
            }

            Button {
                id: camera
                text: selected
                onClicked: cameraSelectionDialog.open()
                property string selected: cameraSelectionDialog.selected
                property double value: cameraSelectionDialog.value

            }

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
                value: 10000
            }

        }

        Column {

            spacing: 25
            id: displayColumn

            Label {
                text: qsTr("Hyperfocal distance:") + " " + (Math.round(value / 100) / 10) + " m"
                id: hyperFocal
                property int value: (((focal.value * focal.value) / (camera.value * aperture.value)) + focal.value)
            }

            Label {
                text: qsTr("Circle of confusion:") + " " + camera.value + " mm"
            }

            Column {
                spacing: 5


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

            Column {
                spacing: 5

                Label {
                    text: "  " + qsTr("In front of subject:") + " " + (Math.round((distanceSlider.value - nearLimit.value) / 100) / 10) + " m"
                }

                Label {
                    text: "  " + qsTr("Behind subject:") + " " + (farLimit.value >= 10000000 ? qsTr("infinite") : (Math.round((farLimit.value - distanceSlider.value) / 100) / 10) + " m")
                }
            }
        }
    }

    FocalSelection {
        id: focalSelectionDialog
    }

    ApertureSelection {
        id: apertureSelectionDialog
    }

    CameraSelection {
        id: cameraSelectionDialog
    }
}

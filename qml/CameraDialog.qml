import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.0

 Dialog {
    id: cameraDialog
    title: Item {
        id: titleField
        height: 40
        width: parent.width
        Label {
            font.pixelSize: 38
            anchors.centerIn: parent
            text: qsTr("Add new camera")
        }
    }

    content:Item {
        id: contentField
        height: 170
        width: parent.width
        Column {
            spacing: 5
            anchors.centerIn: parent
            Label {
                text: qsTr("Name:")
            }
            TextField {
                id: nameInput
            }
            Label {
                text: qsTr("Circle of confusion:")
            }
            TextField {
                id: cocInput
                text: "0.020"
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                errorHighlight: !acceptableInput
                validator: DoubleValidator {
                    bottom: 0
                    top: 1
                    decimals: 5
                    notation: DoubleValidator.StandardNotation
                }
            }
        }
    }

    buttons: Row {
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        ListButton {
            text: qsTr("Add");
            onClicked: if (cocInput.acceptableInput) cameraDialog.accept();
        }
        ListButton {
            text: qsTr("Cancel");
            onClicked: cameraDialog.close()
        }
    }

    onAccepted: cameraModel.addCamera(nameInput.text, parseFloat(cocInput.text))

}

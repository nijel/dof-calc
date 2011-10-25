import QtQuick 1.1
import com.nokia.meego 1.0

 Dialog {
    id: cameraDialog
    title: Item {
        id: titleField
        height: 40
        width: parent.width
        Label {
            font.pixelSize: 38
            anchors.centerIn: parent
            text: qtStr("Add new camera")
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
            TextInput {
                id: nameInput
            }
            Label {
                text: qsTr("Circle of confusion:")
            }
            TextInput {
                id: cocInput
            }
        }
    }

    buttons: Row {
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        ListButton {
            text: qsTr("Add");
            onClicked: cameraDialog.accept()
        }
        ListButton {
            text: qsTr("Cancel");
            onClicked: cameraDialog.close()
        }
    }
}

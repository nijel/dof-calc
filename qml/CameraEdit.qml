import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1
Page {
    tools: commonTools

    Component {
        id: listDelegate
        Item {
            width: cameraList.width
            height: 55
            clip: true

            Label {
                text: name
                width: cameraList.width - 60
                anchors {
                    top: parent.top
                    left: parent.left
                }
            }
            ListButton {
                text: "-"
                width: 50
                onClicked: cameraModel.deleteCamera(name)
                anchors {
                    top: parent.top
                    right: parent.right
                }
            }
        }
    }

    Label {
        id: header
        text: qsTr("Edit cameras")
        font.pixelSize: platformStyle.fontPixelSize * 1.5
        font.weight: Font.DemiBold
    }

    ListView {
        id: cameraList
        model: cameraModel;
        delegate: listDelegate
        focus: true
        anchors {
            left: parent.left
            top: header.bottom
            right: parent.right
            bottom: cameraButtons.top
            margins: 20
        }
    }

    ButtonRow {
        id: cameraButtons
        anchors {
            left: parent.left
            bottom: parent.bottom;
            right: parent.right
            margins: 20
        }
        Button {
            text: qsTr("Add new")
//            onClicked: atDialog.open();
        }
        Button {
            text: qsTr("Reset")
            onClicked: cameraModel.resetDefaults();
        }

    }

    ScrollDecorator {
        flickableItem: cameraList
    }

}

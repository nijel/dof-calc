import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.0
Page {
    tools: commonTools

    Component {
        id: listDelegate
        Item {
            width: focalList.width
            height: 55
            clip: true

            Label {
                text: name
                width: focalList.width - 60
                anchors {
                    top: parent.top
                    left: parent.left
                }
            }
            ListButton {
                text: "-"
                width: 50
                onClicked: focalModel.deleteFocal(focal)
                anchors {
                    top: parent.top
                    right: parent.right
                }
            }
        }
    }

    Label {
        id: header
        text: qsTr("Edit lenses")
        font.pixelSize: platformStyle.fontPixelSize * 1.5
        font.weight: Font.DemiBold
    }

    ListView {
        id: focalList
        model: focalModel;
        delegate: listDelegate
        focus: true
        anchors {
            left: parent.left
            top: header.bottom
            right: parent.right
            bottom: focalButtons.top
            margins: 20
        }
    }

    ButtonRow {
        id: focalButtons
        anchors {
            left: parent.left
            bottom: parent.bottom;
            right: parent.right
            margins: 20
        }
        Button {
            text: qsTr("Add new")
            onClicked: atDialog.open();
        }
        Button {
            text: qsTr("Reset")
            onClicked: focalModel.resetDefaults();
        }

    }

    ScrollDecorator {
        flickableItem: focalList
    }

    FocalThumbler {
        id: atDialog
    }
}

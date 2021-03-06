import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.0
Page {
    tools: commonTools

    Component {
        id: listDelegate
        Item {
            width: apertureList.width
            height: 55
            clip: true

            Label {
                text: name
                width: apertureList.width - 60
                anchors {
                    top: parent.top
                    left: parent.left
                }
            }
            ListButton {
                text: "-"
                width: 50
                onClicked: apertureModel.deleteAperture(fstop)
                anchors {
                    top: parent.top
                    right: parent.right
                }
            }
        }
    }

    Label {
        id: header
        text: qsTr("Edit apertures")
        font.pixelSize: platformStyle.fontPixelSize * 1.5
        font.weight: Font.DemiBold
    }

    ListView {
        id: apertureList
        model: apertureModel;
        delegate: listDelegate
        focus: true
        anchors {
            left: parent.left
            top: header.bottom
            right: parent.right
            bottom: apertureButtons.top
            margins: 20
        }
    }

    ButtonRow {
        id: apertureButtons
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
            onClicked: apertureModel.resetDefaults();
        }

    }

    ScrollDecorator {
        flickableItem: apertureList
    }

    ApertureThumbler {
        id: atDialog
    }
}

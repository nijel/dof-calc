import QtQuick 1.1
import com.meego 1.0

 Dialog {
    id: aboutDialog
    title: Item {
        id: titleField
        height: 40
        width: parent.width
        Label {
            font.pixelSize: 38
            anchors.centerIn: parent
            color: "white"
            text: "DOF Calc"
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
                color: "white"
                text: qsTr("Depth of field calculator")
            }
            Label {
                color: "white"
                text: qsTr("Version:") + " " + "0.0.3"
            }
            Label {
                color: "white"
                text: "Copyright (c) 2011 Michal Čihař"
            }
            Label {
                color: "white"
                text: qsTr("Email:") + " <michal@cihar.com>"
            }
            Label {
                color: "white"
                text: qsTr("Website:") + " http://gitorious.org/dofcalc"
            }
        }
    }

    buttons: ButtonRow {
        style: ButtonStyle { }
        anchors.horizontalCenter: parent.horizontalCenter
        Button {
            text: "OK";
            onClicked: aboutDialog.accept()
        }
    }
}

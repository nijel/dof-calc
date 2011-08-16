import QtQuick 1.1
import com.meego 1.0

 Dialog {
    id: aboutDialog
    title: Item {
        id: titleField
        height: 40
        width: parent.width
        Text {
            id: titleText
            font.pixelSize: 34
            anchors.centerIn: parent
            color: "white"
            text: "DOF Calc"
        }
    }

    content:Item {
        id: contentField
        height: 130
        width: parent.width
        Text {
            id: contentText
            font.pixelSize: 20
            anchors.centerIn: parent
            color: "white"
            text: "Depth of field calculator\nVersion: 0.0.2\nCopyright (c) 2011 Michal Čihař\nEmail: <michal@cihar.com>\nWebsite: http://gitorious.org/dofcalc"
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

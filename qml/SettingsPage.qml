import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1

Page {
    tools: commonTools

    Grid {
          columns: screen.currentOrientation == Screen.Landscape || screen.currentOrientation == Screen.LandscapeInverted ? 2 : 1
          anchors.margins: 10
          anchors.top: parent.top
          anchors.left: parent.left
          anchors.bottom: parent.bottom
          anchors.right: parent.right
          spacing: 25

          Column {
                spacing: 25


                Label {
                    text: qsTr("Settings")
                    font.pixelSize: platformStyle.fontPixelSize*1.5
                    font.weight: Font.DemiBold
                }


                Button {
                    text: qsTr("Cameras")
                    onClicked: appWindow.pageStack.push(cameraEditPage);
                }

                Button {
                    text: qsTr("Lenses")
                    onClicked: appWindow.pageStack.push(focalEditPage);
                }

                Button {
                    text: qsTr("Apertures")
                    onClicked: appWindow.pageStack.push(apertureEditPage);
                }
          }

          Column {
              spacing: 25

              Label {
                  text: qsTr("Appearance")
                  font.pixelSize: platformStyle.fontPixelSize*1.5
                  visible: false
                  font.weight: Font.DemiBold
              }
          }
    }
}

import QtQuick 1.1
import com.nokia.meego 1.0

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
                    text: qsTr("Choices")
                    font.pixelSize: 26
                    font.weight: Font.DemiBold
                }


                Button {
                    text: qsTr("Cameras")
                }

                Button {
                    text: qsTr("Lenses")
                }

                Button {
                    text: qsTr("Apertures")
                }
          }

          Column {
              spacing: 25

              Label {
                  text: qsTr("Appearance")
                  font.pixelSize: 26
                  visible: false
                  font.weight: Font.DemiBold
              }

          }

    }
}

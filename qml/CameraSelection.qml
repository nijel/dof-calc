import QtQuick 1.1
import com.nokia.meego 1.0
import "../js/settings.js" as Settings

SelectionDialog {
    id: cameraSelection
    titleText: qsTr("Camera")
    model: cameraModel
    property string selected: cameraModel.get(selectedIndex).name
    property double value: cameraModel.get(selectedIndex).coc

    onAccepted: Settings.setSetting("camera", cameraSelection.selected);

    Component.onCompleted: {
        cameraSelection.selectedIndex = 0;
        var saved_camera = Settings.getSetting("camera", "APS-C DSLR (crop 1.5)");
        for(var i = 0; i < cameraModel.count; i++) {
            if (cameraModel.get(i).name == saved_camera) {
                cameraSelection.selectedIndex = i;
                break;
            }
        }
    }

}

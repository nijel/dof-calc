import QtQuick 1.1
import com.meego 1.0
import "../js/settings.js" as Settings

SelectionDialog {
    id: cameraSelection
    titleText: qsTr("Camera")
    model: cameraModel
    property string selected: cameraModel.get(selectedIndex).name
    property double value: cameraModel.get(selectedIndex).coc

    ListModel {
        id: cameraModel
        ListElement { name: "Four thirds (crop 2)"; coc: 0.015 }
        ListElement { name: "Canon APS-C (crop 1.6)"; coc: 0.019 }
        ListElement { name: "APS-C DSLR (crop 1.5)"; coc: 0.020 }
        ListElement { name: "Canon APS-H (crop 1.3)"; coc: 0.023 }
        ListElement { name: "Full frame SLR"; coc: 0.030 }
        ListElement { name: "Pentax 645D"; coc: 0.050 }
    }

    Component.onCompleted: {
        Settings.initialize();
        var saved_camera = Settings.getSetting("camera", "APS-C DSLR (crop 1.5)");
        for(var i = 0; i < cameraModel.count; i++) {
            if (cameraModel.get(i).name == saved_camera) {
                cameraSelection.selectedIndex = i;
                break;
            }
        }
    }

    Component.onDestruction: {
        Settings.setSetting("camera", cameraSelection.selected);
    }
}

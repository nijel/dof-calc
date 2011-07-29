import QtQuick 1.1
import com.meego 1.0
import "../js/settings.js" as Settings

SelectionDialog {
    id: cameraSelection
    titleText: qsTr("Camera")
    model: cameraModel
    property string selected: cameraModel.get(selectedIndex).name
    property double value: cameraModel.get(selectedIndex).coc

    onAccepted: Settings.setSetting("camera", cameraSelection.selected);

    ListModel {
        id: cameraModel
    }

    Component.onCompleted: {
        Settings.initialize();
        var cameras = Settings.getCameras();
        if (cameras.length == 0) {
            // Add defaults
            console.log('text' + Settings.addCamera("Four thirds (crop 2)", 0.015 ));
            Settings.addCamera("Canon APS-C (crop 1.6)", 0.019 );
            Settings.addCamera("APS-C DSLR (crop 1.5)", 0.020 );
            Settings.addCamera("Canon APS-H (crop 1.3)", 0.023 );
            Settings.addCamera("Full frame SLR", 0.030 );
            Settings.addCamera("Pentax 645D", 0.050 );
            // Reload
            cameras = Settings.getCameras();
        }

        for (var i = 0; i < cameras.length; i++) {
            cameraModel.append({name: cameras[i]['name'], coc: cameras[i]['coc']});
        }

        var saved_camera = Settings.getSetting("camera", "APS-C DSLR (crop 1.5)");
        for(var i = 0; i < cameraModel.count; i++) {
            if (cameraModel.get(i).name == saved_camera) {
                cameraSelection.selectedIndex = i;
                break;
            }
        }
    }

}

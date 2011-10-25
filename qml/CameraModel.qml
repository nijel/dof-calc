import QtQuick 1.1
import "../js/settings.js" as Settings

ListModel {
    id: cameraModel

    Component.onCompleted: {
        Settings.initialize();
        loadSettings();
    }

    function loadSettings() {
        cameraModel.clear();
        var cameras = Settings.getCameras();
        if (cameras.length == 0) {
            // Add defaults
            addDefaults()
            // Reload
            cameras = Settings.getCameras();
        }

        for (var i = 0; i < cameras.length; i++) {
            cameraModel.append({name: cameras[i]['name'], coc: cameras[i]['coc']});
        }
    }

    function addCamera(name, coc)
    {
        Settings.addCamera(name, coc);
        // Reload to ensure sorting
        loadSettings();
    }

    function addDefaults()
    {
        Settings.addCamera("Compact", 0.005 );
        Settings.addCamera("Four thirds (crop 2)", 0.015 );
        Settings.addCamera("Canon APS-C (crop 1.6)", 0.019 );
        Settings.addCamera("APS-C DSLR (crop 1.5)", 0.020 );
        Settings.addCamera("Canon APS-H (crop 1.3)", 0.023 );
        Settings.addCamera("Full frame SLR", 0.030 );
        Settings.addCamera("Pentax 645D", 0.050 );
        Settings.addCamera("645", 0.047 );
        Settings.addCamera("6x6", 0.053 );
    }

    function resetDefaults()
    {
        var cameras = Settings.getCameras();
        for (var i = 0; i < cameras.length; i++) {
            Settings.deleteCamera(cameras[i]['name']);
        }
        addDefaults();
        loadSettings();
    }

    function deleteCamera(name)
    {
        Settings.deleteCamera(name);
        // Reload to ensure sorting
        loadSettings();
    }
}

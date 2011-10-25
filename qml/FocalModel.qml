import QtQuick 1.1
import "../js/settings.js" as Settings

ListModel {
    id: focalModel

    Component.onCompleted: {
        Settings.initialize();
        loadSettings();
    }

    function loadSettings() {
        focalModel.clear();
        var focals = Settings.getFocals();
        if (focals.length == 0) {
            // Add defaults
            addDefaults();
            // Reload
            focals = Settings.getFocals();
        }

        for (var i = 0; i < focals.length; i++) {
            focalModel.append({name: focals[i]['name'], focal: focals[i]['focal']});
        }
    }

    function addFocal(val)
    {
        Settings.addFocal(val);
        // Reload to ensure sorting
        loadSettings();
    }

    function addDefaults()
    {
        Settings.addFocal(15);
        Settings.addFocal(24);
        Settings.addFocal(31);
        Settings.addFocal(35);
        Settings.addFocal(50);
        Settings.addFocal(55);
        Settings.addFocal(70);
        Settings.addFocal(85);
        Settings.addFocal(100);
        Settings.addFocal(135);
        Settings.addFocal(150);
        Settings.addFocal(180);
        Settings.addFocal(200);
        Settings.addFocal(300);

    }

    function resetDefaults()
    {
        var focals = Settings.getFocals();
        for (var i = 0; i < focals.length; i++) {
            Settings.deleteFocal(focals[i]['focal']);
        }
        addDefaults();
        loadSettings();
    }

    function deleteFocal(val)
    {
        Settings.deleteFocal(val);
        // Reload to ensure sorting
        loadSettings();
    }
}

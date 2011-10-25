import QtQuick 1.1
import "../js/settings.js" as Settings

ListModel {
    id: apertureModel

    Component.onCompleted: {
        Settings.initialize();
        loadSettings();
    }

    function loadSettings() {
        apertureModel.clear();
        var apertures = Settings.getApertures();

        if (apertures.length == 0) {
            // Add defaults
            addDefaults();
            // Reload
            apertures = Settings.getApertures();
        }

        for (var i = 0; i < apertures.length; i++) {
            apertureModel.append({name: apertures[i]['name'], fstop: apertures[i]['fstop']});
        }
    }

    function addAperture(val)
    {
        Settings.addAperture(val);
        // Reload to ensure sorting
        loadSettings();
    }

    function addDefaults()
    {
        Settings.addAperture(1.0);
        Settings.addAperture(1.2);
        Settings.addAperture(1.4);
        Settings.addAperture(1.7);
        Settings.addAperture(2.0);
        Settings.addAperture(2.2);
        Settings.addAperture(2.4);
        Settings.addAperture(2.8);
        Settings.addAperture(3.2);
        Settings.addAperture(4.0);
        Settings.addAperture(5.6);
        Settings.addAperture(6.7);
        Settings.addAperture(8.0);
        Settings.addAperture(11.0);
        Settings.addAperture(16.0);
        Settings.addAperture(20.0);
        Settings.addAperture(28.0);
        Settings.addAperture(32.0);
    }

    function resetDefaults()
    {
        var apertures = Settings.getApertures();
        for (var i = 0; i < apertures.length; i++) {
            Settings.deleteAperture(apertures[i]['fstop']);
        }
        addDefaults();
        loadSettings();
    }

    function deleteAperture(fstop)
    {
        Settings.deleteAperture(fstop);
        // Reload to ensure sorting
        loadSettings();
    }
}

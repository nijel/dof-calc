import QtQuick 1.1
import com.meego 1.0
import "../js/settings.js" as Settings

SelectionDialog {
    id: apertureSelection
    titleText: qsTr("Aperture")
    model: apertureModel
    property string selected: apertureModel.get(selectedIndex).name
    property double value: apertureModel.get(selectedIndex).fstop

    onAccepted: Settings.setSetting("aperture", value);

    ListModel {
        id: apertureModel
    }

    Component.onCompleted: {
        Settings.initialize();
        var apertures = Settings.getApertures();
        if (apertures.length == 0) {
            // Add defaults
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
            // Reload
            apertures = Settings.getApertures();
        }

        for (var i = 0; i < apertures.length; i++) {
            apertureModel.append({name: apertures[i]['name'], fstop: apertures[i]['fstop']});
        }

        var saved_aperture = Math.round(Settings.getSetting("aperture", 2.8));
        for(var i = 0; i < apertureModel.count; i++) {
            if (Math.round(apertureModel.get(i).fstop * 10) == Math.round(saved_aperture * 10)) {
                apertureSelection.selectedIndex = i;
                break;
            }
        }
    }
}

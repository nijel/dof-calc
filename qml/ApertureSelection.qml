import QtQuick 1.1
import com.nokia.meego 1.0
import "../js/settings.js" as Settings

SelectionDialog {
    id: apertureSelection
    titleText: qsTr("Aperture")
    model: apertureModel
    property string selected: apertureModel.get(selectedIndex).name
    property double value: apertureModel.get(selectedIndex).fstop

    onAccepted: Settings.setSetting("aperture", value);

    Component.onCompleted: {
        Settings.initialize();

        var saved_aperture = Settings.getSetting("aperture", 2.8);
        apertureSelection.selectedIndex = 0;
        for(var i = 0; i < apertureModel.count; i++) {
            if (Math.round(apertureModel.get(i).fstop * 10) == Math.round(saved_aperture * 10)) {
                apertureSelection.selectedIndex = i;
                break;
            }
        }
    }
}

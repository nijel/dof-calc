import QtQuick 1.1
import com.meego 1.0
import "../js/settings.js" as Settings

SelectionDialog {
    id: focalSelection
    titleText: qsTr("Focal length")
    model: focalModel
    property string selected: focalModel.get(selectedIndex).name
    property int value: focalModel.get(selectedIndex).focal

    onAccepted: Settings.setSetting("focal", value);

    ListModel {
        id: focalModel
    }

    Component.onCompleted: {
        Settings.initialize();
        var focals = Settings.getFocals();
        if (focals.length == 0) {
            // Add defaults
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
            // Reload
            focals = Settings.getFocals();
        }

        for (var i = 0; i < focals.length; i++) {
            focalModel.append({name: focals[i]['name'], focal: focals[i]['focal']});
        }

        var saved_focal = Math.round(Settings.getSetting("focal", 35));
        for(var i = 0; i < focalModel.count; i++) {
            if (focalModel.get(i).focal == saved_focal) {
                focalSelection.selectedIndex = i;
                break;
            }
        }
    }
}

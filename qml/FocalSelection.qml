import QtQuick 1.1
import com.nokia.meego 1.0
import "../js/settings.js" as Settings

SelectionDialog {
    id: focalSelection
    titleText: qsTr("Focal length")
    model: focalModel
    property string selected: focalModel.get(selectedIndex).name
    property int value: focalModel.get(selectedIndex).focal

    onAccepted: Settings.setSetting("focal", value);

    Component.onCompleted: {
        focalSelection.selectedIndex = 0;
        var saved_focal = Math.round(Settings.getSetting("focal", 35));
        for(var i = 0; i < focalModel.count; i++) {
            if (focalModel.get(i).focal == saved_focal) {
                focalSelection.selectedIndex = i;
                break;
            }
        }
    }
}

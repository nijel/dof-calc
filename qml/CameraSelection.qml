import QtQuick 1.1
import com.meego 1.0

SelectionDialog {
    id: cameraSelection
    titleText: qsTr("Camera")
    selectedIndex: 1
    model: cameraModel
    property string selected: cameraModel.get(selectedIndex).name
    property double value: cameraModel.get(selectedIndex).coc

    ListModel {
        id: cameraModel
        ListElement { name: "APS-C DSLR (crop 1.5)"; coc: 0.020 }
        ListElement { name: "Canon APS-C (crop 1.6)"; coc: 0.019 }
        ListElement { name: "Canon APS-H (crop 1.3)"; coc: 0.023 }
        ListElement { name: "Full frame SLR"; coc: 0.030 }
        ListElement { name: "Pentax 645D"; coc: 0.050 }
    }
}

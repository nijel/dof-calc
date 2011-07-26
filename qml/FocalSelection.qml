import QtQuick 1.1
import com.meego 1.0

SelectionDialog {
    id: focalSelection
    titleText: "Focal length"
    selectedIndex: 3
    model: focalModel
    property string selected: focalModel.get(focalSelectionDialog.selectedIndex).name
    property int value: parseInt(focalModel.get(focalSelectionDialog.selectedIndex).name)

    ListModel {
        id: focalModel
        ListElement { name: "15 mm" }
        ListElement { name: "35 mm" }
        ListElement { name: "50 mm" }
        ListElement { name: "70 mm" }
        ListElement { name: "100 mm" }
        ListElement { name: "135 mm" }
        ListElement { name: "150 mm" }
        ListElement { name: "200 mm" }
        ListElement { name: "300 mm" }
    }
}

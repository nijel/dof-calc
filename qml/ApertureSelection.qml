import QtQuick 1.1
import com.meego 1.0

SelectionDialog {
    id: apertureSelection
    titleText: qsTr("Aperture")
    selectedIndex: 10
    model: apertureModel
    property string selected: apertureModel.get(selectedIndex).name
    property double value: parseFloat(apertureModel.get(selectedIndex).name.substring(2))

    ListModel {
        id: apertureModel
        ListElement { name: "f/1.0" }
        ListElement { name: "f/1.2" }
        ListElement { name: "f/1.4" }
        ListElement { name: "f/1.7" }
        ListElement { name: "f/2.0" }
        ListElement { name: "f/2.2" }
        ListElement { name: "f/2.4" }
        ListElement { name: "f/2.8" }
        ListElement { name: "f/3.2" }
        ListElement { name: "f/4.0" }
        ListElement { name: "f/5.6" }
        ListElement { name: "f/6.7" }
        ListElement { name: "f/8.0" }
        ListElement { name: "f/11.0" }
        ListElement { name: "f/16.0" }
        ListElement { name: "f/20.0" }
        ListElement { name: "f/28.0" }
        ListElement { name: "f/32.0" }
    }
}

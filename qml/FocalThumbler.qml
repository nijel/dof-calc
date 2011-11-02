import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.0

TumblerDialog {

    id: tDialog
    titleText: qsTr("Focal length (in mm)")
    acceptButtonText: qsTr("Add")
    rejectButtonText: qsTr("Cancel")
    columns: [ column2, column1, column0 ]
    onAccepted: focalModel.addFocal(column2.selectedIndex * 100 + column1.selectedIndex * 10 + column0.selectedIndex)

    TumblerColumn {
        id: column0
        items: ListModel { id: number0Model }
    }
    TumblerColumn {
        id: column1
        items: ListModel { id: number1Model }
    }
    TumblerColumn {
        id: column2
        items: ListModel { id: number2Model }
    }


    TumblerColumn {
        id: decimalColumn
        items: ListModel { id: decimalModel }
    }

    Component.onCompleted: {
        for (var i = 0; i < 10; i++) {
            number0Model.append({'value': i})
            number1Model.append({'value': i})
            number2Model.append({'value': i})
        }
    }

 }

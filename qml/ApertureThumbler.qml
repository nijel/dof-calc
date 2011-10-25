import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1

TumblerDialog {

    id: tDialog
    titleText: qsTr("Aperture")
    acceptButtonText: qsTr("Ok")
    rejectButtonText: qsTr("Cancel")
    columns: [ numberColumn, decimalColumn ]
    onAccepted: apertureModel.addAperture(numberColumn.selectedIndex + (decimalColumn.selectedIndex / 10))

    TumblerColumn {
        id: numberColumn
        items: ListModel { id: numberModel }
    }

    TumblerColumn {
        id: decimalColumn
        items: ListModel { id: decimalModel }
    }

    Component.onCompleted: {
        for (var i = 0; i < 10; i++) {
            decimalModel.append({'value': i})
        }
        for (var i = 0; i < 100; i++) {
            numberModel.append({'value': i})
        }
    }

 }

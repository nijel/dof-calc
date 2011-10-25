import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage{id: mainPage}

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            iconId: pageStack.depth > 1 ? "toolbar-back" : "toolbar-back-dimmed";
            onClicked: { if (pageStack.depth > 1) { pageStack.pop(); if (settingsIcon.insettings && pageStack.depth == 1) {settingsIcon.insettings = false; }  }}
        }
        ToolIcon {
            platformIconId: "toolbar-application";
            onClicked: aboutDialog.open();
        }
        ToolIcon {
            id: settingsIcon;
            platformIconId: insettings ? "toolbar-settings-dimmed" : "toolbar-settings";
            property bool insettings: false
            onClicked: if (!insettings){ appWindow.pageStack.push(settingsPage); insettings = true;}
        }
    }

    AboutDialog {
        id: aboutDialog;
    }
    SettingsPage {
        id: settingsPage;
    }
    ApertureModel {
        id: apertureModel;
    }
    ApertureEdit {
        id: apertureEditPage;
    }
    CameraModel {
        id: cameraModel;
    }
    CameraEdit {
        id: cameraEditPage;
    }
    FocalModel {
        id: focalModel;
    }
    FocalEdit {
        id: focalEditPage;
    }

    Component.onCompleted: {
        theme.inverted = true;
    }
}

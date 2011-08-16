import QtQuick 1.1
import com.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage{id: mainPage}

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-application";
            onClicked: aboutDialog.open();
        }
        /* Not implemented
        ToolIcon {
            platformIconId: "toolbar-settings";
        }
        */
    }

    AboutDialog {
        id: aboutDialog;
    }
}

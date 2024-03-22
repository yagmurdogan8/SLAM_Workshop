import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtQuick.Window 2.15
import QtQml 2.15
import CoppeliaSimPlugin 1.0

PluginWindow {
    id: mainWindow
    width: configUi.implicitWidth
    height: configUi.implicitHeight
    visible: true
    title: qsTr("ConfigUI")
    color: systemPalette.window
    resizable: false

    property bool readjustPosition: true
    Timer {
        running: true
        interval: 1000
        onTriggered: readjustPosition = false
    }
    onWidthChanged: if(readjustPosition) x = Screen.width - width - 5
    onHeightChanged: if(readjustPosition) y = (Screen.height - height) / 2

    SystemPalette {
        id: systemPalette
        colorGroup: SystemPalette.Active
    }

    onClosing: simBridge.sendEvent('ConfigUI_uiClosing',{})

    ConfigUI {
        id: configUi
        simBridge: mainWindow.simBridge
    }

    // called from lua:

    function setConfig(c) {
        configUi.setConfig(c)
    }

    function setSchema(s) {
        configUi.setSchema(s)
    }

    function setConfigAndSchema(o) {
        configUi.setConfigAndSchema(o)
        if(o.objectName !== undefined)
            mainWindow.title = `${o.objectName} config`
    }

    function beforeSimulation() {
        close()
    }
}

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

RowLayout {
    id: root
    required property string elemName
    required property var elemSchema
    property var elemValue

    Rectangle {
        id: rectColor
        width: button.height
        height: width
        border.color: 'black'
        color: Qt.rgba(root.elemValue[0], root.elemValue[1], root.elemValue[2], 1)
    }

    Button {
        id: button
        text: "..."
        onClicked: colorDialog.open()
    }

    ColorDialog {
        id: colorDialog
        currentColor: rectColor.color
        onAccepted: {
            rectColor.color = currentColor
            elemValue = [currentColor.r, currentColor.g, currentColor.b]
        }
    }
}

import QtQuick 2.9
import QtMultimedia 5.9
import QtQuick.Controls 2.2
import ImageItem 1.0
import TransFilter 1.0
import Server 1.0

Item {
    property alias camera: camera
    property alias transfilter: transfilter
    property alias server: server
    property alias exitBtn: exitBtn
    property alias statusLabel: statusLabel
    property alias startBtn: startBtn

    Camera {
        id: camera
        objectName: "camera"
    }

    TransFilter {
        id: transfilter
    }

    Server {
        id: server
    }

    Rectangle {
        id: background
        color: "#8d8892"
        anchors.fill: parent
    }

    Rectangle {
        id: cameraFrame
        anchors.bottomMargin: 8
        anchors.right: column.left
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.rightMargin: 8
        anchors.leftMargin: 8
        anchors.topMargin: 8

        VideoOutput {
            source: camera
            filters: [transfilter]
            autoOrientation: true
            anchors.fill: parent
            fillMode: VideoOutput.Stretch
        }
    }

    Column {
        id: column
        spacing: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.bottomMargin: 8
        anchors.topMargin: 8
        anchors.bottom: parent.bottom
        anchors.top: parent.top

        Button {
            id: startBtn
            text: qsTr("Start Server")
        }

        Button {
            id: exitBtn
            text: qsTr("Exit")
        }
    }

    Text {
        id: statusLabel
        font.family: "Helvetica"
        font.pointSize: 14
        color: "red"
        text: server.status
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.left: cameraFrame.left
        anchors.leftMargin: 2
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/

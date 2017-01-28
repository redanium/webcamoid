/* Webcamoid, webcam capture application.
 * Copyright (C) 2011-2017  Gonzalo Exequiel Pedone
 *
 * Webcamoid is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Webcamoid is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
 *
 * Web-Site: http://webcamoid.github.io/
 */

import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    id: wndFlash
    color: "white"
    flags: Qt.Dialog
    modality: Qt.ApplicationModal
    visibility: visible? Window.FullScreen: Window.Hidden

    property int timeout: 1500

    signal triggered()

    onVisibleChanged: {
        if (visible) {
            timerShot.start()
            timerClose.start()
        }
    }

    Timer {
        id: timerShot
        interval: 0.75 * wndFlash.timeout
        repeat: false
        triggeredOnStart: false

        onTriggered: wndFlash.triggered()
    }
    Timer {
        id: timerClose
        interval: wndFlash.timeout
        repeat: false
        triggeredOnStart: false

        onTriggered: wndFlash.hide()
    }
}

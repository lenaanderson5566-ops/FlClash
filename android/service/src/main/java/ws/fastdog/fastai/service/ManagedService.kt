package ws.fastdog.fastai.service

import android.app.Service
import ws.fastdog.fastai.common.BroadcastAction
import ws.fastdog.fastai.common.GlobalState
import ws.fastdog.fastai.common.sendBroadcast

interface ManagedService {
    fun start()

    fun stop()
}

internal fun Service.notifyVpnStartRequested() {
    GlobalState.log("VPN start requested")
    BroadcastAction.VPN_START_REQUESTED.sendBroadcast()
}

internal fun Service.notifyVpnRevoked() {
    GlobalState.log("VPN permission revoked")
    BroadcastAction.VPN_REVOKED.sendBroadcast()
}

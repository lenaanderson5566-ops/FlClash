package ws.fastdog.fastai

import android.app.Application
import android.content.Context
import ws.fastdog.fastai.common.GlobalState

class FastAIApplication : Application() {
    override fun attachBaseContext(base: Context?) {
        super.attachBaseContext(base)
        GlobalState.init(this)
    }
}

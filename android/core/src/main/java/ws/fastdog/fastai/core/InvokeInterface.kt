package ws.fastdog.fastai.core

import androidx.annotation.Keep

@Keep
interface InvokeInterface {
    fun onResult(result: ByteArray?)
}
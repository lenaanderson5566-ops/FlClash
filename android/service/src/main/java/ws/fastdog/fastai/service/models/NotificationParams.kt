package ws.fastdog.fastai.service.models

data class NotificationParams(
    val title: String = "FastAI",
    val stopText: String = "STOP",
    val onlyStatisticsProxy: Boolean = false,
    val showStopAction: Boolean = true,
)

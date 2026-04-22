package io.github.kashkick.besitos.android.sdk.offerwall.config

data class OfferwallConfig(
    val partnerId: String,
    val userId: String,
    val subId: String? = null,
    val deviceId: String? = null,
    val idfa: String? = null,
    val gdfa: String? = null,
    val info: String? = null,
    val hideHeader: Boolean = false,
    val hideFooter: Boolean = false,
    val onlyOffers: Boolean = false,
)

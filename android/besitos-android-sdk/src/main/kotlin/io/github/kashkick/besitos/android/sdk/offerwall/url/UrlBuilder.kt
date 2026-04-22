package io.github.kashkick.besitos.android.sdk.offerwall.url

import io.github.kashkick.besitos.android.sdk.offerwall.SdkConfig
import io.github.kashkick.besitos.android.sdk.offerwall.config.OfferwallConfig
import java.net.URLEncoder

internal object UrlBuilder {

    fun build(config: OfferwallConfig): String {
        val params = buildList {
            add("userid" to config.userId)
            config.subId?.takeIf { it.isNotBlank() }?.let { add("subid" to it) }
            config.deviceId?.takeIf { it.isNotBlank() }?.let { add("device_id" to it) }
            config.idfa?.takeIf { it.isNotBlank() }?.let { add("idfa" to it) }
            config.gdfa?.takeIf { it.isNotBlank() }?.let { add("gdfa" to it) }
            config.info?.takeIf { it.isNotBlank() }?.let { add("info" to it) }
            if (config.hideHeader) add("hide_header" to "1")
            if (config.hideFooter) add("hide_footer" to "1")
        }

        val query = params.joinToString("&") { (k, v) ->
            "${encode(k)}=${encode(v)}"
        }

        val urlPath = if (config.onlyOffers) "offers" else "v2"
        return "${SdkConfig.BASE_URL}/$urlPath/${encode(config.partnerId)}?$query"
    }

    private fun encode(value: String): String =
        URLEncoder.encode(value, "UTF-8").replace("+", "%20")
}

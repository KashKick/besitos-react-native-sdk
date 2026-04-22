package io.github.kashkick.besitos.reactnative.sdk.offerwall

import io.github.kashkick.besitos.android.sdk.offerwall.Offerwall
import io.github.kashkick.besitos.android.sdk.offerwall.config.OfferwallConfig
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableMap

class OfferwallModule(private val reactContext: ReactApplicationContext) :
    ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String = "Offerwall"

    @ReactMethod
    fun show(options: ReadableMap) {
        val partnerId = options.getString("partnerId") ?: return
        val userId = options.getString("userId") ?: return

        val config = OfferwallConfig(
            partnerId = partnerId,
            userId = userId,
            subId = if (options.hasKey("subId")) options.getString("subId") else null,
            deviceId = if (options.hasKey("deviceId")) options.getString("deviceId") else null,
            idfa = if (options.hasKey("idfa")) options.getString("idfa") else null,
            gdfa = if (options.hasKey("gdfa")) options.getString("gdfa") else null,
            info = if (options.hasKey("info")) options.getString("info") else null,
            hideHeader = if (options.hasKey("hideHeader")) options.getBoolean("hideHeader") else false,
            hideFooter = if (options.hasKey("hideFooter")) options.getBoolean("hideFooter") else false,
            onlyOffers = if (options.hasKey("onlyOffers")) options.getBoolean("onlyOffers") else false,
        )

        val activity = reactContext.currentActivity ?: return
        activity.runOnUiThread {
            Offerwall.show(activity, config)
        }
    }
}

package io.github.kashkick.besitos.android.sdk.offerwall

import io.github.kashkick.besitos.android.sdk.offerwall.config.OfferwallConfig
import io.github.kashkick.besitos.android.sdk.offerwall.validation.ValidationResult
import io.github.kashkick.besitos.android.sdk.offerwall.validation.ValidationUtil
import io.github.kashkick.besitos.android.sdk.offerwall.webview.OfferwallActivity
import android.content.Context
import android.util.Log

object Offerwall {

    private const val TAG = "Offerwall"

    fun show(context: Context, config: OfferwallConfig) {
        when (val result = ValidationUtil.validate(config)) {
            is ValidationResult.Valid -> {
                OfferwallActivity.launch(context, config)
            }
            is ValidationResult.Invalid -> {
                Log.e(TAG, "Invalid config: ${result.reason}")
                throw IllegalArgumentException("Offerwall: ${result.reason}")
            }
        }
    }
}

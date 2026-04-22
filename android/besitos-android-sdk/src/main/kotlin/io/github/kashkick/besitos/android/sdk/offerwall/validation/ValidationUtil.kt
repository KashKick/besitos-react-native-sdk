package io.github.kashkick.besitos.android.sdk.offerwall.validation

import io.github.kashkick.besitos.android.sdk.offerwall.config.OfferwallConfig

internal object ValidationUtil {

    private val SAFE_PATTERN = Regex("^[A-Za-z0-9\\-_]*$")

    fun validate(config: OfferwallConfig): ValidationResult {
        if (config.partnerId.isBlank()) {
            return ValidationResult.Invalid("partnerId is required and cannot be blank")
        }
        if (!SAFE_PATTERN.matches(config.partnerId)) {
            return ValidationResult.Invalid("partnerId contains invalid characters")
        }
        if (config.userId.isBlank()) {
            return ValidationResult.Invalid("userId is required and cannot be blank")
        }
        if (!SAFE_PATTERN.matches(config.userId)) {
            return ValidationResult.Invalid("userId contains invalid characters")
        }
        config.subId?.takeIf { it.isNotBlank() }?.let {
            if (!SAFE_PATTERN.matches(it)) return ValidationResult.Invalid("subId contains invalid characters")
        }
        config.deviceId?.takeIf { it.isNotBlank() }?.let {
            if (!SAFE_PATTERN.matches(it)) return ValidationResult.Invalid("deviceId contains invalid characters")
        }
        config.idfa?.takeIf { it.isNotBlank() }?.let {
            if (!SAFE_PATTERN.matches(it)) return ValidationResult.Invalid("idfa contains invalid characters")
        }
        config.gdfa?.takeIf { it.isNotBlank() }?.let {
            if (!SAFE_PATTERN.matches(it)) return ValidationResult.Invalid("gdfa contains invalid characters")
        }
        return ValidationResult.Valid
    }
}

sealed class ValidationResult {
    data object Valid : ValidationResult()
    data class Invalid(val reason: String) : ValidationResult()
}

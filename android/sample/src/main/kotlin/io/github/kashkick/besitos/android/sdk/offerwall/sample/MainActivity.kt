package io.github.kashkick.besitos.android.sdk.offerwall.sample

import io.github.kashkick.besitos.android.sdk.offerwall.Offerwall
import io.github.kashkick.besitos.android.sdk.offerwall.config.OfferwallConfig
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Switch
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val etPartnerId = findViewById<EditText>(R.id.etPartnerId)
        val etUserId = findViewById<EditText>(R.id.etUserId)
        val etSubId = findViewById<EditText>(R.id.etSubId)
        val etDeviceId = findViewById<EditText>(R.id.etDeviceId)
        val etInfo = findViewById<EditText>(R.id.etInfo)
        val swHideHeader = findViewById<Switch>(R.id.swHideHeader)
        val swHideFooter = findViewById<Switch>(R.id.swHideFooter)
        val btnLaunch = findViewById<Button>(R.id.btnLaunch)

        btnLaunch.setOnClickListener {
            val partnerId = etPartnerId.text.toString().trim()
            val userId = etUserId.text.toString().trim()

            if (partnerId.isBlank()) {
                Toast.makeText(this, "Partner ID is required", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }
            if (userId.isBlank()) {
                Toast.makeText(this, "User ID is required", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }
            try {
                Offerwall.show(
                    context = this,
                    config = OfferwallConfig(
                        partnerId = partnerId,
                        userId = userId,
                        subId = etSubId.text.toString().trim().ifBlank { null },
                        deviceId = etDeviceId.text.toString().trim().ifBlank { null },
                        info = etInfo.text.toString().trim().ifBlank { null },
                        hideHeader = swHideHeader.isChecked,
                        hideFooter = swHideFooter.isChecked,
                    )
                )
            } catch (e: IllegalArgumentException) {
                Toast.makeText(this, e.message, Toast.LENGTH_LONG).show()
            }
        }
    }
}

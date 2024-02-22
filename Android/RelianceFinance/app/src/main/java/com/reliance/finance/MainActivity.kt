package com.reliance.finance

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.platform.LocalContext
import com.reliance.finance.sdk.RelianceFinanceSDK
import com.reliance.finance.sdk.activities.FullScreenBrowser
import com.reliance.finance.sdk.composables.MinimalDialog
import com.reliance.finance.sdk.composables.browserWindow
import com.reliance.finance.sdk.model.Button
import com.reliance.finance.ui.theme.RelianceFinanceTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            RelianceFinanceTheme {
                val launchViewType = remember {
                    mutableStateOf(Pair(Button(),0L))
                }
                val showDialog = remember { mutableStateOf(false) }
                val url = remember { mutableStateOf("www.google.com") }
                val showToolbar = remember { mutableStateOf(true) }
                val showClose = remember { mutableStateOf(true) }
                MinimalDialog(showDialog = showDialog){
                    browserWindow(
                        url = url.value,
                        showToolbar = showToolbar.value,
                        showClose = showClose.value
                    ) {
                        showDialog.value = false
                    }
                }

                val sdk = RelianceFinanceSDK.instance
                sdk.setLayoutForConfig(LocalContext.current, layoutFile = "layout1.json") { button ->
                    launchViewType.value = Pair(button, System.nanoTime())
                }

                when{
                    launchViewType.value.first.windowType.equals("modal", ignoreCase = true) ->{
                        url.value = launchViewType.value.first.url?: "http://www.google.com"
                        showToolbar.value = launchViewType.value.first.header?.isVisible?: false
                        showClose.value = launchViewType.value.first.header?.showClose?: false
                        showDialog.value = true
                    }
                    launchViewType.value.first.windowType.equals("fullscreen", ignoreCase = true) -> {
                        FullScreenBrowser.launch(this@MainActivity,
                            url = launchViewType.value.first.url?: "http://www.google.com",
                            showToolbar = launchViewType.value.first.header?.isVisible?: false,
                            showClose = launchViewType.value.first.header?.showClose?: false)
                    }
                }
            }
        }
    }
}


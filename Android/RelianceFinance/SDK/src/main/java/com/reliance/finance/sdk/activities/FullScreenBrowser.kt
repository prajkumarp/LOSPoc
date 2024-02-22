package com.reliance.finance.sdk.activities

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import com.reliance.finance.sdk.composables.browserWindow

class FullScreenBrowser : ComponentActivity() {



    companion object{

        const val EXTRA_URL = "EXTRA_URL"
        const val EXTRA_SHOW_TOOLBAR = "EXTRA_SHOW_TOOLBAR"
        const val EXTRA_SHOW_CLOSE = "EXTRA_SHOW_CLOSE"

        fun launch(activity: Activity, url: String, showToolbar: Boolean, showClose: Boolean){
            activity.startActivity(Intent(activity, FullScreenBrowser::class.java).apply {
                putExtra(EXTRA_URL,url)
                putExtra(EXTRA_SHOW_TOOLBAR,showToolbar)
                putExtra(EXTRA_SHOW_CLOSE,showClose)
            })
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        var url: String = intent.getStringExtra(EXTRA_URL)?:"http://www.google.com"
        var showToolbar = intent.getBooleanExtra(EXTRA_SHOW_TOOLBAR, false)
        var showClose = intent.getBooleanExtra(EXTRA_SHOW_CLOSE, false)


        setContent{
            browserWindow(
                url = url,
                showToolbar = showToolbar,
                showClose = showClose
            ) {
                finish()
            }
        }
    }
}
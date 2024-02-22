package com.reliance.finance.sdk.composables

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.webkit.ValueCallback
import android.webkit.WebChromeClient
import android.webkit.WebResourceRequest
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.activity.ComponentActivity
import androidx.compose.runtime.Composable
import androidx.compose.ui.viewinterop.AndroidView

@Composable
fun webviewScreen(url: String,
                  webViewClient: WebViewClient = WebViewClient()
){
    AndroidView(
        factory = { context ->
                  WebView(context).apply {
                      settings.javaScriptEnabled = true
                      this.webViewClient = webViewClient
                      this.webChromeClient = UI_WebChromeClient()

                      settings.loadWithOverviewMode = true //TODO this is for preview
                      settings.useWideViewPort = true
//                      settings.setSupportZoom(true) //TODO not required

                      loadUrl(url)
                  }
        },
        update = {webView ->
            //TODO better not load here
//            webView.loadUrl(url)
        }
    )
}

//TODO if we ever need to consider file picker to pick the json file
private fun UI_WebChromeClient(): WebChromeClient{
    val webChromeClient = object: WebChromeClient(){
        override fun onShowFileChooser(
            webView: WebView?,
            filePathCallback: ValueCallback<Array<Uri>>?,
            fileChooserParams: FileChooserParams?
        ): Boolean {
            openFileChooser(filePathCallback)
            return true
        }
    }
    return webChromeClient
}

//TODO if we ever need to consider file picker to pick the json file
private fun openFileChooser(filePathCallback: ValueCallback<Array<Uri>>?) {
    val intent = Intent(Intent.ACTION_GET_CONTENT)
    intent.type = "*/*"
    intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true)
}
//TODO have to double check this
class UI_WebViewClient: WebViewClient(){
    override fun shouldOverrideUrlLoading(view: WebView?, url: String?): Boolean {
        if(url != null
            && url.startsWith("https://example.com")){
            view?.loadUrl(url)
            return true
        }
        return false
    }
}
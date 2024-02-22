package com.reliance.finance.sdk

import android.content.Context
import androidx.compose.runtime.Composable
import com.google.gson.Gson
import com.reliance.finance.sdk.composables.getLayoutComposable
import com.reliance.finance.sdk.model.Button
import com.reliance.finance.sdk.model.Layout

class RelianceFinanceSDK private constructor(){


    companion object {
        val instance by lazy {
            RelianceFinanceSDK()
        }
    }

    @Composable
    fun setLayoutForConfig(context: Context, layoutFile: String, onButtonClick: (Button) -> Unit){
        getLayoutConfig(context, layoutFile)?.let {layt ->
            getLayoutComposable(layout = layt, onButtonClick = onButtonClick)
        }
    }

    private fun getLayoutConfig(context: Context, layoutFile: String): Layout? {
        var data = readAsset(
            context = context,
            path = layoutFile
        )

        var dataObj: Layout? = null
        try {
            dataObj = Gson().fromJson(data, Layout::class.java)
        } catch (e: Exception) {

        }
        return dataObj
    }


    fun readAsset(context: Context, path: String): String{
        val file = context.assets.open(path)
        val byteArray = ByteArray(size = file.available())
        file.read(byteArray)
        file.close()
        return String(byteArray)
    }
}
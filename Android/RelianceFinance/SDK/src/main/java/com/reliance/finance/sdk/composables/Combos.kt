package com.reliance.finance.sdk.composables

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Icon
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.unit.dp

@Composable
fun browserWindow(url: String, showToolbar: Boolean = false, showClose: Boolean = false, onCloseClicked: () -> Unit){
    Column {
        if(showToolbar) {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .background(Color(0xFFAAEEDD))
                    .padding(16.dp),
                contentAlignment = Alignment.CenterStart
            ) {
                if(showClose) {
                    Icon(
                        painter = painterResource(id = android.R.drawable.ic_menu_close_clear_cancel),
                        contentDescription = "close window",
                        modifier = Modifier
                            .size(24.dp)
                            .clickable(enabled = true) {
                            onCloseClicked()
                        }
                    )
                }
            }
        }
        webviewScreen(url = url)
    }
}
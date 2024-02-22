package com.reliance.finance.sdk.composables

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.reliance.finance.sdk.model.Button
import com.reliance.finance.sdk.model.Layout

@Composable
fun getLayoutComposable(layout: Layout, onButtonClick: (Button) -> Unit){

    return Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        layout?.buttons?.forEach {
            Row {

                Button(onClick = {
                    onButtonClick(it)
                }) {
                    it.text?.let {
                        Text(text = it)
                    }
                }
            }
        }
    }

}
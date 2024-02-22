package com.reliance.finance.sdk.model


data class Layout(val buttons: List<Button>? = null)
data class Button(val text: String? = null, val renderMode: String? = null, val windowType: String? = null,val url: String? = null, val header: Header? = null)
data class Header(val isVisible: Boolean? = null, val showClose: Boolean? = null, val showBack: Boolean? = null)

package com.nasir.nazsay.android

import androidx.compose.foundation.layout.*
import androidx.compose.material.Button
import androidx.compose.material.Text
import androidx.compose.material.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun AddTasKView() {
    val text = remember { mutableStateOf("") }

    Center() {

        TextField(
            value = text.value,
            onValueChange = { text.value = it },
            label = { Text("Add Task") },
            placeholder = { Text("What needs to be done?") }
        )

        Button(onClick = {
            text.value = ""
        }) {
            Text("Add")
        }
    }
}

@Composable
@Preview
fun AddTaskPreview() {
    AddTasKView()
}

@Composable
fun Center( modifier: Modifier = Modifier, content: @Composable ColumnScope.() -> Unit) {
    Column(
        modifier = modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
        content = content
    )
}
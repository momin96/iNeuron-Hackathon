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
import com.nasir.nazsay.*

@Composable
fun AddTasKView(taskViewModel: TaskViewModel) {
    val text = remember { mutableStateOf("") }
    var users = remember { mutableStateOf(listOf<User>()) }
    var isError = remember { mutableStateOf(false) }
    var isLoading = remember { mutableStateOf(false) }
    var errorMessage = remember { mutableStateOf("") }

    Center() {
        TextField(
            value = text.value,
            onValueChange = { text.value = it },
            label = { Text("Add Task") },
            placeholder = { Text("What needs to be done?") }
        )

        Button(onClick = {
            print("clicked ${text.value}")
            text.value = ""
            taskViewModel.createTask(text.value, users.value ) {
                when (it) {
                    is LoadingState -> {
                        isLoading.value = true
                    }
                    is ErrorState -> {
                        val errorState: ErrorState = it as ErrorState
                        isError.value = true
                        errorMessage.value = errorState.throwable.message ?: "Unknown error"
                    }
                    is SuccessState<*> -> {
                        text.value = ""
                        users.value = listOf()
                    }
                }
            }
        }) {
            Text("Add")
        }
    }
}

@Composable
@Preview
fun AddTaskPreview() {
    AddTasKView(TaskViewModel())
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
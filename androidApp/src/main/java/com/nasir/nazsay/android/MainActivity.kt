package com.nasir.nazsay.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material.Surface
import com.nasir.nazsay.TaskViewModel
import com.nasir.nazsay.UserListViewModel

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            Surface {
                AddTasKView(TaskViewModel())
            }
        }
    }
}
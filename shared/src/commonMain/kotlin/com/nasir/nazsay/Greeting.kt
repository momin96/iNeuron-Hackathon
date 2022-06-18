package com.nasir.nazsay

class Greeting {
    fun greeting(): String {
        return "Hello, ${Platform().platform}!"
    }
}
package com.nasir.nazsay

class Greeting {
    fun greeting(): String {
        return "Hello, ${Platform().platform}!"
    }
}

class UserFetcher() {
    fun usersList(): List<User> {
        return listOf(User(1, "John"), User(2, "Jane"))
    }
}
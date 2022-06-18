package com.nasir.nazsay

data class Task(val id: Int, val name: String) {
    var createdAt: Long = 0
    var updatedAt: Long = 0
    var users: List<User> = listOf()
}
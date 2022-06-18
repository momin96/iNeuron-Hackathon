package com.nasir.nazsay

data class Task(val id: Int, val name: String, val users: List<User>) {
    var createdAt: Long = 0
    var updatedAt: Long = 0
}
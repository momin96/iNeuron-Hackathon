package com.nasir.nazsay

data class User(val id: Int, val name: String) {
}

class UserListViewModel {
    fun usersList(): List<User> {
        return listOf(User(1, "John"), User(2, "Jane"))
    }
}
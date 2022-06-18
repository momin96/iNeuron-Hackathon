package com.nasir.nazsay

data class User(val id: Int, val name: String) {
}

class UserListViewModel {
    fun usersList(): List<User> {
        return listOf(User(1, "John"), User(2, "Jane"), User(3, "Jack"), User(4, "Jill"), User(5, "Jim"), User(6, "Jenny"), User(7, "Jumbo"),  User(8, "Jazz"), User(9, "Jazzy"))
    }
}

data class Group(val id: Int, val name: String) {
    var members: List<User> = listOf()
}
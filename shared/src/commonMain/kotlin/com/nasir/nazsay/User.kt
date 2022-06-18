package com.nasir.nazsay
import kotlinx.datetime.Clock
import kotlinx.datetime.TimeZone
import kotlinx.datetime.toLocalDateTime

data class User(val id: Int, val name: String) {
}

class UserListViewModel {
    fun usersList(): List<User> {
        return listOf(User(1, "John"), User(2, "Jane"), User(3, "Jack"), User(4, "Jill"), User(5, "Jim"), User(6, "Jenny"), User(7, "Jumbo"),  User(8, "Jazz"), User(9, "Jazzy"))
    }
}

class TaskViewModel {

    // create task
    fun createTask(name: String, users: List<User>) {
        // generates random id
        val id = (1..10000000).random()
        val task = Task(id, name, users)

        val today = Clock.System.now().toLocalDateTime(TimeZone.currentSystemDefault()).date
        val date = today.toString().split("-").joinToString("").toLong()
        task.createdAt = date
        task.updatedAt = date
    }

    fun storeTask(task: Task) {
        // store task
    }
}
package com.nasir.nazsay

sealed class DataState
object LoadingState : DataState()
class ErrorState(var throwable: Throwable) : DataState()
data class SuccessState<T>(
    val data: T,
) : DataState()

//object Complete : DataState()

data class User(val id: Int, val name: String) {
}


class UserListViewModel {
    fun usersList(): List<User> {
        return listOf(User(1, "John"), User(2, "Jane"), User(3, "Jack"), User(4, "Jill"), User(5, "Jim"), User(6, "Jenny"), User(7, "Jumbo"),  User(8, "Jazz"), User(9, "Jazzy"))
    }
}

class TaskViewModel {

    // create task
    fun createTask(name: String, users: List<User>, response: (DataState) -> Unit) {
        response(LoadingState)

        if (name.isEmpty()) {
            response(ErrorState(Throwable("Name is required")))
        } else if (users.isEmpty()) {
            response(ErrorState(Throwable("Please select users")))
        } else {
            val id = (1..10000000).random()
            val task = Task(id, name, users)
            response(SuccessState(task))
        }
    }

    fun storeTask(task: Task) {
        // store task
    }
}

class GroupViewModel {
    fun createGroup(name: String, users: List<User>, response: (DataState) -> Unit) {
        response(LoadingState)

        // Delay of 1 second
        if (name.isEmpty()) {
            response(ErrorState(Throwable("Name is required")))
        } else {
            val id = (1..10000000).random()
            val group = MembersGroup(id, name, users)
            response(SuccessState(group))
        }
    }
}

data class MembersGroup(val id: Int, val name: String, val members: List<User> = listOf())
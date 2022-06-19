package com.nasir.nazsay

class TaskViewModel {

    var taskList: MutableList<Task> = mutableListOf()
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
            storeTask(task)
            response(SuccessState(task))
        }
    }

    fun storeTask(task: Task) {
        // store task
        taskList.add(task)
    }
}
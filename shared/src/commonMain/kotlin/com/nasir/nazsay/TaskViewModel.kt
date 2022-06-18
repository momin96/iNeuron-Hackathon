package com.nasir.nazsay

class TaskViewModel {

    // create task
    fun createTask(name: String, users: List<User>) {
        // generates random id
        val id = (1..10000000).random()
        val task = Task(id, name, users)

//        val today = Clock.System.now().toLocalDateTime(TimeZone.currentSystemDefault()).date
//        val date = today.toString().split("-").joinToString("").toLong()
//        task.createdAt = date
//        task.updatedAt = date
    }

    fun storeTask(task: Task) {
        // store task
    }
}


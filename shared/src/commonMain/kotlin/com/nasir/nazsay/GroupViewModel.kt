package com.nasir.nazsay

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
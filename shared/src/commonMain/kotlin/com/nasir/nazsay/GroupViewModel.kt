package com.nasir.nazsay

class GroupViewModel {

    var groupList: MutableList<MembersGroup> = mutableListOf()

    fun createGroup(name: String, users: List<User>, response: (DataState) -> Unit) {
        response(LoadingState)

        // Delay of 1 second
        if (name.isEmpty()) {
            response(ErrorState(Throwable("Name is required")))
        } else {
            val id = (1..10000000).random()
            val group = MembersGroup(id, name, users)
            groupList.add(group)
            response(SuccessState(group))
        }
    }

    fun groupList(): List<MembersGroup> {

        val users = UserListViewModel().usersList()
        val u0 = users[0]
        val u4 = users[4]
        val u5 = users[5]
        val u6 = users[6]
        val membersG1 = mutableListOf<User>(u0, u4, u5, u6)
        val group1 = MembersGroup( 1, "Group 1", membersG1)

        val g2u1 = users[1]
        val g2u2 = users[3]
        val g2u5 = users[5]
        val g2u3 = users[3]
        val membersG2 = mutableListOf<User>(g2u1, g2u2, g2u5, g2u3)
        val group2 = MembersGroup( 2, "Group 2", membersG2)

        val g3u0 = users[0]
        val g3u2 = users[2]
        val g3u3 = users[3]
        val g3u4 = users[4]
        val membersG3 = mutableListOf<User>(g3u0, g3u2, g3u3, g3u4)
        val group3 = MembersGroup( 3, "Group 3", membersG3)

        var list: MutableList<MembersGroup> = mutableListOf()
        list.addAll(groupList)
        listOf(group1, group2, group3).forEach { list.add(it) }
        return list
    }
}
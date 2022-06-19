package com.nasir.nazsay

sealed class DataState
object LoadingState : DataState()
class ErrorState(var throwable: Throwable) : DataState()
data class SuccessState<T>(
    val data: T,
) : DataState()

data class User(val id: Int, val name: String)

data class MembersGroup(val id: Int, val name: String, val members: List<User> = listOf())
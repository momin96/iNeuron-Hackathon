package com.nasir.nazsay

import androidx.lifecycle.ViewModel

class FirebaseViewModel: ViewModel() {


    var mGetFirebaseUserListLiveData = MutableLiveData<GetFirebaseUserListState>(LoadingGetFirebaseUserListState())

    /**
     * GET FIREBASE USER LIST
     */
    fun getFirebaseUserList() = launchSilent(coroutineContext, exceptionHandler, job) {
        mGetFirebaseUserListLiveData.postValue(LoadingGetFirebaseUserListState())

        val response = mGetFirebaseUserListUseCase.execute()
        processFirebaseUserListResponse(response)
    }
}
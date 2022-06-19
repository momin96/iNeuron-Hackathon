//
//  AddTaskView.swift
//  iosApp
//
//  Created by Nasir Ahmed Momin on 18/06/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import shared
import SwiftUI


class TaskStore: ObservableObject {
    
    @Published var errorMessage: String?
    @Published var showLoader = false
    
    @Published var taskList: [Task]?
    
    let taskViewModel = TaskViewModel()
    
    func createTask(with name: String, users: [User]) {
        
        
        taskViewModel.createTask(name: name, users: users) { [weak self] state in
            if state is LoadingState {
                self?.showLoader = true
            } else {
                self?.showLoader = false
                if let state = state as? ErrorState {
                    self?.errorMessage = state.throwable.message
                }
                
                self?.objectWillChange.send()
                self?.taskList = self?.taskViewModel.taskList as? [Task]
                print(self?.taskList)

            }
        }
    }
}

struct AddTaskView: View {
    
    @StateObject var store = TaskStore()
    
    @State private var taskName: String = ""
    @State private var users: [User] = [User]()
    @State private var showGroupSheet = false
    @State private var showErrorAlert = false
    @State private var shouldActivate = false
    
    private var errorBinding: Binding<Bool> {
        Binding<Bool> { store.errorMessage != nil }
        set: { _ in
            store.errorMessage = nil
        }
    }
    
    var navigationTitle: String {
        if taskName.isEmpty {
            return "Task"
        }
        return taskName
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Enter task name", text: $taskName)
                    }
                    Section("Members") {
                        if users.isEmpty {
                            NavigationLink {
                                UserListView(bindedUsers: $users, showGroup: true)
                            } label: {
                                Text("Select Members")
                            }
                        } else {
                            List {
                                ForEach(users, id: \.self) { user in
                                    HStack {
                                        Button  {
                                            shouldActivate = true
                                        } label: {
                                            Text(user.name)
                                                .foregroundColor(.primary)
                                        }
                                        Spacer()
                                        NavigationLink(isActive: $shouldActivate) {
                                            UserListView(bindedUsers: $users, showGroup: true)
                                        } label: {
                                            EmptyView()
                                        }.frame(width:30)
                                        
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    store.taskList.map { tasks in
                        Section("Tasks") {
                            List{
                                ForEach(tasks, id: \.self) { task in
                                    HStack {
                                        Text(task.name)
                                        Spacer()
                                        Image(systemName: "person")
                                        Text("\(task.members().count)")
                                    }
                                }
                            }
                        }
                    }
                }
                .alert(store.errorMessage ?? "",
                       isPresented: errorBinding) {
                    Text("Error")
                }
                
                Button {
                     showGroupSheet = true
                 } label: {
                     Text("Create Group")
                 }
                 .sheet(isPresented: $showGroupSheet) {
                     GroupView(bindedUser: $users)
                 }
            }
            .loadingIndicator(show: store.showLoader)
            .navigationTitle(Text(navigationTitle))
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.confirmationAction) {
                    Button {
                        store.createTask(with: taskName, users: users)
                    } label: {
                        Text("Create")
                    }
                }
            }
        }
    }
}

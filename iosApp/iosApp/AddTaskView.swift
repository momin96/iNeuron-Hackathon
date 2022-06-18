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
    
    let taskViewModel = TaskViewModel()
    
    func createTask(with name: String, users: [User]) {
        taskViewModel.createTask(name: name, users: users)
    }
}

struct AddTaskView: View {
    
    @StateObject var store = TaskStore()
    
    @State private var taskName: String = ""
    @State private var users: [User] = [User]()

    @State private var showErrorAlert = false
    
    var navigationTitle: String {
        if taskName.isEmpty {
            return "New Task"
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
                                UserListView(bindedUsers: $users)
                            } label: {
                                Text("Select Members")
                            }
                        } else {
                            List {
                                ForEach(users, id: \.self) { user in
                                    Button  {
                                        
                                    } label: {
                                        Text(user.name)
                                            .foregroundColor(.primary)
                                    }

                                }
                            }
                        }
                    }
                }
                .alert("Please provide task name & members for it",
                       isPresented: $showErrorAlert) {
                    Text("Error")
                }
                
            }
            .navigationTitle(Text(navigationTitle))
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.confirmationAction) {
                    Button {
                        if !taskName.isEmpty && !users.isEmpty {
                            store.createTask(with: taskName, users: users)
                        } else {
                            // show error alert
                            showErrorAlert = true
                        }
                        
                    } label: {
                        Text("Create")
                    }
                }
            }
        }
    }
}

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
    
    let taskViewModel = TaskViewModel()
    
    func createTask(with name: String, users: [User]) {
        taskViewModel.createTask(name: name, users: users) { [weak self] state in
            if let state = state as? ErrorState {
                self?.errorMessage = state.throwable.message
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
    
    private var errorBinding: Binding<Bool> {
        Binding<Bool> { store.errorMessage != nil }
        set: { _ in
            store.errorMessage = nil
        }
    }
    
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
                     GroupView()
                 }

                
            }
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



class GroupStore: ObservableObject {
    let groupViewModel = GroupViewModel()
    
}

struct GroupView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var groupStore = GroupStore()
    
    @State private var groupName = ""
    @State private var users: [User] = [User]()

    var navigationTitle: String {
        if groupName.isEmpty {
            return "Group"
        }
        return groupName
    }
    
    var body: some View {
            NavigationView {
                VStack {
                    Form {
                        Section {
                            TextField("Name", text: $groupName)
                        }
                        
                        Section() {
                            HStack {
                                
                            }
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
                }
             
                .navigationTitle(Text(navigationTitle))
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Create")
                        }

                    }
                    
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
            }
        }
    }

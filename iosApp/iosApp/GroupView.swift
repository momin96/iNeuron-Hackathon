//
//  GroupView.swift
//  iosApp
//
//  Created by Nasir Ahmed Momin on 18/06/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared

class GroupStore: ObservableObject {
    
    @Published var errorMessage: String?
    
    let groupViewModel = GroupViewModel()
    
    func createGroup(with name: String, users: [User]) {
        groupViewModel.createGroup(name: name, users: users) { [weak self] state in
            if let errorState = state as? ErrorState {
                self?.errorMessage = errorState.throwable.message
            }
        }
    }
}

struct GroupView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var store = GroupStore()

    @State private var groupName = ""
    @State private var users: [User] = [User]()

    private var errorBinding: Binding<Bool> {
        Binding<Bool> { store.errorMessage != nil }
        set: { _ in
            store.errorMessage = nil
        }
    }
    
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
                    .alert(store.errorMessage ?? "",
                           isPresented: errorBinding) {
                        Text("Error")
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

//
//  UserListView.swift
//  iosApp
//
//  Created by Nasir Ahmed Momin on 18/06/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import shared


class UserListStore: ObservableObject {
    
    let users: [User]
    
    init() {
        self.users = UserListViewModel().usersList()
    }
    
}

struct UserListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var store = UserListStore()
    @State private var usersList = [User]()
    
    @Binding var bindedUsers: [User]
    var showGroup: Bool
    
    @State private var showGroupSheet = false
    
    var body: some View {
        Form {
            List {
                if showGroup {
                    Section {
                        
                        HStack {
                            Button(action: {
                                showGroupSheet = true
                            }, label: {
                                Text("Choose Group").foregroundColor(.primary)
                            })
                        }
                        .sheet(isPresented: $showGroupSheet) {
                            GroupListView(bindedUserList: $bindedUsers)
                        }
                    }
                }
                Section{
                    ForEach(store.users, id: \.self) { user in
                        
                        Button {
                            if let removalIndex = usersList.firstIndex(of: user) {
                                usersList.remove(at: removalIndex)
                            } else {
                                usersList.append(user)
                            }
                        } label: {
                            HStack {
                                Text(user.name)
                                    .foregroundColor(.primary)
                                Spacer()
                                if usersList.contains(user) {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.confirmationAction) {
                    Button {
                        bindedUsers = usersList
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}

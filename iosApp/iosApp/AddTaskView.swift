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

struct AddTaskView: View {
    
    @State private var taskName: String = ""
    @State private var users: [User] = [User]()

    
    var body: some View {
        
        NavigationView {
            
            VStack {
                TextField("Enter task name", text: $taskName)
                
                if users.isEmpty {
                    NavigationLink {
                        UserListView(bindedUsers: $users)
                    } label: {
                        Text("Select Members")
                    }
                } else {
                    List {
                        ForEach(users, id: \.self) { user in
                            /*@START_MENU_TOKEN@*/Text(user.name)/*@END_MENU_TOKEN@*/
                        }
                    }
                }
                Button {
                    
                } label: {
                    Text("Create Task")
                }
            }
        }
    }
}

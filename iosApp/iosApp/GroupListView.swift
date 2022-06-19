//
//  GroupListView.swift
//  iosApp
//
//  Created by Nasir Ahmed Momin on 19/06/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import shared
import SwiftUI

class GroupListStore: ObservableObject {
    
    let groupListViewModel = GroupListViewModel()
    
    var groups: [MembersGroup]
    
    init() {
        groups = groupListViewModel.groupList()
    }
    
}

struct GroupListView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var store = GroupListStore()
    
    @Binding var bindedUserList: [User]
    
    var body: some View {
        List {
            ForEach(store.groups, id: \.self) { group in
                HStack {
                    Button {
                        bindedUserList = group.members
                        dismiss()
                    } label: {
                        HStack {
                            Text(group.name)
                            Spacer()
                            Image(systemName: "person")
                            Text("\(group.members.count)")
                        }
                        .foregroundColor(.primary)
                    }
                }
            }
            .navigationTitle(Text("Select Group"))
        }
    }
}

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
    
    @StateObject private var store = GroupListStore()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.groups, id: \.self) { group in
                    HStack {
                        Button {
                            
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
            }
            .navigationTitle(Text("Select Group"))
        }
    }
}

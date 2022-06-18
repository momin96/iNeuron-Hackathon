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
    
    let groups: [Group]
    
    init() {
        groups = groupListViewModel.groupList()
    }
    
}

struct GroupListView: View {
    
    @StateObject private var store = GroupListStore()
    
    var body: some View {
        List {
            ForEach(store.groups, id: \.self) { group in
                HStack {
                    Button {
                        
                    } label: {
                        HStack {
                            Text(group.name)
                            Spacer()
                            Text(group.members.count)
                            Image(systemName: "person")
                        }
                    }

                }
            }
        }
    }
}

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
    
    
}

struct GroupListView: View {
    
    @StateObject private var store = GroupListStore()
    
    var body: some View {
        Text("Group View")
    }
}

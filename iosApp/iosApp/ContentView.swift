import SwiftUI
import shared

struct ContentView: View {
    var body: some View {
        AddTaskView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


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

class UserListStore: ObservableObject {
    
    let users: [User]
    
    init() {
        self.users = UserListViewModel().usersList()
    }
    
}

struct UserListView: View {
       
    
    @StateObject private var store = UserListStore()
    @State private var usersList = [User]()
    
    @Binding var bindedUsers: [User]

    
    var body: some View {
        
        VStack {
            List {
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

            Button {
                bindedUsers = usersList
            } label: {
                Text("Done")
            }
        }
    }
}

import SwiftUI
import shared


class UserViewModel: ObservableObject {
    
//    let userList: [User]
    
    init() {
//        self.userList = UserViewModel().userList
    }
    
}

struct ContentView: View {

    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
        
        AddTaskView()
//        List {
//            ForEach($viewModel.userList, id: \.self) { user in
//                Text(user.name)
//            }
//        }
        
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
                        UserListView(bindingUser: $users)
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


struct User: Hashable {
    let name: String
    init(_ name: String) {
        self.name = name
    }
}

struct UserListView: View {
   
    let users = [User("A"), User("B"), User("C"), User("D")]
    
    @Binding var bindingUser: [User]
    @State private var usersList = [User]()
    
    var body: some View {
        VStack {
            List {
                ForEach(users, id: \.self) { user in
                    
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
                bindingUser = usersList
            } label: {
                Text("Done")
            }
        }
    }
}

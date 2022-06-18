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
    
    var body: some View {
        
        Form {
            VStack {
                TextField("Enter task name", text: $taskName)
                
                
            }
            Button {
                
            } label: {
                Text("Create Task")
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
    
    
    var body: some View {
      
        List {
            ForEach(users, id: \.self) { user in
                
                Button {
                    
                    if let removalIndex = bindingUser.firstIndex(of: user) {
                        bindingUser.remove(at: removalIndex)
                    } else {
                        bindingUser.append(user)

                    }
                    
                } label: {
                    Text(user.name)
                        .foregroundColor(.primary)
                }
            }
        }
        
    }
}

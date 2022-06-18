import SwiftUI
import shared

struct ContentView: View {
	let greet = Greeting().greeting()
    let fetcher = UserFetcher()

	var body: some View {
		
        List {
            ForEach(fetcher.usersList(), id: \.self) { user in
                Text(user.name)
            }
        }
        
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

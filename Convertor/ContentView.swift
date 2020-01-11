import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Converter(method: .temperature)
                .tabItem {
                    Image(systemName: "thermometer")
                    Text("Temperature")
                }.tag(0)
            Converter(method: .lenght)
                .tabItem {
                    Image(systemName: "slash.circle")
                    Text("Length")
                }.tag(1)
            Converter(method: .time)
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("Time")
                }.tag(2)
            Converter(method: .volume)
                .tabItem {
                    Image(systemName: "cube")
                    Text("Volume")
                }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

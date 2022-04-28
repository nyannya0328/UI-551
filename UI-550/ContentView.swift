//
//  ContentView.swift
//  UI-550
//
//  Created by nyannyan0328 on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab : Tab = .bookmark
    var body: some View {
        VStack(spacing:0){
            
            
            TabView(selection: $currentTab) {
                
                
                Text("A")
                    .TabBG()
                    .tag(Tab.bookmark)
                
                Text("B")
                    .TabBG()
                    .tag(Tab.time)
                
                Text("C")
                    .TabBG()
                    .tag(Tab.camera)
                
                Text("D")
                    .TabBG()
                    .tag(Tab.chat)
                
                Text("E")
                    .TabBG()
                    .tag(Tab.settings)
                
                
            }
            
            CustomTabBar(currentTab: $currentTab)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func TabBG()->some View{
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BG"))
    }
}

enum Tab : String,CaseIterable{
    case bookmark = "Bookmark"
    case time = "Time"
    case camera = "Camera"
    case chat = "Chat"
    case settings = "Settings"
    
}

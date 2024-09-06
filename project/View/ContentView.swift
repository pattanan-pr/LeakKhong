//
//  ContentView.swift
//  project
//
//  Created by Pattanan on 6/9/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    var body: some View {
       
            Text("Hello, world!")
            .onAppear{
                DispatchQueue
                    .main
                    .asyncAfter(deadline: .now() + 5){
                        launchScreenManager.dismiss()
                    }
            }
    
    }
}

#Preview {
    ContentView().environmentObject(LaunchScreenManager())
}

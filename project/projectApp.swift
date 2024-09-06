//
//  projectApp.swift
//  project
//
//  Created by Pattanan on 6/9/2567 BE.
//

import SwiftUI

@main
struct projectApp: App {
    @StateObject var launchScreenManager = LaunchScreenManager()
    var body: some Scene {
        WindowGroup {
            ZStack{
                ContentView()
                if launchScreenManager.state != .completed{
                    LaunchScreen()
                }
            }
            .environmentObject(launchScreenManager)
        }
    }
}

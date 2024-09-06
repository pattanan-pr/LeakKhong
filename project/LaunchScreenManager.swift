//
//  LaunchScreenManager.swift
//  project
//
//  Created by Pattanan on 6/9/2567 BE.
//

import Foundation

enum LaunchScreenPhase {
    case first
    case second
    case completed
}

final class LaunchScreenManager: ObservableObject{
    @Published private(set) var state: LaunchScreenPhase = .first
    
    func dismiss() {
        self.state = .second
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.state = .completed
        }
    }
}

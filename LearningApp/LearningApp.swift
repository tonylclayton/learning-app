//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Tony Clayton on 9/5/22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}

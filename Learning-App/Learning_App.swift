//
//  Learning_AppApp.swift
//  Learning-App
//
//  Created by John Jeang on 3/31/21.
//

import SwiftUI

@main
struct Learning_App: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}

//
//  FireGallery_SwiftUIApp.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 3/2/23.
//

import SwiftUI

@main
struct FireGallery_SwiftUIApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var mainVM: MainViewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(mainVM)
        }
        
    }
}

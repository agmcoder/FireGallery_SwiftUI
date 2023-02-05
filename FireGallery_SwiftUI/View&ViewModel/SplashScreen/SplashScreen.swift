//
//  SplashScreen.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 5/2/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive: Bool = false

    var body: some View {
        ZStack {
            if isActive {
                MainView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.bottom)
                
            } else {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                Image("SplashScreenIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .offset(x: 0, y: -20)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isActive = true
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

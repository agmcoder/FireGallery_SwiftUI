//
//  ContentView.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 3/2/23.
//

import SwiftUI

struct ContentView: View {
   

    var body: some View {
        VStack {
            MainView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.bottom)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

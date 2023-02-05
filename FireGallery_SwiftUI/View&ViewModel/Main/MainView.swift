//
//  MainView.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 3/2/23.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        VStack(alignment: .center){
            Header()
                .frame(maxWidth: .infinity,
                       maxHeight: UIScreen.main.bounds.height / 10)
                .background(Color.white.opacity(0.5))

            ImagesContainer()

            Spacer()
            
        }
    
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

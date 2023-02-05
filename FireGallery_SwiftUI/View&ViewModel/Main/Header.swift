//
//  Header.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 3/2/23.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject var mainVM: MainViewModel
    var body: some View {
        
        HStack {
            VStack {
                Image(systemName: "plus.circle")
            } // VStack
            .frame(width: UIScreen.main.bounds.width / 3)
            
            VStack {
                if mainVM.isSelecting {
                    Text("Select Items")
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                } else {
                    Text("All photos")
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                }
            } // VStack
            
            .frame(width: UIScreen.main.bounds.width / 3)
            
            VStack(alignment: .leading) {
                
                //SelectButton(mainVM: mainVM)
                
                SelectImagesButton()
                
                
            } // VStack
            .frame(width: UIScreen.main.bounds.width / 3)
        } // HStack
    }
    
}


struct SelectImagesButton: View{
    @EnvironmentObject var mainVM: MainViewModel
    
    var body: some View{
        Button(mainVM.isSelecting ? "Selecting": "Select",
               action: {
            self.mainVM.isSelecting.toggle()
            self.mainVM.selectedItems.removeAll()
            print(self.mainVM.isSelecting)
        })
    }
}


struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}

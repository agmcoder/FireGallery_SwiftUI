//
//  ImagesContainer.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 3/2/23.
//

import SwiftUI

struct ImagesContainer: View {
    
    @EnvironmentObject var mainVM: MainViewModel
    
    var body: some View {
        Group{
            if mainVM.isDownloadingImages {
                UnknownProgressView()
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
            }
            else {
                DownloadedImagesContainer()
            }
        }
        .onAppear{
            self.mainVM.getAllImagesFromFirebase()

        }
        
    }
        
}

struct DownloadedImagesContainer: View {
    
    @EnvironmentObject var mainVM : MainViewModel
    private let screenWidth : CGFloat
    private let columnWidth: CGFloat
    private let columns: [GridItem]
    
    init(){
        screenWidth = UIScreen.main.bounds.width
        columnWidth = screenWidth / 3
        columns = [GridItem(.fixed(columnWidth)),
                   GridItem(.fixed(columnWidth)),
                   GridItem(.fixed(columnWidth))]
    }
    
    var body: some View{
        ScrollView{
            LazyVGrid(columns: self.columns, spacing: 0) {
                ForEach(0..<mainVM.imageItems.count, id: \.self) { index in
                    let image = self.mainVM.imageItems[index]
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            if (self.mainVM.selectedItems.contains(index) && self.mainVM.isSelecting){
                                self.mainVM.selectedItems.remove(index)
                            } else if (self.mainVM.isSelecting && !self.mainVM.selectedItems.contains(index)) {
                                self.mainVM.selectedItems.insert(index)
                            }
                        }
                        .background(self.mainVM.selectedItems.contains(index)  ? Color.red : Color.white )
                }
            } // LazyVGrid
        } // ScrollView
    }
}

struct UnknownProgressView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(3)
                
        } // VStack
    }
}


struct ImagesContainer_Previews: PreviewProvider {
    static var previews: some View {
        ImagesContainer()
    }
}

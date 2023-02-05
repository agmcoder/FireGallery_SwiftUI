//
//  MainViewModel.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 3/2/23.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var isSelecting = false
    @Published var selectedItems = Set<Int>()
    @Published var imageItems = [UIImage]()
    @Published var isDownloadingImages = false
    
    private let firebaseStorageService: FirebaseStorageServiceProtocol = FirebaseStorageService.shared

    func getAllImagesFromFirebase(){
        isDownloadingImages.toggle()
        
        self.firebaseStorageService.downloadAllImages(from: "images") { images in
            self.imageItems = images
            self.isDownloadingImages.toggle()
        }

    }
    
}

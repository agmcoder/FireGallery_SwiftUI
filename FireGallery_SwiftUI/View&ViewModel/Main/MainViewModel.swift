//
//  MainViewModel.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 3/2/23.
//

import Foundation
import SwiftUI
import PhotosUI
import os


class MainViewModel: ObservableObject {
    let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "network")
    
    @Published var isSelecting = false
    @Published var selectedItems = Set<Int>()
    @Published var imageItems = [UIImage]()
    @Published var isDownloadingImages = false
    @Published var selectedPhotosPickerItems = [PhotosPickerItem](){
        didSet{
            uploadImages(selectedPhotosPickerItems)
        }
    }

    
    private let firebaseStorageService: FirebaseStorageServiceProtocol = FirebaseStorageService.shared

    func getAllImagesFromFirebase(){
        isDownloadingImages.toggle()
        
        self.firebaseStorageService.downloadAllImages(from: "images") { images in
            self.imageItems = images
            self.isDownloadingImages.toggle()
        }

    }
    
    func uploadImages( _ selectedPhotosPickerItems: [PhotosPickerItem]) {
        logger.log("uploading images: \(selectedPhotosPickerItems.count)")
        
        firebaseStorageService.uploadImages(images: selectedPhotosPickerItems) { progress in
                    self.uploadProgress = progress
                    if progress == 1.0 {
                        self.isUploadingImages = false
                        self.uploadProgress = 0.0
                    }
                }
        
    }
    
}

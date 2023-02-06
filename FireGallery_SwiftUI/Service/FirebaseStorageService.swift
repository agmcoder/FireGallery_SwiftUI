import FirebaseStorage
import SwiftUI
import PhotosUI

protocol FirebaseStorageServiceProtocol {
    func downloadAllImages(from folder: String, completion: @escaping ([UIImage]) -> Void)
    func uploadImages(images: [PhotosPickerItem])
}

class FirebaseStorageService: FirebaseStorageServiceProtocol {
    
    static let shared = FirebaseStorageService()
    private let storage = Storage.storage()
    private let logger = CLogger(subsystem: Bundle.main.bundleIdentifier!, category: "network")
    
    func downloadAllImages(from folder: String, completion: @escaping ([UIImage]) -> Void) {
        FirebaseStorageRepository.shared.downloadAllImageData(from: folder, completion: { dataItemArray in
            var images = [UIImage]()
            for data in dataItemArray {
                if let image = UIImage(data: data) {
                    images.append(image)
                }
            }
            completion(images)
        })
    }
    
    func uploadImages(images: [PhotosPickerItem]) {
        // convert PhotosPickerItem to Data
        let data = photosPickerItemToData(images)

        // upload data to Firebase Storage
        FirebaseStorageRepository.shared.uploadImages(data: data)
    }
    
    private func photosPickerItemToData(_ photos: [PhotosPickerItem]) -> [Data] {
        logger.log("photosPickerItemToData: \(photos.count)")
        var data = [Data]()
        for photo in photos {
           
        }
        
    }
    
    
}

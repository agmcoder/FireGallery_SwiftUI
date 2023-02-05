import FirebaseStorage
import SwiftUI

protocol FirebaseStorageServiceProtocol {
    func downloadAllImages(from folder: String, completion: @escaping ([UIImage]) -> Void)
    func uploadImages(images: [Image])
}

class FirebaseStorageService: FirebaseStorageServiceProtocol {
    
    static let shared = FirebaseStorageService()
    private let storage = Storage.storage()
    
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
    
    func uploadImages(images: [Image]) {
        
    }

    
}

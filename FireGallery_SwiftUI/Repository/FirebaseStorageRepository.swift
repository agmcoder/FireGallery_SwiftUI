//
//  FirebaseStorageRepository.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 4/2/23.
//

import FirebaseStorage
import SwiftUI

protocol FirebaseStorageRepositoryProtocol {
    
    func downloadAllImageData(from folder: String, completion: @escaping ([Data]) -> Void)
    func uploadImageDataItems(dataArrayItems: [Data])
}

class FirebaseStorageRepository: FirebaseStorageRepositoryProtocol {
    
    static let shared = FirebaseStorageRepository()
    private let storage = Storage.storage()
    
    func downloadAllImageData(from folder: String, completion: @escaping ([Data]) -> Void) {
        
        getItemReferences(imagesRef: storage.reference(), folder: folder) { (result, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                if let result = result {
                    self.downloadImageDataItems(result: result, completion: completion)
                }
            }
        }
        
    }
    
    func uploadImageDataItems(dataArrayItems: [Data]) {
        
    }

    private func getItemReferences(imagesRef: StorageReference, folder: String, completion: @escaping (StorageListResult?, Error?) -> Void) {
        let imagesRef = storage.reference().child(folder)

        imagesRef.listAll { (result, error) in
            completion(result, error)
        }
    }
    
    private func downloadImageDataItems(result: StorageListResult?, completion: @escaping ([Data]) -> Void){
        if let result = result {
            var dataItemsArray = [Data]()
            for item in result.items {
                item.getData(maxSize: INT64_MAX) { (data, error) in
                    if let error = error {
                        print("Error: \(error)")
                        return
                    }
                    if let data = data {
                        dataItemsArray.append(data)
                    }
                    if dataItemsArray.count == result.items.count {
                        completion(dataItemsArray)
                    }
                }
            }
        }
    }
    
    
    
    
}

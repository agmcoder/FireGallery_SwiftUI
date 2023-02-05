//
//  ImageItem.swift
//  FireGallery_SwiftUI
//
//  Created by agmcoder on 3/2/23.
//

import SwiftUI

struct ImageItem: Identifiable
{
    
    let id: UUID = UUID()
    let name: String
    let imageData: Data
    
}

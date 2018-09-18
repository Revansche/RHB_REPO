//
//  FileService.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 14/08/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

enum ImageDataError: Error {
    case ImageFileCorrupt
}

extension ImageDataError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .ImageFileCorrupt:
            return NSLocalizedString("Cannot converse image to data.", comment: "Image Corrupt")
        }
        
    }
}

class FileService: NSObject {
    
    static func saveImageToDocument(forImage image: UIImage, withTitle title: String) -> (URL?, Error?) {
        // get the documents directory url
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(title).appendingPathExtension("jpg")
        if let data = UIImageJPEGRepresentation(image, 1.0) {
            do {
                // delete existing data
                if FileManager.default.fileExists(atPath: fileURL.path) {
                    try FileManager.default.removeItem(atPath: fileURL.path)
                }
            
                // writes the image data to disk
                try data.write(to: fileURL)
                return (fileURL, nil)
            } catch {
                print("error saving file:", error)
                return (nil, error)
            }
        } else {
            return (nil, ImageDataError.ImageFileCorrupt)
        }
    }
    
}

//
//  ImagePredictor.swift
//  Runner
//
//  Created by Nguyen Quyet on 28/10/2022.
//

import Foundation
import UIKit

class ImagePredictor {
    let modelPath: String;

    init(path: String) {
        self.modelPath = path
    }

    lazy var module: VisionTorchModule = {
        if let module = VisionTorchModule(fileAtPath: self.modelPath) {
                return module
        } else {
            fatalError("Failed to load model!")
        }
    }()

}

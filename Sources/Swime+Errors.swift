//
//  Swime+Errors.swift
//  
//
//  Created by Radzivon Bartoshyk on 25/10/2022.
//

import Foundation

public struct SwimeInvalidURLError: LocalizedError {
    let url: URL

    public var errorDescription: String? {
        "Swime cannot open the url: \(url.absoluteString)"
    }

}

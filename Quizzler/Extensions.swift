//
//  Extensions.swift
//  Quizzler
//
//  Created by Muhammad Yusuf Rosman on 22/06/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

extension Bundle {
    var apiBaseURL: String {
        return object(forInfoDictionaryKey: "Flavor") as? String ?? ""
    }
}

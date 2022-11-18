//
//  Ext+String.swift
//  GeometricShapes
//
//  Created by Nuriddinov Subkhiddin on 14/11/22.
//

import UIKit

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }

    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
  }

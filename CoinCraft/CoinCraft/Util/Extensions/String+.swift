//
//  String+.swift
//  CoinCraft
//
//  Created by Buxi on 2020/02/11.
//  Copyright © 2020 Buxi. All rights reserved.
//

import UIKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \">%@</span>", self)

        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        return attrStr
        
//        guard let data = data(using: .utf8) else { return NSAttributedString() }
//        do {
//            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html,
//                                                                .characterEncoding:String.Encoding.utf8.rawValue,
//                                                                .], documentAttributes: nil)
//        } catch {
//            return NSAttributedString()
//        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

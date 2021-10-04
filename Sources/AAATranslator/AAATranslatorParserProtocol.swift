//
//  File.swift
//  
//
//  Created by Léo on 20/09/2021.
//

import Foundation
enum AAATranslatorParserError: Error {
    case invalidFile
}
public protocol AAATranslatorParser {
    
    
    init(files:[String:URL])
    func load(_ key:String) throws -> [String:String]
    func keys() -> [String]
}

public struct AAATranslatorParserDefault : AAATranslatorParser {
    
    internal let files : [String:URL]
    public init(files: [String:URL]) {
        self.files = files
    }
    
    public func load(_ key: String) throws -> [String : String] {
        
        guard let url = files[key] else {
            throw AAATranslatorParserError.invalidFile
        }
        
        guard let jsonData = try? Data(contentsOf: url),
              let items = try? JSONDecoder().decode([String:[String:String]].self, from: jsonData)
        else {
            throw AAATranslatorParserError.invalidFile
        }
        var flatTab : [String:String] = [:]
        for view in items.keys{
            if let tokens = items[view]{
                for token in tokens{
                    flatTab["\(view).\(token.key)"] = token.value
                }
            }
        }
        return flatTab
        
    }
    
    public func keys() -> [String] {
        return Array(files.keys)
    }
}

//
//  Hint.swift
//  MillionaireApp
//
//  Created by Никита Ясеник on 08.02.2023.
//

import Foundation


struct Hint {
    var hintName: String
    var isUsed: Bool
    var completion: (QuestionModel.Question) -> ()
    
    
    init(hintName: String,
         isUsed: Bool,
         completion: @escaping (QuestionModel.Question) -> Void) {
        self.hintName = hintName
        self.isUsed = isUsed
        self.completion = completion
        
    }
}

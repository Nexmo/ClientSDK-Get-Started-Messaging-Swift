//
//  Constants.swift
//  GettingStarted
//
//  Created by Paul Ardeleanu on 19/11/2019.
//  Copyright © 2019 Nexmo. All rights reserved.
//

import Foundation


enum User: String {
    case jane = "Jane"
    case joe = "Joe"
    
    var uuid: String {
        switch self {
        case .jane:
            return "" //TODO: swap with Jane's user uuid
        case .joe:
            return "" //TODO: swap with Joe's user uuid
        }
    }
    
    var jwt: String {
        switch self {
        case .jane:
            return "" //TODO: swap with a token for Jane
        case .joe:
            return "" //TODO: swap with a token for Joe
        }
    }
    
    static let conversationId = "" //TODO: swap with a conversation id
    
    var interlocutor: User {
        switch self {
        case .jane:
            return User.joe
        case .joe:
            return User.jane
        }
    }
}

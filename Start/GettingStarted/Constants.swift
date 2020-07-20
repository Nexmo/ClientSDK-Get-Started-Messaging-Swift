//
//  Constants.swift
//  GettingStarted
//
//  Created by Paul Ardeleanu on 19/11/2019.
//  Copyright © 2019 Nexmo. All rights reserved.
//

import Foundation


enum User: String {
    case alice = "Alice"
    case bob = "Bob"
    
    var uuid: String {
        switch self {
        case .alice:
            return "" //TODO: swap with Alice's user uuid
        case .bob:
            return "" //TODO: swap with Bobs's user uuid
        }
    }
    
    var jwt: String {
        switch self {
        case .alice:
            return "" //TODO: swap with a token for Alice
        case .bob:
            return "" //TODO: swap with a token for Bob
        }
    }
    
    static let conversationId = "" //TODO: swap with a conversation id
    
    var interlocutor: User {
        switch self {
        case .alice:
            return User.bob
        case .bob:
            return User.alice
        }
    }
}

//
//  Network.swift
//  StudyAlamofire
//
//  Created by 겸 on 2022/11/09.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
    
    public var isSuceess : Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    public var isFailure : Bool {
        return !isSuceess
    }
    
    public var value : Value? {
        switch self {
        case .success(let value):
            return value
            
        case .failure:
            return nil
        }
    }
    
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
    
}


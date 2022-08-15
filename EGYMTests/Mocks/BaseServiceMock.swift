//
//  BaseServiceMock.swift
//  EGYM Task
//
//  Created by Marium Hassan on 09.08.22.
//

import Foundation

@testable import EGYM

final class BaseServiceMock: BaseServiceProtocol {
    
    private(set) var didCallExecute = false
    var fetchAnyStub: Any?
    
    func execute<T:Codable>(action:String, completionHandler responseBlock: @escaping (Result<BaseResponse<T>,Error>?) -> Void) {
        didCallExecute = true
        if let fetchAnyStub = fetchAnyStub {
            let datObj = BaseResponse(data: fetchAnyStub as? T)
            responseBlock(.success(datObj))
        } else {
            responseBlock(.failure(NSError(domain: "", code: 0)))
        }
    }
    
}



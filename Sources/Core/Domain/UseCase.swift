//
//  File.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import Foundation
import Combine
 
public protocol UseCase {
    associatedtype Request
    associatedtype Response
    associatedtype Responseaddfav
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
    func executeaddfav(request: Request?,  id: Int, fav: Bool) -> AnyPublisher<Responseaddfav, Error>
}

public protocol UseCaseFavorite {
    associatedtype Request
    associatedtype Response
    
    func executefav(request: Request?) -> AnyPublisher<Response, Error>
}

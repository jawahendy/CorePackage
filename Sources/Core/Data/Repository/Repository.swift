//
//
//  File.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import Combine
 
public protocol Repository {
    associatedtype Request
    associatedtype Response
    associatedtype Responseaddfav
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
    func executeaddfav(request: Request?, id: Int, fav: Bool) -> AnyPublisher<Responseaddfav, Error>
}

public protocol RepositoryFavorite {
    associatedtype Request
    associatedtype Response
    
    func executefav(request: Request?) -> AnyPublisher<Response, Error>
}

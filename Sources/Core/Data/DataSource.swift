//
//  File.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import Combine
 
public protocol DataSource {
    associatedtype Request
    associatedtype Response
    associatedtype Responseaddfav
    
    func getCategories(request: Request?) -> AnyPublisher<Response, Error>
    func addCategoriesFavorite(request: Request?, id: Int, fav: Bool) -> AnyPublisher<Responseaddfav, Error>
}

public protocol DataSourceFavorite {
    associatedtype Request
    associatedtype Response
    
    func getCategoriesFavorite(request: Request?) -> AnyPublisher<Response, Error>
}

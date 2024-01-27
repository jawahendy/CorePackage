//
//  File.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import Foundation
 
public protocol Mapper {
    associatedtype Response
    associatedtype Domain
    associatedtype Responseaddfav
    associatedtype Domainaddfav
    
    func transformEntityToDomain(entity: Response) -> Domain
    func transformEntityToDomainAddfav(entity: Responseaddfav) -> Domainaddfav
}

public protocol MapperFavorite {
    associatedtype Response
    associatedtype Domain
    
    func transformEntityToDomainFav(entity: Response) -> Domain
}

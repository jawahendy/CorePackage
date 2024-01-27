//
//  File 2.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import Foundation
import Combine

public struct Interactor<Request, Response, Responseaddfav, R: Repository>: UseCase
where R.Request == Request, R.Response == Response, R.Responseaddfav == Responseaddfav {
  
  private let _repository: R
  
  public init(repository: R) {
    _repository = repository
  }
  
    @available(iOS 13.0, *)
    public func execute(request: Request?) -> AnyPublisher<Response, Error> {
    _repository.execute(request: request)
  }
    
    public func executeaddfav(request: Request?,id: Int, fav: Bool) -> AnyPublisher<Responseaddfav, Error> {
    _repository.executeaddfav(request: request, id: id, fav: fav)
  }
}

public struct InteractorFavorite<Request, Response, R: RepositoryFavorite>: UseCaseFavorite
where R.Request == Request, R.Response == Response {
  
  private let _repository: R
  
  public init(repository: R) {
    _repository = repository
  }
  
    @available(iOS 13.0, *)
    public func executefav(request: Request?) -> AnyPublisher<Response, Error> {
    _repository.executefav(request: request)
  }
}

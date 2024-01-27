//
//  File.swift
//  
//
//  Created by Hendy Nurfrianto on 25/01/24.
//

import SwiftUI
import Combine

@available(iOS 13.0, *)
public class GetListPresenter<Request, Response, Responseaddfav, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == [Response], Interactor.Response == [Response],
Interactor.Responseaddfav == [Responseaddfav]
{

  private var cancellables: Set<AnyCancellable> = []

  private let _useCase: Interactor

  @Published public var list: [Response] = []
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false
  @Published public var listfav: [Responseaddfav] = []

  public init(useCase: Interactor) {
    _useCase = useCase
  }

  public func getList(request: Request?) {
    isLoading = true
    _useCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { list in
        self.list = list
      })
      .store(in: &cancellables)
  }
    public func Addfavorit(request: Request?, id: Int, fav: Bool) {
      isLoading = false
      _useCase.executeaddfav(request: request, id: id, fav: fav)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
          switch completion {
          case .failure(let error):
            self.errorMessage = error.localizedDescription
            self.isError = true
            self.isLoading = false
          case .finished:
            self.isLoading = false
          }
        }, receiveValue: { listfav in
            self.listfav = listfav
        })
        .store(in: &cancellables)
    }
}


public class GetListFavoritePresenter<Request, Response, Interactor: UseCaseFavorite>: ObservableObject where Interactor.Request == Request, Interactor.Response == [Response] {

  private var cancellables: Set<AnyCancellable> = []

  private let _useCase: Interactor

  @Published public var list: [Response] = []
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false

  public init(useCase: Interactor) {
    _useCase = useCase
  }

  public func getListFavorit(request: Request?) {
    isLoading = true
    _useCase.executefav(request: request)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { list in
        self.list = list
      })
      .store(in: &cancellables)
  }
}

//
//  MainStoriesRouterMock.swift
//  EGYM Task
//
//  Created by Marium Hassan on 09.08.22.
//

import UIKit

@testable import EGYM
final class MainStoriesViewMock:  MainStoriesViewProtocol{

    private(set) var didCallReloadTableView = false
    private(set) var didCallAnimateLoadingView = false
    init() {}
    
    var navigation: UINavigationController? {
        nil
    }
    
    
    func reloadTableView() {
        didCallReloadTableView = true
    }
   
    func animateLoadingView(loading: Bool) {
        didCallAnimateLoadingView = true
    }
    
}
    
   










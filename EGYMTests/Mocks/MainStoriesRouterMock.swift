//
//  MainStoriesRouterMock.swift
//  EGYM Task
//
//  Created by Marium Hassan on 09.08.22.
//

import UIKit

@testable import EGYM
final class MainStoriesRouterMock:  MainStoriesRouterProtocol{
    
    private(set) var didCallNavigateToInitialVC = false
    private(set) var didCallNavigateToDetailScreen = false
    init() {}
    
    func navigateToDetailScreen(story: MainStoryListModel, navigation: UINavigationController?) {
        didCallNavigateToDetailScreen = true
    }
    func navigateToInitialVC() -> UIViewController? {
        didCallNavigateToInitialVC = true
        return nil
    }
    
}
    
   










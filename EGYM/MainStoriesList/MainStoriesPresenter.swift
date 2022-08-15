//
//  MainStoriesPresenter.swift
//  EGYM Task
//
//  Created by Marium Hassan on 09.08.22.
//

import UIKit

protocol MainStoriesPresenterProtocol {
    var view: MainStoriesViewProtocol? { get set }
    var storiesList: [Int: [MainStoryListModel]] { get }
    var navigationTitle: String { get }
    func notifyViewDidLoad()
    var sectionTitle: [String] { get }
    func userSelectedStory(inSec: Int, atRow: Int)
}

final class MainStoriesPresenter: MainStoriesPresenterProtocol {

    //MARK: - Properties
    private let router: MainStoriesRouterProtocol
    private let interactor: MainStoriesInteractorProtocol
    private var storiesModel: [Int: [MainStoryListModel]] = [2: [MainStoryListModel]()]
    
    init(router: MainStoriesRouterProtocol, interactor: MainStoriesInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }

    // MARK: - MainStoriesPresenterProtocol
    
    weak var view: MainStoriesViewProtocol?
    var storiesList: [Int: [MainStoryListModel]] {
        return storiesModel
    }
    
    var sectionTitle: [String] {
        return TableSectionTitle.allCases.map({ $0.rawValue })
    }
    
    var navigationTitle: String {
        "Top Stories"
    }
    
    func notifyViewDidLoad() {
        self.view?.animateLoadingView(loading: true)
        self.interactor.fetchTopStories(completion: { [weak self]
            result in
            self?.view?.animateLoadingView(loading: false)
            switch result {
            case .success(let response):
                self?.storiesModel  = response
                self?.view?.reloadTableView()
            case .failure(let error):
                print(error)
            case .none:
                print("")
            }
        })
    }
    
    func userSelectedStory(inSec: Int, atRow: Int) {
        if let story = storiesModel[inSec]?[atRow] {
            router.navigateToDetailScreen(story: story, navigation: view?.navigation)
        }
    }
    
}

enum TableSectionTitle: String, CaseIterable {
    case emailed = "Most Emailed Articles"
    case shared = "Most Shared Articles"
    case viewed = "Most Viewed Articles"
}






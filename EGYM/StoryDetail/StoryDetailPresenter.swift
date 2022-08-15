//
//  MainStoriesPresenter.swift
//  EGYM Task
//
//  Created by Marium Hassan on 09.08.22.
//

import UIKit

protocol StoryDetailPresenterProtocol {
    var storyDetail: StoryDetailModuleArgs { get }
    var navigationTitle: String { get }
    var view: StoryDetailViewProtocol? { set get }
    func notifyViewDidLoad()
}

final class StoryDetailPresenter: StoryDetailPresenterProtocol {

    //MARK: - Properties
    private var storyModel: StoryDetailModuleArgs?
    
    init(moduleArgs: StoryDetailModuleArgs) {
        self.storyModel = moduleArgs
    }
    
    //MARK: - StoryDetailPresenterProtocol
    
    weak var view: StoryDetailViewProtocol?
    var storyDetail: StoryDetailModuleArgs {
        storyModel!
    }
    var navigationTitle: String {
        "Story Detail"
    }
    
    func notifyViewDidLoad() {
        guard let story = storyModel else { return }
        view?.setStoryDetail(args: story)
    }
    
    
}








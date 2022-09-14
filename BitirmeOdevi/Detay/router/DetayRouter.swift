//
//  DetayRouter.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 6.09.2022.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayVC) {
        let presenter = DetayPresenter()
        
        //View
        ref.detayPresenterNesnesi = presenter
        
        //Presenter
        ref.detayPresenterNesnesi?.detayInteractor = DetayInteractor()
        ref.detayPresenterNesnesi?.detayView = ref as? PresenterToViewDetayProtocol 
        
        //Interactor
        ref.detayPresenterNesnesi?.detayInteractor?.detayPresenter = presenter
    }
}

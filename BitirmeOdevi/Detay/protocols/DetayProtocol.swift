//
//  DetayProtocol.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 6.09.2022.
//

import Foundation

protocol ViewToPresenterDetayProtocol {
    var detayInteractor:PresenterToInteractorDetayProtocol? {get set}
    
    var detayView:PresenterToViewDetayProtocol? {get set}
    
    func sepeteEkle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:Int, yemek_siparis_adet:Int, kullanici_adi:String)
}

protocol PresenterToInteractorDetayProtocol {
    var detayPresenter:InteractorToPresenterDetayProtocol? {get set}
    
    func sepeteYemekEkle(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:Int, yemek_siparis_adet:Int, kullanici_adi:String)
}

protocol InteractorToPresenterDetayProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToViewDetayProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToRouterDetayProtocol {
    static func createModule(ref:DetayVC)
}

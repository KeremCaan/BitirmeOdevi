//
//  SepetProtocols.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 8.09.2022.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    
    func sepetiYukle(kullanici_adi:String)
    func sil(sepet_yemek_id:String,kullanici_adi:String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    
    func tumSepetiYukle(kullanici_adi:String)
    func yemekSil(sepet_yemek_id:String,kullanici_adi:String)
}

//Taşıyıcı protocoller
protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<SepetYemekler>)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<SepetYemekler>)
}

//Router
protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}

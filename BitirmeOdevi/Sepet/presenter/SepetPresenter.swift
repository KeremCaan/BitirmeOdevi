//
//  SepetPresenter.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 8.09.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    func sepetiYukle(kullanici_adi: String) {
        sepetInteractor?.tumSepetiYukle(kullanici_adi: kullanici_adi)
    }
    
    
    func sil(sepet_yemek_id: String, kullanici_adi: String) {
        sepetInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    

}

extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<SepetYemekler>) {
        sepetView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}

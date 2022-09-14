//
//  AnasayfaInteractor.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 4.09.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumYemekleriAl() {
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data!)
                if let liste = cevap.yemekler {
                    self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}

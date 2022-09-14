//
//  SepetInteractor.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 8.09.2022.
//

import Foundation
import Alamofire

class SepetInteractor : PresenterToInteractorSepetProtocol {
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func tumSepetiYukle(kullanici_adi: String) {
        /*var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php")!)
        istek.httpMethod = "POST"
        let postString = "kulanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data!)
                if let liste = cevap.yemekler {
                    self.sepetPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()*/
        let params:Parameters = ["kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    print(cevap)
                    if let liste = cevap.sepet_yemekler {
                        print(liste)
                        self.sepetPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                    }
                }catch{
                    self.sepetPresenter?.presenteraVeriGonder(yemeklerListesi: [])
                }
            }
        }
    }
    
    func yemekSil(sepet_yemek_id: String, kullanici_adi: String) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php")!)
        istek.httpMethod = "POST"
        let postString = "sepet_yemek_id=\(sepet_yemek_id)&kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            do{
                let cevap = try JSONSerialization.jsonObject(with: data!)
                print(cevap)
                self.tumSepetiYukle(kullanici_adi: kullanici_adi)
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}


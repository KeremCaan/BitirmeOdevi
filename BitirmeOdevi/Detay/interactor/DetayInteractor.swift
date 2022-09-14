//
//  DetayInteractor.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 6.09.2022.
//

import Foundation
import Alamofire

class DetayInteractor : PresenterToInteractorDetayProtocol {
    var detayPresenter: InteractorToPresenterDetayProtocol?
    
    func sepeteYemekEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        let params:Parameters = ["yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do{
                    try JSONSerialization.jsonObject(with: data)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        /*var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php")!)
        istek.httpMethod = "POST"
        let postString = "yemek_adi=\(yemek_adi)&yemek_resim_adi=\(yemek_resim_adi)&yemek_fiyat=\(yemek_fiyat)&yemek_siparis_adet=\(yemek_siparis_adet)&kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            do{
                try JSONSerialization.jsonObject(with: data!)
            }catch{
                print(error.localizedDescription)
            }
        }.resume()*/
    }
}

//
//  DetayVC.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 2.09.2022.
//

import UIKit
import Kingfisher
import FirebaseAuth

class DetayVC: UIViewController {
    
    @IBOutlet weak var ivYemek: UIImageView!
    @IBOutlet weak var lblYemek: UILabel!
    @IBOutlet weak var lblYemekSayisi: UILabel!
    
    var yemek:Yemekler?
    var detayPresenterNesnesi:ViewToPresenterDetayProtocol?
    
    var kullanici_adi = Auth.auth().currentUser?.email

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetayRouter.createModule(ref: self)

        lblYemekSayisi.text = "1"
        
        if let y = yemek {
            lblYemek.text = "\(y.yemek_adi!) - \(y.yemek_fiyat!) ₺"
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    self.ivYemek.kf.setImage(with: url)
                }
            }
        }
    }
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let ya = yemek?.yemek_adi, let yra = yemek?.yemek_resim_adi, let yf = yemek?.yemek_fiyat, let ysa = Int(lblYemekSayisi.text!), let ka = kullanici_adi {
            detayPresenterNesnesi?.sepeteEkle(yemek_adi: ya, yemek_resim_adi: yra, yemek_fiyat: Int(yf)!, yemek_siparis_adet: ysa, kullanici_adi: ka)
        }
    }
    @IBAction func buttonArti(_ sender: Any) {
        if Int(lblYemekSayisi.text!)! >= 1 {
            lblYemekSayisi.text = String(Int(lblYemekSayisi.text!)! + 1)
        }
    }
    @IBAction func buttonEksi(_ sender: Any) {
        if Int(lblYemekSayisi.text!)! > 1 {
            lblYemekSayisi.text = String(Int(lblYemekSayisi.text!)! - 1)
        }
    }
    
}

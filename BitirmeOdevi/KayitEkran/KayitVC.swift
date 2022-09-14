//
//  KayitVC.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 2.09.2022.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseCore

class KayitVC: UIViewController {
    @IBOutlet weak var tfAd: UITextField!
    @IBOutlet weak var tfSoyad: UITextField!
    @IBOutlet weak var tfKullaniciAdi: UITextField!
    @IBOutlet weak var tfSifre: UITextField!
    @IBOutlet weak var lblHata: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblHata.text = ""
    }
    
    func dogruKayit() -> String? {
        if tfAd.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            tfSoyad.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            tfKullaniciAdi.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            tfSifre.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Lütfen tüm boşlukları doldurunuz."
        }
        
        
        return nil
    }
    
    
    @IBAction func buttonKayit(_ sender: Any) {
        let hata = dogruKayit()
        
        if hata != nil {
            lblHata.text = hata
        }else{
            let kullaniciAd = tfAd.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let kullaniciSoyAd = tfSoyad.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let kullaniciNick = tfKullaniciAdi.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let kullaniciSifre = tfSifre.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: kullaniciNick, password: kullaniciSifre) { (sonuc,yanlis) in
                if let yanlis = yanlis {
                    self.lblHata.text = "Lütfen geçerli bir e-mail adresi giriniz."
                }else{
                    let db = Firestore.firestore()
                    
                    db.collection("kullanicilar").addDocument(data: ["kullanici_isim":kullaniciAd, "kullanici_soyad":kullaniciSoyAd, "kullanici_nick":kullaniciNick, "kullanici_sifre":kullaniciSifre, "uid": sonuc!.user.uid]) { (yanlis) in
                        if yanlis != nil {
                            self.lblHata.text = "Kullanıcı oluşturulurken sorun yaşandı."
                        }
                    }
                    self.anasayfayaGit()
                }
            }
        }
    }
    
    func anasayfayaGit() {
        
        performSegue(withIdentifier: "toGiris", sender: nil)
    }
    
}

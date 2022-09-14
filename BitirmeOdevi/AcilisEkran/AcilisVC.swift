//
//  ViewController.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 2.09.2022.
//

import UIKit
import FirebaseAuth

class AcilisVC: UIViewController {
    @IBOutlet weak var tfKullaniciAdi: UITextField!
    @IBOutlet weak var tfSifre: UITextField!
    @IBOutlet weak var lblHata: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblHata.text = ""
    }
    @IBAction func buttonGiris(_ sender: Any) {
        
        let email = tfKullaniciAdi.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let sifre = tfSifre.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: sifre) {(sonuc, hata) in
            if hata != nil {
                self.lblHata.text = "Hatalı giriş yapıldı. Lütfen tekrar deneyiniz."
            }else{
                self.performSegue(withIdentifier: "toAnasayfa", sender: nil)
            }
        }
    }
    

}


//
//  SepetVC.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 2.09.2022.
//

import UIKit
import Kingfisher
import FirebaseAuth

class SepetVC: UIViewController {
    var yemeklerListe = [SepetYemekler]()
    var yemek:Yemekler?
    var sepetYemek:SepetYemekler?
    let kullanici_adi = Auth.auth().currentUser?.email
    @IBOutlet weak var sepetTableView: UITableView!
    
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        SepetRouter.createModule(ref: self)
        sepetPresenterNesnesi?.sepetiYukle(kullanici_adi: (kullanici_adi)!)
    }
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepetiYukle(kullanici_adi: (kullanici_adi)!)
    }
}
extension SepetVC : PresenterToViewSepetProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<SepetYemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
    }
}
extension SepetVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemekler = yemeklerListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewHucre
        hucre.lblUrunSayi.text = "\(yemekler.yemek_siparis_adet!) ADET"
        hucre.lblSepet.text = "\(yemekler.yemek_adi!) - \(yemekler.yemek_fiyat!) ₺"
        let yemekResim = yemekler.yemek_resim_adi
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemekResim!)") {
            DispatchQueue.main.async {
                hucre.ivSepet.kf.setImage(with: url)
            }
        }
        return hucre
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silmeIslemi = UIContextualAction(style: .destructive, title: "Çıkar"){ (ca,view,bool) in
            let yemekler = self.yemeklerListe[indexPath.row]
            self.sepetPresenterNesnesi?.sil(sepet_yemek_id: yemekler.sepet_yemek_id!, kullanici_adi: yemekler.kullanici_adi!)
        }
        
        return UISwipeActionsConfiguration(actions: [silmeIslemi])
    }
}

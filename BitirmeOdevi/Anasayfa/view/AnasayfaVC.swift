//
//  AnasayfaVC.swift
//  BitirmeOdevi
//
//  Created by MacbookPro on 2.09.2022.
//

import UIKit
import Kingfisher

class AnasayfaVC: UIViewController {
    @IBOutlet weak var yemeklerTableView: UITableView!
    
    var yemeklerListe = [Yemekler]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let yemek = sender as? Yemekler {
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.yemek = yemek
            }
        }
    }
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.yemeklerTableView.reloadData()
        }
    }
}

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemekler = yemeklerListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemeklerHucre", for: indexPath) as! TableViewHucre
        hucre.lblYemekler.text = "\(yemekler.yemek_adi!) - \(yemekler.yemek_fiyat!) ₺"
        let yemekResim = yemekler.yemek_resim_adi
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemekResim!)") {
            DispatchQueue.main.async {
                hucre.ivYemekler.kf.setImage(with: url)
            }
        }
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


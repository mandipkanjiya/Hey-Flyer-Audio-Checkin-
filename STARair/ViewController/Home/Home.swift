//
//  Home.swift
//  STARair
//
//  Created by Mandip Kanjiya on 28/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit

class Home: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var viewDeparture: UIView!
    @IBOutlet weak var collectionFlights: UICollectionView!
    @IBOutlet weak var viewDestination: UIView!
    
    var arrCities:NSArray = [["img":"ic_effile_tower","cityname":"Paris","flight":"CDG"],  ["img":"ic_ham","cityname":"Hamburg","flight":"HAM"],["img":"ic_india","cityname":"Mumbai","flight":"BOM"],
        ["img":"ic_los","cityname":"Los Angeles","flight":"CRK"],
        ["img":"ic_mad","cityname":"Madrid","flight":"MAD"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let drptTap = UITapGestureRecognizer(target: self, action: #selector(gotoSearch))
        drptTap.numberOfTapsRequired = 1
        viewDeparture.isUserInteractionEnabled = true
        viewDeparture.addGestureRecognizer(drptTap)
        
        let destTap = UITapGestureRecognizer(target: self, action: #selector(gotoSearch))
        destTap.numberOfTapsRequired = 1
        viewDestination.isUserInteractionEnabled = true
        viewDestination.addGestureRecognizer(destTap)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickMenu(_ sender: Any) {
        
        
    }
    
    @objc func gotoSearch() {
        let nextViewController = objMain.instantiateViewController(withIdentifier: "SearchFlight") as! SearchFlight
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let dicPlace = arrCities.object(at: indexPath.row) as! NSDictionary
        cell.imgPlace.image = UIImage(named: dicPlace.object(forKey: "img") as! String)
        cell.lblPlaceName.text = dicPlace.object(forKey: "cityname") as! String
        cell.lblFlightNumber.text = dicPlace.object(forKey: "flight") as! String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = objMain.instantiateViewController(withIdentifier: "SearchFlight") as! SearchFlight
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

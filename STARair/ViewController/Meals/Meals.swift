//
//  Meals.swift
//  STARair
//
//  Created by Mandip Kanjiya on 31/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit

class Meals: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionMeals: UICollectionView!
    @IBOutlet weak var btnBack: UIButton!
    
    let arrMeals:NSArray = [["image":"ic_item1","title":"Spinach omelette with chicken chipolata","desc":"Spinach omelette served with chicken chipolata, grilled tomato and backed beans"],
                    ["image":"ic_item2","title":"Butter chicken with steamed rice","desc":"Chicken in a mildly spiced curry sauce served with steamed rice and dal tadka"],
                    ["image":"ic_item3","title":"Chicken cacciatore penne pasta","desc":"Tomato based chicken cacciatore served with penne pasta"],
                    ["image":"ic_item4","title":"Chicken in oyster sauce ","desc":"Chicken and vegetables braised in oyster sauce served with fried noodles"],
                    ["image":"ic_item5","title":"Chicken Kiev with mashed potato","desc":"Garlic filled chicken breast served with creamed mashed potato, corn niblets and broccoli florets"],
                    ["image":"ic_item6","title":"Chicken masala biryani ","desc":"Traditional chicken biryani served with dal makhani and fried onions"],
                    ["image":"ic_item7","title":"Potato bhaji and chana masala ","desc":"Potato bhaji served with chana dal masala and poori"],
                    ["image":"ic_item8","title":"Potato cakes and creamy spinach","desc":"Hand-formed potato cakes with cheese served with creamed spinach; free - cut potato wedges, grilled tomato and baked beans"],
                    ["image":"ic_item9","title":"Vegetable croquettes with potato wedges ","desc":"Vegetables croquettes served with wedge potatoes green peas and a tomato sauce"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMeals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealsCell", for: indexPath) as! MealsCell
        
        let descMeals = arrMeals.object(at: indexPath.row) as! NSDictionary
        if let image = descMeals.object(forKey: "image") as? String {
            cell.imgMeals.image = UIImage(named: image)
        }
        
        if let title = descMeals.object(forKey: "title") as? String {
            cell.lblTitle.text = title
        }
        
        if let desc = descMeals.object(forKey: "desc") as? String {
            cell.lblDesc.text = desc
        }
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let oldwidth:CGFloat = 235
        let oldHeight:CGFloat = 291
        let ratio = oldHeight / oldwidth
        
        
        
        let newHeight = ((collectionView.frame.size.width - 120 )/3)*ratio
//        print(collectionView.frame.size.width - 150/3)
//        print(newHeight)
        
        return CGSize(width: (collectionView.frame.size.width - 120 )/3, height: newHeight)
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

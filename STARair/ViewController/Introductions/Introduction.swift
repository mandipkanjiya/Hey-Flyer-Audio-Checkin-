//
//  Introduction.swift
//  STARair
//
//  Created by Mandip Kanjiya on 27/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit

class Introduction: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    // MARK: - IBOutlets
    
    // MARK: - Variables
    
    // MARK: - Viewcontroller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - IBActions
    @IBAction func onClickStartBooking(_ sender: Any) {
        let nextViewController = objMain.instantiateViewController(withIdentifier: "Signup") as! Signup
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: - @objc Methods
    
    // MARK: - Custom Methods
    
    // MARK: - Collection View Delegates
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionCell", for: indexPath) as! IntroductionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
}


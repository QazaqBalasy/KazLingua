//
//  TextViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/1/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    @IBOutlet weak var tCollectionView: UICollectionView!{
        didSet{
            tCollectionView.dataSource = self
            tCollectionView.delegate = self
            let nib = UINib(nibName: "TextCollectionViewCell", bundle: nil)
            tCollectionView.register(nib, forCellWithReuseIdentifier: "TextCollectionViewCell")
//            tCollectionView.register(TextCollectionViewCell.self,forCellWithReuseIdentifier: "TextCollectionViewCell")
            //tCollectionView.collectionViewLayout = LeftAlignedCollectionViewFlowLayout()
        }
    }
    var l1:[String] = ["One"]
    var l2 = ["One","Two","Three","One","Two","Three","One","Two","Three","One","Two","Three"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}

//MARK: - Implement Collection View delegates
extension TextViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    //count of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return l1.count
        }else{
            return l2.count
        }
    }
    //"reuse" cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextCollectionViewCell", for: indexPath)
        
        if let viewCell = cell as? TextCollectionViewCell{
            if(indexPath.section == 0){
                print(indexPath.item)
                viewCell.label.text = l1[indexPath.item]
                
            }else {
                print("second %f",indexPath.item)
                viewCell.label.text = l2[indexPath.item]
            }
        }
        return cell
    }
    
    //move a selected item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.section == 0){
            collectionView.performBatchUpdates({
                collectionView.moveItem(at: indexPath, to: IndexPath.init(item: l2.count, section: 1))
                l2.insert(l1[indexPath.item], at: l2.count)
                l1.remove(at: indexPath.item)
            })
        }else{
            collectionView.performBatchUpdates({
                collectionView.moveItem(at: indexPath, to: IndexPath.init(item: l1.count, section: 0))
                l1.insert(l2[indexPath.item], at: l1.count)
                l2.remove(at: indexPath.item)
            })
        }
    }
    
    //margin , padding etc
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 100, left: 15, bottom: 100, right: 15)
    }
    
}

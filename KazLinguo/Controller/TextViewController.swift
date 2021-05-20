//
//  TextViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/1/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit

class TextViewController: UIViewController,Answerable {
    
    
    @IBOutlet weak var tCollectionView: UICollectionView!{
        didSet{
            tCollectionView.dataSource = self
            tCollectionView.delegate = self
            let nib = UINib(nibName: "TextCollectionViewCell", bundle: nil)
            tCollectionView.register(nib, forCellWithReuseIdentifier: "TextCollectionViewCell")
            let layout = UICollectionViewFlowLayout()
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            tCollectionView.collectionViewLayout = layout
        }
    }
    
    @IBOutlet weak var phraseLabel: UILabel!
    
    var phrase = ""
    var l1:[String] = ["One"]
    var l2 = ["One","Two","Three","One","Two","Three","One","Two","Three","One","Two","Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phraseLabel.text = phrase
    }
    
    
    func getAnswer() -> String {
        return l1.joined(separator: " ")
    }

}




//MARK: - Implement Collection View delegates
extension TextViewController:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //count of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2;
    }
    
    
    //return number of items in sections
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
                viewCell.label.text = l1[indexPath.item]
            }else {
                viewCell.label.text = l2[indexPath.item]
            }
        }
        
        return cell
    }
    
    
    //move selected item
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
        switch section {
        case 0:
            return UIEdgeInsets(top: 50, left: 7, bottom: 50, right: 7)
        default:
            return UIEdgeInsets(top: 70, left: 50, bottom: 20, right: 50)
            
        }
       
    }
    
    
    
    
    
}

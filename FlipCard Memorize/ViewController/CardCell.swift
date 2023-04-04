//
//  CardCell.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 26/03/2023.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    
    static let identifier = String(describing: CardCell.self)
    
    @IBOutlet weak var cardBtn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
      
        cardBtn.layer.cornerRadius = 8
        cardBtn.layer.borderWidth = 5
        cardBtn.layer.borderColor = UIColor.black.cgColor
        cardBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardBtn.layer.shadowOpacity = 20
        cardBtn.layer.shadowColor = UIColor.gray.cgColor
    }
    
    
    func setUp(_ cardItem : CardModel) {
        
        //        if isOpen {
        //
        //            isOpen = false
        //            cardBtn.setTitle("1+2 = ??", for: .normal)
        //
        //            UIView.transition(with: cardBtn, duration: 0.3,options: UIView.AnimationOptions.transitionFlipFromLeft, animations: nil)
        //
        //        }else {
        //
        //            isOpen = true
        //
        //            cardBtn.setTitle("3", for: .normal)
        //
        //            UIView.transition(with: cardBtn, duration: 0.3,options: UIView.AnimationOptions.transitionFlipFromRight, animations: nil)
        //        }
        
    }

    

}

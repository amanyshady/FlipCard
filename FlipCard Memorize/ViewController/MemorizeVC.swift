//
//  MemorizeVC.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 23/03/2023.
//

import UIKit

class MemorizeVC: UIViewController {
    
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var bluerView: UIView!
    
    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var validCradLabel: UILabel!
    
    
    var currentPage = 0
    var viewModel : MemorizeViewModel
    
    init(viewModel : MemorizeViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = MemorizeViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        initVM()
        
        viewModel.getAllCardItems()
     
    }
    
    func initVM() {
        
        self.viewModel.updateCards = { [weak self] () in
            
            guard let cardList = self?.viewModel.cardList else {return}
            
            if cardList.count > 0 {
                self?.validCradLabel.isHidden = true
                self?.collectionView.isHidden = false
                self?.collectionView.reloadData()
                
            }else {
              
                self?.collectionView.isHidden = true
                self?.validCradLabel.isHidden = false
            }
           
            
        }
        
        self.viewModel.loadingIndicator = { [weak self] () in
            
         
            
            guard let loadingStates = self?.viewModel.loadingState else{return}
            
            if loadingStates == true {
             
                self?.activeIndicator.startAnimating()
                self?.activeIndicator.isHidden = false
                self?.bluerView.isHidden = false
                
            }else {
               
                self?.activeIndicator.stopAnimating()
                self?.activeIndicator.isHidden = true
                self?.bluerView.isHidden = true
            }
        }
        
    }
    

    
}

extension MemorizeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = viewModel.numberOfCards
       return viewModel.numberOfCards
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as! CardCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width, height:collectionView.frame.height)
    }

    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int (scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        
    }
   
    
    
}



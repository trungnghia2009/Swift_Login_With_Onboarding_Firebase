//
//  OnboardingViewController.swift
//  Login_With_Onboarding
//
//  Created by trungnghia on 4/30/20.
//  Copyright © 2020 trungnghia. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var pageControll: UIPageControl!
    
    
    //MARK: - Vars and Consts
    let slides: [Slide] = Slide.slidePlaceholder
    var currentPage = 0
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
        setupPageControl()
    }
    
    //MARK: - Setup
    private func setupView() {
        titleLabel.text = slides[currentPage].title
        detailLabel.text = slides[currentPage].description
        view.backgroundColor = .systemGroupedBackground
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0.0
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    private func setupPageControl() {
        pageControll.numberOfPages = slides.count
        pageControll.currentPage = currentPage
    }
    
    
    
    //MARK: - IBActions
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: K.Segue.showLoginSignup, sender: nil)
    }
    

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ReuseIdentifier.onboardingCollectionViewCell, for: indexPath) as? OnboardingCollectionViewCell {
            cell.configure(image: UIImage(named: slides[indexPath.item].image)!)
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        titleLabel.text = slides[index].title
        detailLabel.text = slides[index].description
        pageControll.currentPage = index
    }
    
    
}

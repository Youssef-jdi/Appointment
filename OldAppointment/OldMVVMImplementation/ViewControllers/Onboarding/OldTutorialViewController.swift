////
////  TutorialViewController.swift
////  appointment
////
////  Created by Dylan Barteling on 18/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class TutorialViewController: BaseViewController, Storyboardable {
//
//    // MARK: Statics
//    static var storyboardName: String = "Tutorial"
//    static var storyboardIdentifier: String = "TutorialVC"
//
//    // MARK: IBOutlets
//
//    @IBOutlet private weak var pageCollectionView: UICollectionView! {
//        didSet {
//            pageCollectionView.showsHorizontalScrollIndicator = false
//            pageCollectionView.delegate = self
//            pageCollectionView.dataSource = self
//        }
//    }
//    @IBOutlet private weak var pageControl: UIPageControl! {
//        didSet {
//            pageControl.numberOfPages = self.viewModel.tutorialCount
//            pageControl.pageIndicatorTintColor = R.color.appGrayChateau()!
//            pageControl.currentPageIndicatorTintColor = R.color.appDarkRed()!
//        }
//    }
//    @IBOutlet private weak var pageLabel: UILabel! {
//        didSet {
//            pageLabel.numberOfLines = 0
//            pageLabel.text = self.viewModel.getDescription(for: 0)
//            pageLabel.font = R.font.notoSans(size: 16)
//            pageLabel.textColor = R.color.appDimGray()
//        }
//    }
//    private var viewModel = TutorialViewModel()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupNavBar()
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        self.pageCollectionView.reloadData()
//    }
//    
//    private func setupNavBar() {
//        navigationItem.title = "Tutorial"
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: R.color.appBlue()!]
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.navigationBar.barTintColor = R.color.appBlue()!
//        navigationController?.navigationBar.tintColor = R.color.appBlue()!
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.navigationBar_Back()!, style: .plain, target: self, action: #selector(backTapped))
//        navigationItem.leftBarButtonItem?.tintColor = R.color.appBlue()!
//        navigationItem.rightBarButtonItem = SkipButton(color: R.color.appBlue()!)
//    }
//    
//    @objc func backTapped() {
//        navigationController?.popViewController(animated: true)
//    }
//}
//// MARK: CollectionViewDelegate
//extension TutorialViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return self.viewModel.tutorialCount
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialViewCell", for: indexPath) as? TutorialCollectionViewCell else { return UICollectionViewCell() }
//        cell.setImage(image: self.viewModel.getImage(for: indexPath.section))
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return collectionView.frame.size
//    }
//
//    // swiftlint: disable this
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    // swiftlint: disable this
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
//
//// MARK: ScrollViewDelegate
//extension TutorialViewController: UIScrollViewDelegate {
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let x = scrollView.contentOffset.x
//        let w = scrollView.bounds.size.width
//        let currentPage = Int(ceil(x / w))
//        self.pageControl.currentPage = currentPage
//        self.pageLabel.text = self.viewModel.getDescription(for: currentPage)
//    }
//}

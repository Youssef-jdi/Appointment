//
//  TutorialViewController.swift
//  appointment
//
//  Created by Rachel Polachova on 21/02/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

//sourcery: AutoMockable
protocol TutorialViewControllerProtocol: class, UIViewControllerRouting {
    func set(interactor: TutorialInteractorProtocol)
    func set(router: TutorialRouterProtocol)

    func display(error: Error)
    func displayTutorialSlides(with tutorials: [Tutorial])
    func displayActivityIndicator(_ display: Bool)
}

class TutorialViewController: UIViewController, TutorialViewControllerProtocol {

    // MARK: DI
    var interactor: TutorialInteractorProtocol?
    var router: TutorialRouterProtocol?

    func set(interactor: TutorialInteractorProtocol) {
        self.interactor = interactor
    }
    
    func set(router: TutorialRouterProtocol) {
        self.router = router
    }
    
    // MARK: Outlets
    @IBOutlet weak var pageControlBottomAnchor: NSLayoutConstraint!
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet { pageControl.isHidden = true }
    }
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet { scrollView.delegate = self }
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchTutorialPages()
        setupNavigationBar(viewDidLoad: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        setupNavigationBar(viewDidLoad: false)
        super.viewWillDisappear(animated)
    }
}

// MARK: UIScrollViewDelegate
extension TutorialViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //disable vertical scrolling
        if scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}

// MARK: Methods
extension TutorialViewController {

    //TO DO: replace with error handler in interactor
    func display(error: Error) {
        Console.log(type: .error, error.localizedDescription)
    }
    
    func displayTutorialSlides(with tutorials: [Tutorial]) {
        setupScreens(with: tutorials)
    }
    
    func displayActivityIndicator(_ display: Bool) {
//        display ? UIViewController.showActivityIndicator() : UIViewController.removeActivityIndicator()
    }
}

// MARK: Configure Methods
extension TutorialViewController {

    /// Sets up navigation bar UI
    func setupNavigationBar(viewDidLoad: Bool) {
        addSkipButton()
        setupNavigationbarUI(viewDidLoad: viewDidLoad)
    }
    
    func setupNavigationbarUI(viewDidLoad: Bool) {
        navigationController?.navigationBar.barTintColor = viewDidLoad ? .white : R.color.appGray()
        navigationController?.navigationBar.tintColor = viewDidLoad ? R.color.appGray() : .white
        
        //hide/show bottom shadow
        navigationController?.navigationBar.isTranslucent = viewDidLoad ? true : false
        navigationController?.navigationBar.shadowImage = viewDidLoad ? UIImage() : nil
        
        let backButton = UIBarButtonItem()
        backButton.title = "Tutorial"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func addSkipButton() {
        let button = UIBarButtonItem(title: R.string.localizable.skip().uppercased(), style: .done, target: self, action: #selector(skipButtonPressed))
        button.tintColor = R.color.appBlue()
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func skipButtonPressed() {
        router?.route(to: .home)
    }
}

// MARK: Private Methods
private extension TutorialViewController {

    /// Sets up tutorial "page view"
    /// - Parameter tutorials: data
    func setupScreens(with tutorials: [Tutorial]) {
        pageControl.numberOfPages = tutorials.count
        pageControl.isHidden = false

        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(tutorials.count), height: view.frame.height)
        scrollView.isPagingEnabled = true

        addTutorialSlides(from: tutorials)
    }

    func addTutorialSlides(from tutorials: [Tutorial] ) {
        tutorials.enumerated().forEach { index, tutorial in
            guard let slide = Bundle.main.loadNibNamed(R.nib.tutorialSlide.name, owner: self, options: nil)?.first as? TutorialSlide else { return }
            slide.configure(tutorial)
            slide.frame = CGRect(x: view.frame.width * CGFloat(index), y: 0, width: view.frame.width, height: view.frame.height)
            slide.imageAndDescriptionVerticalSpacing.constant = pageControl.frame.height
            scrollView.addSubview(slide)
        }
    }
}

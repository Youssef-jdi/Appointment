////
////  ParticipantDiagramViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class ParticipantDiagramViewController: BaseViewController, Storyboardable, Rotateable, MVVMViewController {
//    static var storyboardName: String { return "Invitation" }
//    static var storyboardIdentifier: String { return "ParticipantDiagramViewController" }
//    
//    typealias ViewModel = ParticipantDiagramViewModel
//    
//    var viewModel = ViewModel()
//    
//    @IBOutlet private var diagramCircleViews: [DiagramCircleView]!
//    @IBOutlet private var diagramOwnerCircleView: DiagramCircleView!
//    
//    // this is here because the sidemenu controller doesn't let us to get the content viewcontroller so we can do the rotation this view should be presented not pushed.
//    @IBOutlet private var navigationBarView: UIView! {
//        didSet {
//            navigationBarView.backgroundColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    
//    @IBOutlet private var lineViews: [UIView]! {
//        didSet {
//            lineViews.forEach {
//                $0.backgroundColor = ThemeService.shared.theme.firstColor
//            }
//        }
//    }
//    
//    @IBOutlet private var rotateableStackViews: [UIStackView]! {
//        didSet {
//            rotateableStackViews[0].transform = CGAffineTransform(rotationAngle: .pi / 3)
//            rotateableStackViews[1].transform = CGAffineTransform(rotationAngle: -.pi / 3)
//        }
//    }
//    
//    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
//        return .landscapeRight
//    }
//    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return .landscapeRight
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        bind()
//        prepareNavigationBar()
//        addBackButton()
//        viewModel.fetchParticipants(invitation: 1)
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        diagramCircleViews.forEach {
//            $0.backgroundColor = .clear
//            $0.layoutIfNeeded()
//        }
//        diagramOwnerCircleView.backgroundColor = .clear
//        diagramOwnerCircleView.layoutIfNeeded()
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        rotate(to: .portrait)
//    }
//    
//    @IBAction private func backButtonPressed(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    @IBAction private func rightBarButtonPressed(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
//    }
//}
//
//private extension ParticipantDiagramViewController {
//    func prepareDiagram() {
//        guard let ownerPerson = viewModel.ownerPerson else { return }
//        diagramOwnerCircleView.prepareView(profileImage: ownerPerson.attendanceTypeImage, fullName: ownerPerson.fullName, state: ownerPerson.attendancesType, stateImage: ownerPerson.attendanceTypeImage)
//        guard let participants = viewModel.participants else { return }
//        for (index,circleView) in diagramCircleViews.enumerated() {
//            let participant = participants[index]
//            if case participant.attendancesType = AttendancesType.cancelled {
//                lineViews[index].alpha = 0.1
//            }
//            circleView.prepareView(profileImage: participant.attendanceTypeImage, fullName: participant.fullName, state: participant.attendancesType, stateImage: participant.attendanceTypeImage)
//        }
//    }
//    
//    func bind() {
//        viewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let type):
//                switch type {
//                case .fetchedParticipants:
//                    self?.prepareDiagram()
//                }
//            case .error(let error):
//                print(error.localizedDescription)
//            default: break
//            }
//        }
//    }
//}

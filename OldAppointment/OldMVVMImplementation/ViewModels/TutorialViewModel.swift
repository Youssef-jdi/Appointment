////
////  TutorialViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//protocol TutorialViewModelProtocol {
//    var tutorialModels: [TutorialModel] { get }
//    var tutorialCount: Int { get }
//    
//    func getDescription(for row: Int) -> String!
//    func getImage(for row: Int) -> UIImage!
//}
//
//class TutorialViewModel: TutorialViewModelProtocol {
//    private(set) var tutorialModels: [TutorialModel] = [
//        TutorialModel(description: "tutorialDescription1".localized.capitalizingFirstLetter(),
//                      showedImage: R.image.tutorialPhone()!),
//        TutorialModel(description: "tutorialDescription2".localized.capitalizingFirstLetter(),
//                      showedImage: R.image.tutorialPhone()!),
//        TutorialModel(description: "tutorialDescription3".localized.capitalizingFirstLetter(),
//                      showedImage: R.image.tutorialPhone()!),
//        TutorialModel(description: "tutorialDescription4".localized.capitalizingFirstLetter(),
//                      showedImage: R.image.tutorialPhone()!),
//        TutorialModel(description: "tutorialDescription5".localized.capitalizingFirstLetter(),
//                      showedImage: R.image.tutorialPhone()!)
//        ]
//
//    var tutorialCount: Int {
//        return self.tutorialModels.count
//    }
//    
//    func getDescription(for row: Int) -> String! {
//        return self.tutorialModels[row].descriptionText
//    }
//    
//    func getImage(for row: Int) -> UIImage! {
//        return self.tutorialModels[row].image
//    }
//}

//
//  TutorialResponse.swift
//  appointment
//
//  Created by Rachel Polachova on 24/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

#warning("Structure of this resposne will be changed in future (i hope)")
//struct TutorialResponse: Codable {
//    let status: Int
//    let message: String
//    let result: TutorialResult

struct TutorialResponse: Codable {
    let titlePage1: String
    let descriptionPage1: String
    let imageUrl1: String
    let titlePage2: String
    let descriptionPage2: String
    let imageUrl2: String
    let titlePage3: String
    let descriptionPage3: String
    let imageUrl3: String
    let titlePage4: String
    let descriptionPage4: String
    let imageUrl4: String
    let titlePage5: String
    let descriptionPage5: String
    let imageUrl5: String

    enum CodingKeys: String, CodingKey {
        case titlePage1 = "title_page1"
        case descriptionPage1 = "description_page1"
        case imageUrl1 = "image_url_page1"
        case titlePage2 = "title_page2"
        case descriptionPage2 = "description_page2"
        case imageUrl2 = "image_url_page2"
        case titlePage3 = "title_page3"
        case descriptionPage3 = "description_page3"
        case imageUrl3 = "image_url_page3"
        case titlePage4 = "title_page4"
        case descriptionPage4 = "description_page4"
        case imageUrl4 = "image_url_page4"
        case titlePage5 = "title_page5"
        case descriptionPage5 = "description_page5"
        case imageUrl5 = "image_url_page5"
    }
}
//}

//
//  TutorialService.swift
//  appointment
//
//  Created by Rachel Polachova on 24/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol TutorialServiceProtocol {
    func fetchTutorialSlides(completion: @escaping RequestCompletion<TutorialResponse>)
}

class TutorialService: TutorialServiceProtocol {
    
    private let client: MoyaClient<TutorialTarget>
    
    init(client: MoyaClient<TutorialTarget>) {
        self.client = client
    }
    
    func fetchTutorialSlides(completion: @escaping RequestCompletion<TutorialResponse>) {
        client.request(.getTutorials, completion)
    }
}

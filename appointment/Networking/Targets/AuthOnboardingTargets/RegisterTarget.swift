//
//  RegisterTarget.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/18/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya
//swiftlint:disable implicit_return
enum RegisterTarget: TargetType {
    
    case register(registerRequest: RegisterRequest, profileImage: UIImage? = nil)
    
    var baseURL: URL {
        return BaseURL.apiURL
    }
    
    var path: String {
        return "/user/register"
    }
    
    var method: Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var task: Task {
        switch  self {
        case .register(let registerRequest, let profileImage):
            return prepareRequest(registerRequest: registerRequest, profileImage: profileImage)
        }
    }
    
    private func prepareRequest(registerRequest: RegisterRequest, profileImage: UIImage?) -> Task {
        var formData: [MultipartFormData] = []
        let params = getParams(registerRequest)
        if let profileImage = profileImage {
            let imageData = profileImage.jpegData(compressionQuality: 1)
            let image = Moya.MultipartFormData(provider: .data(imageData!), name: "attachments", fileName: "\(registerRequest.email)_profile.jpg", mimeType: "image/jpeg")
            formData.append(image)
        }
        for (key, value) in params {
            formData.append(MultipartFormData(provider: .data("\(value)".data(using: .utf8)!), name: key))
        }
        return .uploadMultipart(formData)
    }
    
    private func getParams(_ registerRequest: RegisterRequest) -> [String: Any] {
        do {
            let requestParameter = try registerRequest.asDictionary()
            return requestParameter
        } catch {
            debugPrint("error ", error.localizedDescription)
        }
        return [:]
    }
}

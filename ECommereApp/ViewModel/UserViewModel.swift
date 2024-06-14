//
//  UserViewModel.swift
//  Stylish
//
//  Created by Aabid Khan on 24/05/24.
//

import Foundation
import Alamofire

struct User: Codable {
    let token: String
}

class UserViewModel: ObservableObject {
    
    @Published var user: UserData?
    
    func fetchUser(userId: String, success: @escaping () -> ()) {
        AF.request(BASE_URL + ApiEndPoints.users + "/" + userId)
            .responseDecodable(of: UserData.self) { response in
                switch response.result {
                case .success(let user):
                    self.user = user
                    success()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func updateUser(userId: String, parameters: Parameters, success: @escaping () -> ()) {
        AF.request(BASE_URL + ApiEndPoints.users + "/" + userId, method: .put, parameters: parameters)
            .responseDecodable(of: UserDataUpdateProfile.self) { response in
                switch response.result {
                case .success:
                    success()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func Login(parameters: Parameters,  success: @escaping (LoginResponse) -> (), failure: @escaping (FailureMessage) -> ()) {
        AF.request(BASE_URL + ApiEndPoints.login, method: .post, parameters: parameters)
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let loginData):
                    success(loginData)
                case .failure(let error):
                    failure(error.localizedDescription)
                }
            }
    }
}

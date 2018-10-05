//
//  APIService.swift
//  fm viewer
//
//  Created by alam yudi on 7/15/17.
//  Copyright © 2017 alam yudi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum InternetError: Error {
    case InternetNotReach, KeyNotMatch
}

extension InternetError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .InternetNotReach:
            return NSLocalizedString("Cannot reach your internet connection.", comment: "Internet Error")
        case .KeyNotMatch:
            return NSLocalizedString("Key from server doesn't match with device models.", comment: "Key Error")
        }
        
    }
}

class APIService: NSObject {
    
    static func getMasterData(masterUrl url: String, param: Parameters?, completed: @escaping (_ result: [Any]?, _ error: Error?) -> ()) {
        if APIService.isConnectedToInternet() {
            let headers: HTTPHeaders = [
                "Accept": "application/json",
                "Authorization": Constants.kDefaultAuth
            ]
            
            Alamofire.request(url, method: .get, parameters: param, headers: headers).validate().responseJSON { response in
                switch response.result {
                case .success (let json):
                    let payload = JSON(json)
                    if let data = payload["data"].arrayObject {
                        completed(data, nil)
                    }else{
                        completed(nil, InternetError.KeyNotMatch)
                    }
                    break
                case .failure(let error):
                    completed(nil, error)
                    break
                }
            }
        } else {
            completed(nil,InternetError.InternetNotReach)
        }
    }
  
  static func postPhoneNumberData(phoneNumber: String, completed: @escaping (_ result: NSDictionary?, _ error: Error?) -> ()) {
    if APIService.isConnectedToInternet() {
      let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Authorization": Constants.kDefaultAuth
      ]
      let params: Parameters = [
        "no_hp": phoneNumber
      ]
      let url = Constants.kCheckPhoneUrl
      Alamofire.request(url, method: .post, parameters:params, headers: headers).validate().responseJSON { response in
        switch response.result {
        case .success (let json):
          /* return sample
           "status": "success",
           "code": 200,
           "data": {}
           */
          
          if let data = json as? NSDictionary {
            completed(data, nil)
          }else{
            completed(nil, InternetError.KeyNotMatch)
          }
          break
        case .failure(let error):
          completed(nil, error)
          break
        }
      }
    } else {
      completed(nil,InternetError.InternetNotReach)
    }
  }
  
  static func postEmailData(email: String, completed: @escaping (_ result: NSDictionary?, _ error: Error?) -> ()) {
    if APIService.isConnectedToInternet() {
      let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Authorization": Constants.kDefaultAuth
      ]
      let params: Parameters = [
        "email": email
      ]
      let url = Constants.kCheckEmailUrl
      Alamofire.request(url, method: .post, parameters:params, headers: headers).validate().responseJSON { response in
        switch response.result {
        case .success (let json):
          /* return sample
           "status": "success",
           "code": 200,
           "data": {}
           */
          
          if let data = json as? NSDictionary {
            completed(data, nil)
          }else{
            completed(nil, InternetError.KeyNotMatch)
          }
          break
        case .failure(let error):
          completed(nil, error)
          break
        }
      }
    } else {
      completed(nil,InternetError.InternetNotReach)
    }
  }
  static func requestOTP(withPhoneNumber phoneNumber: String, completed: @escaping (_ result: NSDictionary?, _ error: Error?) -> ()) {
    if APIService.isConnectedToInternet() {
      let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Authorization": Constants.kDefaultAuth
      ]
      let params: Parameters = [
        "no_hp": phoneNumber
      ]
      let url = Constants.kRequestOTP
      Alamofire.request(url, method: .post, parameters:params, headers: headers).validate().responseJSON { response in
        switch response.result {
        case .success (let json):
          /* return sample
           "status": "success",
           "code": 200,
           "data": {}
           */
          
          if let data = json as? NSDictionary {
            completed(data, nil)
          }else{
            completed(nil, InternetError.KeyNotMatch)
          }
          break
        case .failure(let error):
          completed(nil, error)
          break
        }
      }
    } else {
      completed(nil,InternetError.InternetNotReach)
    }
  }
  static func verifyOTP(withPhoneNumber phoneNumber: String, securityCode: String, completed: @escaping (_ result: NSDictionary?, _ error: Error?) -> ()) {
    if APIService.isConnectedToInternet() {
      let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Authorization": Constants.kDefaultAuth
      ]
      let params: Parameters = [
        "no_hp": phoneNumber,
        "kode_otp": securityCode
      ]
      let url = Constants.kCheckOTP
      Alamofire.request(url, method: .post, parameters:params, headers: headers).validate().responseJSON { response in
        switch response.result {
        case .success (let json):
          /* return sample
           "status": "success",
           "code": 200,
           "data": {}
           */
          
          if let data = json as? NSDictionary {
            completed(data, nil)
          }else{
            completed(nil, InternetError.KeyNotMatch)
          }
          break
        case .failure(let error):
          completed(nil, error)
          break
        }
      }
    } else {
      completed(nil,InternetError.InternetNotReach)
    }
  }
    
    static func postFormData(param: Parameters?, completed: @escaping (_ result: NSDictionary?, _ error: Error?) -> ()) {
        if APIService.isConnectedToInternet() {
            let headers: HTTPHeaders = [
                "Accept": "application/json",
                "Authorization": Constants.kDefaultAuth
            ]
            
            let url = Constants.kSendFormDataUrl
            Alamofire.request(url, method: .post, parameters: param, headers: headers).validate().responseJSON { response in
                switch response.result {
                case .success (let json):
                    /* return sample
                     "status": "success",
                     "code": 200,
                     "data": {}
                    */
                    
                    if let data = json as? NSDictionary {
                        completed(data, nil)
                    }else{
                        completed(nil, InternetError.KeyNotMatch)
                    }
                    break
                case .failure(let error):
                    completed(nil, error)
                    break
                }
            }
        } else {
            completed(nil,InternetError.InternetNotReach)
        }
    }
    
    static func postLoginData(userName: String, password: String, completed: @escaping (_ result: NSDictionary?, _ error: Error?) -> ()) {
        if APIService.isConnectedToInternet() {
            let headers: HTTPHeaders = [
                "Accept": "application/json",
                "Authorization": Constants.kDefaultAuth
            ]
            
            let parameters = [
                "username": userName,
                "password": password
            ]
            
            let url = Constants.kLoginUrl
            Alamofire.request(url, method: .post, parameters: parameters, headers: headers).validate().responseJSON { response in
                switch response.result {
                case .success (let json):
                    /* return sample
                     "token": "",
                     "status": "success"
                     "code": 200
                     */
                    if let jsonPayload = json as? NSDictionary {
                        completed(jsonPayload, nil)
                    }else{
                        completed(nil, InternetError.KeyNotMatch)
                    }
                    break
                case .failure(let error):
                    completed(nil, error)
                    break
                }
            }
        } else {
            completed(nil,InternetError.InternetNotReach)
        }
    }
    
    static func postImageData(formData: FormData, completed: @escaping (_ result: NSDictionary?, _ error: Error?) -> () ) {
        if APIService.isConnectedToInternet() {
            let headers: HTTPHeaders = [
                "Accept": "application/json",
                "Authorization": Constants.kDefaultAuth
            ]
        
            let url = try! URLRequest(url: URL(string:Constants.kSendImageDataUrl)!, method: .post, headers: headers)

            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    let idReg = Constants.getRegistrationData()
                    multipartFormData.append((idReg?.data(using: String.Encoding.utf16)!)!, withName: "id_registrasi")
                    // EKTP
                    let ektpPath = URL(fileURLWithPath: formData.img_ektp_url)
//                    multipartFormData.append(URL, withName: <#T##String#>)
                    multipartFormData.append(ektpPath, withName: "img_ektp")
                    // NPWP
                    let npwpPath = URL(fileURLWithPath: formData.img_npwp_url)
                    multipartFormData.append(npwpPath, withName: "img_npwp")
                    // SELFIE EKTP
                    let selfieEktp = URL(fileURLWithPath: formData.img_selfie_ektp_url)
                    multipartFormData.append(selfieEktp, withName: "img_selfie_ektp")
                    // VIDEO
                    let videoPath = URL(fileURLWithPath: formData.video_url)
                    multipartFormData.append(videoPath, withName: "video")
                    // FULL SIGNATURE
                    let fullSignPath = URL(fileURLWithPath: formData.full_signature_url)
                    multipartFormData.append(fullSignPath, withName: "full_signature")
                    // INITIAL SIGNATURE
                    let initSignPath = URL(fileURLWithPath: formData.initial_signature_url)
                    multipartFormData.append(initSignPath, withName: "initial_signature")
                    
                }, with: url, encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseJSON { response in
                            switch response.result {
                            case .success (let json):
                                if let jsonPayload = json as? NSDictionary {
                                    completed(jsonPayload, nil)
                                }else{
                                    completed(nil, InternetError.KeyNotMatch)
                                }
                                break
                            case .failure(let error):
                                completed(nil, error)
                                break
                            }
                        }
                        break
                    case .failure(let err):
                        completed(nil, err)
                        break
                    }
                }
            )
            
        } else {
            completed(nil,InternetError.InternetNotReach)
        }
    }
    
    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    
}

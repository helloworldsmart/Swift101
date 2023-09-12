//
//  ViewController.swift
//  DropboxOAuth
//
//  Created by Michael on 2023/9/11.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController {
    @IBOutlet weak var authButtonPressed: UIButton!
    var accessToken: String?
    
    @IBAction func authButtonPressed(_ sender: UIButton) {
        authorize(in: view.window!) { token in
            // 儲存與使用 token
            self.accessToken = token
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    
    func retrieveCode(in window: UIWindow, clientID: String, redirectURI: String, codeVerifier: String, completionHandler: @escaping (String) -> Void) {
        var urlComponents = URLComponents(string: "https://www.dropbox.com/oauth2/authorize")!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "response_type", value: "code"),
            
            URLQueryItem(name: "client_id", value: clientID),
            URLQueryItem(name: "redirect_uri", value: redirectURI),
            
            URLQueryItem(name: "code_challenge", value: codeVerifier),
            URLQueryItem(name: "code_challenge_method", value: "plain")
        ]
        let url = urlComponents.url!
        
        var session: ASWebAuthenticationSession?
        // 依據在 app 後台新增的 Redirect URI，填入相對應的 url scheme
        
        session = ASWebAuthenticationSession(url: url, callbackURLScheme: "app") { url, error in
            session = nil
            
            // 抽取 authorization code
            guard let url = url else { return }
            guard let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems else { return }
            guard let code = queryItems.first(where: { $0.name == "code" })?.value else { return }
            
            // 回傳 code 並結束第一步驟
            completionHandler(code)
        }
        
        session?.presentationContextProvider = window
        session?.start()
    }
    
    
    func retrieveToken(
        code: String,
        clientID: String,
        redirectURI: String,
        codeVerifier: String,
        completionHandler: @escaping (String) -> Void
    ) {
        // 建構 POST 請求
        let url = URL(string: "https://api.dropboxapi.com/oauth2/token")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        // 這邊用 URLComponents 來產生 query 字串並轉成 Data
        var urlComponents = URLComponents()
        urlComponents.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "client_id", value: clientID),
            URLQueryItem(name: "redirect_url", value: redirectURI),
            URLQueryItem(name: "code_verifier", value: codeVerifier)
        ]
        
        request.httpBody = urlComponents.query?.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            // 用一個臨時的 Codable struct 來解 response
            struct TokenResponse: Codable {
                var access_token: String
            }
            // TODO: 這閃退
            let tokenResponse = try! JSONDecoder().decode(TokenResponse.self, from: data)
            
            // 回傳從 response 中解出的 access token
            completionHandler(tokenResponse.access_token)
        }
        task.resume()
    }
    
    func authorize(in window: UIWindow, completionHandler: @escaping (String) -> Void) {
        // 產生一個長度 128 的隨機字串
        let codeVerifier = String(
            String(repeating: "a", count: 128).compactMap{ _ in
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".randomElement()
            }
        )
        
        // 在 app 後台中的資訊
        let clientID = "key?"
        let redirectURI = "app://done"
        // 1. 使用 ASWebAuthenticationSession 獲取 authorization code
        retrieveCode(in: window, clientID: clientID, redirectURI: redirectURI, codeVerifier: codeVerifier) { code in
            // 2. 使用 URLSession 拿 authorization code 去交換 access token
            self.retrieveToken(code: code, clientID: clientID, redirectURI: redirectURI, codeVerifier: codeVerifier) { token in
                // 3. 回傳 access token
                completionHandler(token)
            }
        }
        
        
    }
    
    // 檢查 access token 是否有效
    func checkUser(token: String, completionHandler: @escaping (Bool) -> Void) {
        
        // 建構請求
        let url = URL(string: "https://api.dropboxapi.com/2/check/user")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        struct Parameters: Codable {
            var query: String
        }
        // 如果 access token 有效的話，伺服器會回傳跟 query 一模一樣的字串
        let query = "一些亂數字串"
        request.httpBody = try! JSONEncoder().encode(Parameters(query: query))
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // 解出回傳字串
            struct Response: Codable {
                var result: String
            }
            let result = try! JSONDecoder().decode(Response.self, from: data!).result
            
            // 回傳 token 是否有效
            let tokenIsValid = result == query
            completionHandler(tokenIsValid)
        }
        task.resume()
    }
}


extension UIWindow: ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        
        // UIWindow 本來就有遵守 ASPresentationAnchor，所以可以直接回傳 self。
        return self
    }
}

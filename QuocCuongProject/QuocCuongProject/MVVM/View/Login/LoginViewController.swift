//
//  LoginViewController.swift
//  QuocCuongProject
//
//  Created by Mojave on 8/1/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var vContain : UIView!
    @IBOutlet weak var lblUsername : UILabel!
    @IBOutlet weak var lblPassword : UILabel!
    @IBOutlet weak var tfUsername : UITextField!
    @IBOutlet weak var tfPassword : UITextField!
    @IBOutlet weak var btnLogin : UIButton!
    @IBOutlet weak var btnShowPass : UIButton!
    @IBOutlet weak var imgShowPass : UIImageView!
    
    var loginViewModel = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfUsername.delegate = self
        tfPassword.delegate = self
        tfPassword.isSecureTextEntry = true
        
        
        setUpView()
        //loginProcess()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tfUsername.text = appConfig.customerId
        tfPassword.text = appConfig.password
        
        if(appConfig.customerId != "" && appConfig.password != "") {
            processLogin(appConfig.customerId, appConfig.password)
        }
    }
    
    
    func setUpView() {
        //vContain.backgroundColor = UIColor.init(red: 140, green: 140, blue: 140, alpha: 1.0)
        vContain.layer.cornerRadius = 8.0
        lblUsername.text = "UserName"
        lblPassword.text = "Password"
        tfUsername.placeholder = "Nhập Email"
        tfPassword.placeholder = "Nhập Mật khẩu"
        btnLogin.layer.cornerRadius = 5.0
    
    }
    
    func processLogin(_ username : String, _ password : String) {
    
        
        let request = Login_Request()
        request.email = username
        request.password = password
        
        
        DispatchQueue.global().async {
            ServicesRequestAPI.login(request: request, success: { (data, result) in
                
                if(result == true) {
                    self.loginViewModel = LoginViewModel.init(data)
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: Key.LoginSucess.rawValue), object: nil, userInfo: nil)
                    
                    appConfig.customerId = self.tfUsername.text ?? ""
                    appConfig.password = self.tfPassword.text ?? ""
                    appConfig.access_Token = data.access_token
                    
                    appConfig.saveData()
                    
                } else {
                    print("Đăng nhập thất baị")
                    let alert = UIAlertController(title: "THÔNG BÁO", message: "Đăng nhập thất bại", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        switch action.style{
                        case .default:
                            print("default")
                            
                        case .cancel:
                            print("cancel")
                            
                        case .destructive:
                            print("destructive")
                            
                        @unknown default:
                            break
                        }}))
                    self.present(alert, animated: true, completion: nil)
                }
                
            })
        }
        
    
    }
    
    @IBAction func loginTouch(_ sender : UIButton) {
    
        processLogin(tfUsername.text ?? "", tfPassword.text ?? "")
        
    }

}

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == tfUsername) {
            tfPassword.becomeFirstResponder()
            return false
        } else {
            tfPassword.resignFirstResponder()
        }
        
        return true
    }
}

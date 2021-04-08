//
//  ViewController.swift
//  Lesson1
//
//  Created by Marcus on 18.02.2021.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var login: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var scrol: UIScrollView!
    
    private let stackView: UIStackView = {
            $0.distribution = .fill
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 10
            return $0
        }(UIStackView())
    
    private let circleA = UIView()
    private let circleB = UIView()
    private let circleC = UIView()
    private lazy var circles = [circleA, circleB, circleC]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
               stackView.translatesAutoresizingMaskIntoConstraints = false
               stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        circles.forEach {
                $0.layer.cornerRadius = 20/2
                           $0.layer.masksToBounds = true
                           $0.backgroundColor = .gray
                           stackView.addArrangedSubview($0)
                           $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
                           $0.heightAnchor.constraint(equalTo: $0.widthAnchor).isActive = true
        }
        
        
        
                let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                scrol?.addGestureRecognizer(hideKeyboardGesture)

    }
    @IBAction func singButton(_action: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let twoScreen = storyboard.instantiateViewController(identifier: "twoScreen")
        present(twoScreen, animated: true, completion: nil)
    }
    


    
    @objc func keyboardWasShown(notification: Notification) {
           
           let info = notification.userInfo! as NSDictionary
           let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
           let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
           self.scrol?.contentInset = contentInsets
        scrol?.scrollIndicatorInsets = contentInsets
       }
       
       @objc func keyboardWillBeHidden(notification: Notification) {
           let contentInsets = UIEdgeInsets.zero
        scrol?.contentInset = contentInsets
       }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }


    @objc func hideKeyboard() {
            self.scrol?.endEditing(true)
        }


   
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                for (index, circle) in circles.enumerated() {
                    let delay = 0.5 * TimeInterval(index) / TimeInterval(circles.count)
                    UIView.animateKeyframes(withDuration: 1, delay: delay, options: [.repeat], animations: {
                        UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.5) {
                            if index == 0 {
                                circle.alpha -= 0.25
                            } else {
                                circle.alpha += 0.5
                            }
                        }
                        UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.5) {
                            if index + 1 > self.circles.count-1 {
                                self.circles.first?.alpha -= 0.5
                            } else {
                                self.circles[index+1].alpha -= 0.5
                            }
                        }
                    })
                }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
            self.circles.forEach {
                $0.removeFromSuperview()
            }
        }
    }
    
   
    
    

//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        guard identifier == "twoScreen" else {return true}
//            let isValid = validateLogin()
//            if !isValid {
//                showLoginAllert()
//            }
//            return isValid
//
//    }
//    func validateLogin() -> Bool {
//        return login.text == "admin" &&
//               password.text == "12345"
//    }
//    func showLoginAllert(){
//        let alert = UIAlertController(title: "Error", message: "Invalid login or password", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Okey", style: .cancel, handler: nil)
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//    }
    
}


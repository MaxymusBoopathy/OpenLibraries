//
//  ViewController.swift
//  OTPScreen
//
//  Created by Boopathi on 22/02/18.
//  Copyright © 2018 [Ni-Boopa]thi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var tfCollection: [UITextField]!

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = tfCollection.map{
            $0.delegate = self;
            $0.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        }

    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tfCollection.first?.becomeFirstResponder()

    }

    @objc func textFieldDidChange(textField:UITextField)  {
        let text = textField.text

        switch text?.utf16.count {

        case 0?:

            for (index,_) in tfCollection.enumerated(){
                switch textField {
                case tfCollection[index]:
                    print(index)
                    if index > 0{
                        tfCollection[index - 1].becomeFirstResponder()
                    }
                default:
                    break
                }
            }

            print("Hello")
        case 1?:
            for (index,_) in tfCollection.enumerated(){
                switch textField {
                case tfCollection[index]:
                    print(index)
                    if index < tfCollection.count-1{
                        tfCollection[index+1].becomeFirstResponder()
                    }

                default:
                    break
                }
            }

        default:
            break
        }




    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 1
    }

    @IBAction func btnSubmitAction(_ sender: Any) {

        let otpText = tfCollection.map({$0.text!}).flatMap{$0}.joined(separator: "")
        print(String(otpText))

    }
}



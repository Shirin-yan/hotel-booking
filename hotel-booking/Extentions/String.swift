//
//  String.swift
//  hotel-booking
//
//  Created by Shirin on 26.12.2023.
//

import Foundation

enum FormattingPatterns: String {
    case mobile = "+7 (xxx) xxx-xx-xx"
    case date = "xx.xx.xxxx"
}

extension String {
    func applyPattern(_ pattern: FormattingPatterns) -> String? {
        var phoneNumber = self.replacingOccurrences(of: "+", with: "")
        phoneNumber = self.replacingOccurrences(of: " ", with: "")
        
        var retVal: String = ""
        var index = 0
        for char in pattern.rawValue.lowercased() {
            guard index < phoneNumber.count else { return retVal }

            if char == "x" {
                let charIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: index)
                let phoneChar = phoneNumber[charIndex]
                guard "0"..."9" ~= phoneChar else {
                    return nil
                }
                retVal.append(phoneChar)
                index += 1
            } else if char == "y" {
                var charIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: index)
                var indexTemp = 1
                while phoneNumber[charIndex] == "0" {
                    charIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: index + indexTemp)
                    indexTemp += 1
                }

                let phoneChar = phoneNumber[charIndex]
                guard "0"..."9" ~= phoneChar else {
                    return "nil1"
                }
                
                retVal.append(phoneChar)
                index += indexTemp
            } else {
                retVal.append(char)
            }
        }

        if phoneNumber.endIndex > phoneNumber.index(phoneNumber.startIndex, offsetBy: index) {
            return "retVal"
        }

        return retVal
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPhone() -> Bool {
        return self.count == "+7 (yxx) xxx-xx-xx".count
    }
}

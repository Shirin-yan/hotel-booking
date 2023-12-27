//
//  TextField.swift
//  hotel-booking
//
//  Created by Shirin on 27.12.2023.
//

import SwiftUI

struct MaskedPhoneTextField: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String
    var editingChanged: (Bool)->()
    
    func makeUIView(context: UIViewRepresentableContext<MaskedPhoneTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.placeholder = placeholder
        textField.keyboardType = .phonePad
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        textField.delegate = context.coordinator
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.textChanged), for: .editingChanged)
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.textBegin), for: .editingDidBegin)
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.textEnd), for: .editingDidEnd)
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<MaskedPhoneTextField>) {
        uiView.text = text
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentCompressionResistancePriority(.required, for: .vertical)
    }

    func makeCoordinator() -> MaskedPhoneTextField.Coordinator {
        Coordinator(text: $text, editingChanged: editingChanged)
    }

    public final class Coordinator: NSObject, UITextFieldDelegate {
        @Binding private var text: String
        var editingChanged: (Bool)->()

        public init(text: Binding<String>, editingChanged: @escaping (Bool)->()) {
            self._text = text
            self.editingChanged = editingChanged
        }
        
        @objc func textChanged(_ sender: UITextField) {
            guard let text = sender.text else { return }
            self.text = text
        }
        
        @objc func textBegin(_ sender: UITextField) {
            guard let text = sender.text else { return }
            if text.isEmpty { self.text = "+7 (" }
            editingChanged(true)
        }
        
        @objc func textEnd(_ sender: UITextField) {
            guard let text = sender.text else { return }
            print(text.count, text)
            if text.count <= 4 { self.text = "" }
            editingChanged(false)
        }
        
        public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if string.isEmpty { return true }
            self.text = update(text: text)+string
            return true
        }
        
        func update(text: String) -> String {
            var result = ""
            switch text.count {
            case 7:
                result = text + ") "
                
            case 12, 15:
                result = text + "-"

            default:
                result = text
                break
            }
            
            return String(result.prefix(17))
        }
    }

}

struct MaskedDateTextField: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String
    var editingChanged: (Bool)->()

    func makeUIView(context: UIViewRepresentableContext<MaskedDateTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.placeholder = placeholder
        textField.keyboardType = .numberPad
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        textField.delegate = context.coordinator
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.textChanged), for: .editingChanged)
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.textBegin), for: .editingDidBegin)
        textField.addTarget(context.coordinator, action: #selector(context.coordinator.textEnd), for: .editingDidEnd)
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<MaskedDateTextField>) {
        uiView.text = text
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentCompressionResistancePriority(.required, for: .vertical)
    }

    func makeCoordinator() -> MaskedDateTextField.Coordinator {
        Coordinator(text: $text, editingChanged: editingChanged)
    }

    public final class Coordinator: NSObject, UITextFieldDelegate {
        @Binding private var text: String
        var editingChanged: (Bool)->()

        public init(text: Binding<String>, editingChanged: @escaping (Bool)->()) {
            self._text = text
            self.editingChanged = editingChanged
        }

        @objc func textChanged(_ sender: UITextField) {
            guard let text = sender.text else { return }
            self.text = String(text.prefix(10))
        }

        @objc func textBegin(_ sender: UITextField) {
            guard let text = sender.text else { return }
            editingChanged(true)
        }
        
        @objc func textEnd(_ sender: UITextField) {
            guard let text = sender.text else { return }
            editingChanged(false)
        }
        
        public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if string.isEmpty { return true }
            self.text = update(text: text)+string
            return true
        }
        
        func update(text: String) -> String {
            if text.count == 2 || text.count == 5 {
                return text + "."
            }
            
            return text
        }
    }
}


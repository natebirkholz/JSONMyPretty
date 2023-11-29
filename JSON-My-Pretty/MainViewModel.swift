// MainViewModel.swift
// Created by Nate Birkholz

import SwiftUI

enum AlertType {
    case error
    case validate
    case none
}

class MainViewModel: ObservableObject {
    @Published var jsonString = ""
    @Published var showAlert = false
    var alertMessage: String?
    var alertType: AlertType = .none
    @Published var backgroundColor: Color = Color(.backgroundGreen)
    
    init() {  }
    
    func paste() {
        guard let pasteboardString = UIPasteboard.general.string,
              !pasteboardString.isEmpty else {
            alert(message: StringConstants.emptyPasteError)
            return
        }
        
        parse(pasteboardString)
    }
    
    func copy() {
        UIPasteboard.general.string = jsonString
    }
    
    func validateClear() {
        alert(for: .validate, message: StringConstants.clearTitle)
    }
    
    func actuallyClear() {
        dismiss()
        jsonString = ""
    }
        
    func dismiss() {
        showAlert = false
        alertType = .none
        alertMessage = nil
    }
    
    func test() {
        print("And your little dog too!!")
        let testString = StringConstants.testString
        parse(testString)
    }
    
    private func parse(_ stringValue: String) {
        guard let jsonData = stringValue.data(using: .utf8) else {
            alert(message: StringConstants.notDataError)
            return
        }
        
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData)
            let prettyJSONData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            if let value = String(data: prettyJSONData, encoding: .utf8) {
                jsonString = value
                return
            } else {
                alert(message: StringConstants.cantMakeStringError)
                return
            }
        } catch let err {
            alert(message: (StringConstants.notJSONError + err.localizedDescription))
            return
        }
    }
    
    private func alert(for type: AlertType = .error, message: String) {
        guard !showAlert else { return }
        switch type {
        case .error:
            alertType = .error
            alertMessage = message
            showAlert = true
        case .validate:
            alertType = .validate
            alertMessage = message
            showAlert = true
        case .none:
            alertType = .none
            alertMessage = nil
            showAlert = false
            break
        }
    }
}

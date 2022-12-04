//
//  AuthenticationViewModel.swift
//  App-ios
//
//  Created by FELIPE AUGUSTO SILVA on 04/12/22.
//

import Foundation

public protocol AuthenticationProtocol {
    func isUserLogged() -> Bool
}
public class AuthenticationViewModel: AuthenticationProtocol {

    public init() {
    }

    public func isUserLogged() -> Bool {
        true
    }
}

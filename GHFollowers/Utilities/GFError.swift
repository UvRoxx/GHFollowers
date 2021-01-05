//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by UTKARSH VARMA on 2021-01-04.
//

import Foundation

enum GFError:String,Error{
    case invalidUsername = "This username created an invalid request.Please try again🙃"
    case unableToComplete = "Unable To Complete Your Request.Please Check your internet connection🤖"
    case invalidResponse = "Invalid response from the server. PLease try again"
    case invalidData = "The data recieved from the server is invalid.Please try again🤯"
    
}

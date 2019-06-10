//
//  PostTaskListener.swift
//  InstaPorta-iOS
//
//  Created by YBC on 30/07/18.
//  Copyright © 2018 instaporta. All rights reserved.
//

import Foundation

protocol PostTaskListener {
    init()
    func onPostTaskResult(request: Dictionary<String,String>, response: Dictionary<String,String>)
}

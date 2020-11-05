//
//  YmBotPlugin.swift
//  abhic-testing
//
//  Created by Priyank Upadhyay on 24/02/20.
//  Copyright © 2020 Priyank Upadhyay. All rights reserved.
//

import Foundation
import UIKit

class YmBotPlugin{
    
    static let shared = YmBotPlugin()
    var configData: [String : String]
    var payloadData: String

    let events : EventManager
    var window : UIWindow
    private init(){
        self.configData = Dictionary<String, String>()
        self.payloadData = ""
        self.events = EventManager()
        self.window = UIWindow()
    }
    
    func initPlugin(config : Dictionary<String, String>) {
        self.configData = config
    }
    
    func startChatBot(view : UIView){
        let chatViewer = ChatController()
        guard let windowScene = view.window?.windowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = chatViewer
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func stopChatBot(){
        self.window.rootViewController = nil
    }
    func setPayload(payload: Dictionary<String, String>) {
            payloadData = "%7B"
         payload.forEach({ (key: String, value: String) in
            payloadData += "%22\(key)%22:%22\(value)%22,"
        })
        payloadData += "%22Platform%22:%22iOS-App%22%7D"
    }
}




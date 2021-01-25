//
//  YmBotPlugin.swift
//  abhic-testing
//
//  Created by Priyank Upadhyay on 24/02/20.
//  Copyright © 2020 Priyank Upadhyay. All rights reserved.
//

import Foundation
import UIKit

public class YmBotPlugin{
    
    public static let shared = YmBotPlugin()
    public var configData: [String : String]
    public var payloadData: String
    
    public let events : EventManager
    var window : UIWindow
    
    private init(){
        self.configData = Dictionary<String, String>()
        self.payloadData = ""
        self.events = EventManager()
        self.window = UIWindow()
    }
    
    public func initPlugin(config : Dictionary<String, String>) {
        self.configData = config
    }
    
    public func startChatBot(view : UIView){
        let chatViewer = ChatController()
        if #available(iOS 13.0, *) {
            guard let windowScene = view.window?.windowScene else { return }
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = chatViewer
            self.window = window
            window.makeKeyAndVisible()
        } else {
            let window = UIWindow.init(frame: UIScreen.main.bounds)
            window.rootViewController = chatViewer
            self.window = window
            window.makeKeyAndVisible()
        }
        
    }
    
    public func stopChatBot(){
        self.window.rootViewController = nil
    }
    
    public func setPayload(payload: Dictionary<String, String>) {
        payloadData = "%7B"
        payload.forEach({ (key: String, value: String) in
            payloadData += "%22\(key)%22:%22\(value)%22,"
        })
        payloadData += "%22Platform%22:%22iOS-App%22%7D"
    }
}




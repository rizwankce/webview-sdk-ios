//
//  ViewController.swift
//  YellowMessenger
//
//  Created by rizwankce on 01/20/2021.
//  Copyright (c) 2021 rizwankce. All rights reserved.
//

import UIKit
import YellowMessenger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTapOpenYellowMessenger(_ sender: Any) {
        openWebView(sender)
    }

    //Add the following function in ViewController.swift
    func openWebView(_ sender: Any) {
        //Set Configuration data
        let config:[String:String] = ["BotId" : "<<BOT-ID>>"] // FIXME:- add your bot id here

        //Initialize the plugin with config values.
        YmBotPlugin.shared.initPlugin(config: config) //Step 1

        //Set EventListener to handle bot events.
        YmBotPlugin.shared.events.listenTo(eventName: "BotEvent", action: {
            (information:Any?) in
            if let info = information as? Dictionary<String, String> {
                print("Closing Bot")
                //To stop chatbot use the following function
                YmBotPlugin.shared.stopChatBot() //Step 5
                switch info["code"] {
                case "login-user":
                    //Each event has two keys, "code" and "data". Use info["code"] or info["data"] to access the values
                    //The following code restarts the chatbot with different payload values.
                    let payloads:[String:String] = ["UserState":"LoggedIn"]
                    YmBotPlugin.shared.setPayload(payload: payloads)
                    YmBotPlugin.shared.startChatBot(view: self.view)
                //Add other cases acording to need.
                default:
                    print("Unknown Event")
                }
            }
        }) // Step 2

        //Setting payload values
        let payloads:[String:String] = ["UserState":"Anonymous"]

        //Pass payload to the bot
        YmBotPlugin.shared.setPayload(payload: payloads) //Step 3

        //Start the chatbot webview
        YmBotPlugin.shared.startChatBot(view: self.view) //Step 4

        YmBotPlugin.shared.events.listenTo(eventName: "BotCloseEvent") {
            print("bot is closing")
        }
    }
}


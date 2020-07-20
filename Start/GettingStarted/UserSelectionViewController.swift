//
//  UserSelectionViewController.swift
//  GettingStarted
//
//  Created by Paul Ardeleanu on 19/11/2019.
//  Copyright © 2019 Nexmo. All rights reserved.
//

import UIKit
import NexmoClient

class UserSelectionViewController: UIViewController {

    @IBOutlet weak var loginAliceButton: UIButton!
    @IBOutlet weak var loginBobButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var statusLabel: UILabel!
    
    let client = NXMClient.shared
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInterface()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func loginAsAlice(_ sender: Any) {
        loginAs(user: User.alice)
    }
    
    @IBAction func loginAsBob(_ sender: Any) {
        loginAs(user: User.bob)
    }
    
    //MARK: Setup Nexmo Client
    func loginAs(user: User) {
        
    }
    
    func updateInterface() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            // blank state
            self.loginAliceButton.alpha = 1
            self.loginBobButton.alpha = 1
            self.activityIndicator.stopAnimating()
            self.statusLabel.alpha = 0
            
            guard let user = self.user else {
                return
            }
            switch self.client.connectionStatus {
            case .disconnected:
                self.statusLabel.text = "Disconnected"
                self.statusLabel.alpha = 1
            case .connecting:
                self.loginAliceButton.alpha = 0
                self.loginBobButton.alpha = 0
                self.activityIndicator.startAnimating()
                self.statusLabel.text = "Connecting as \(user.rawValue)..."
                self.statusLabel.alpha = 1
            case .connected:
                self.loginAliceButton.alpha = 0
                self.loginBobButton.alpha = 0
                self.statusLabel.text = "Connected as \(user.rawValue)."
                self.statusLabel.alpha = 1
            @unknown default:
                self.statusLabel.text = ""
                self.statusLabel.alpha = 0
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMessages", let user = sender as? User, let destination = segue.destination as? ConversationViewController {
            destination.user = user
        }
    }
}

//MARK:- NXMClientDelegate


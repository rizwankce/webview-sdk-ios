let statusBarHeight = UIApplication.shared.isStatusBarHidden ? CGFloat(0) : UIApplication.shared.statusBarFrame.height
                     
        let cancelButton = UIButton(type: .custom)
        cancelButton.setImage(UIImage(named: "close_white"), for: .normal)
        cancelButton.frame = CGRect(x: (self.view.frame.width - 50), y: (statusBarHeight + 15.0), width: 25, height: 25)
        cancelButton.addTarget(self, action: #selector(dismisViewController), for: .touchUpInside)
        view.addSubview(cancelButton)
        view.bringSubviewToFront(cancelButton)

//
//  UIViewController+Extension.swift
//  rxlogin
//
//  Created by Jonatas Brisotti on 18/11/20.
//  Copyright © 2020 Jonatas Brisotti. All rights reserved.
//

import UIKit
import Lottie

extension UIViewController {
    func showLoad() {
        var lottieAnimation = AnimationView()
        let loadingString = Bundle.main.path(forResource: "loading", ofType: "json")
        let loadingAsset = URL(fileURLWithPath: loadingString ?? "")
        
        lottieAnimation = AnimationView(url: loadingAsset, closure: { _ in
            DispatchQueue.main.async {
                lottieAnimation.play()
            }
        })
        
        lottieAnimation.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        lottieAnimation.loopMode = .loop
        
        let loadingView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height + 100))
        loadingView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.9)
        lottieAnimation.center = loadingView.center
        loadingView.accessibilityIdentifier = "nextFlexLoading"
        DispatchQueue.main.async {
            loadingView.addSubview(lottieAnimation)
            let statubar = UIApplication.shared.keyWindow!
            loadingView.tag = 9352
            statubar.addSubview(loadingView)
        }
    }
}

extension UIViewController {
    func hideLoad() {
        DispatchQueue.main.async {
            let statubar = UIApplication.shared.keyWindow!
            let loading = statubar.subviews.first(where: {$0.tag == 9352 })
            loading?.removeFromSuperview()
        }
    }
}

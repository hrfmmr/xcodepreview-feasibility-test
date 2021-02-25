//
//  ViewController.swift
//  myapp
//
//  Created by hrfm mr on 2021/01/30.
//

import UIKit

import featureA

class ViewController: UIViewController {
    
    private let contentVC = FeedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(contentVC)
        contentVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentVC.view)
        contentVC.didMove(toParent: self)
        NSLayoutConstraint.activate([
            contentVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            contentVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

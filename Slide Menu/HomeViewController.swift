//
//  ViewController.swift
//  Slide Menu
//
//  Created by Test on 12/09/22.
//

import UIKit

class HomeViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
    }
    
    let menuVC = SlideMenuVC()
    
    private let menuWidth: CGFloat = 300
    
    @objc func handleOpen() {
        
        menuVC.view.frame = CGRect(x: -menuWidth, y: 0, width: 300, height: view.frame.height)
        
        let mainWindow = UIApplication.shared.keyWindow
        mainWindow?.addSubview(menuVC.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) { [self] in
            menuVC.view.transform = CGAffineTransform(translationX: menuWidth, y: 0)
        }

        addChild(menuVC)
        
    }
    
    @objc func handleHide() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) { [self] in
            menuVC.view.transform = .identity
        }
        
//        menuVC.view.removeFromSuperview()
//        menuVC.removeFromParent()
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        
        cell.textLabel?.text = "Row: \(indexPath.row)"
        
        return cell
        
    }

}


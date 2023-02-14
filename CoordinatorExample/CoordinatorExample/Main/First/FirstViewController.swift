//
//  FirstViewController.swift
//  CoordinatorExample
//
//  Created by Akash Bhardwaj on 13/02/23.
//

import UIKit
import Combine

class FirstViewController: UIViewController {
    var firstDetailViewModel: FirstDetailViewModel!
    var detailRequested: () -> Void = {}
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .detailDisclosure)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setSubs()
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func setUpUI() {
        self.view.backgroundColor = .white
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(origin: .init(x: 10, y: 50), size: .init(width: 300, height: 200))
        nameLabel.text = "name is \(firstDetailViewModel.name), email\(firstDetailViewModel.email)"
        
        view.addSubview(button)
        button.frame = .init(origin: .init(x: 10, y: 250),
                             size: .init(width: 40, height: 40))
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    func setSubs () {
        firstDetailViewModel.$name.combineLatest(firstDetailViewModel.$email)
            .sink { [weak self] name, email in
                self?.nameLabel.text = "name is \(name), email\(email)"
                
            }
            .store(in: &subscriptions)
    }

    @objc
    func buttonPressed () {
        detailRequested()
    }
}

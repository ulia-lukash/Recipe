//
//  ViewController.swift
//  Recipe
//
//  Created by Uliana Lukash on 02.06.2024.
//

import UIKit

final class GetStartedViewController: UIViewController {

//    lazy private var backgroundImage: UIImageView = {
//        let image = UIImage(named: "Backdrop")
//        let imageView = UIImageView(image: image)
//        return imageView
//    }()
    lazy private var label: UILabel = {
        let label = UILabel()
        label.text = "Explore, Cook, Share."
        label.font = .systemFont(ofSize: 64, weight: .bold)
        label.textColor =  UIColor.white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 4.0
        label.layer.shadowOpacity = 0.25
        label.layer.shadowOffset = CGSize(width: 0, height: 6)
        return label
    }()
    
    lazy private var bottomView: BottomView = {
        let view = BottomView()
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.delegate = self
        view.setButton(buttonText: "Get Started", buttonType: .getStarted)
        view.setLabel(labelText: "Already have an account? Login", linkType: .login)
        return view
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }

    private func setUp() {
        view.backgroundColor = UIColor(named: "Primary")
        [label, bottomView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 233),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46),
            label.heightAnchor.constraint(equalToConstant: 234),
            
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -190),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }

}

extension GetStartedViewController: BottomViewDelegate {
    
    func presentViewController(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
}

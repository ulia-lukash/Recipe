//
//  OnboardingViewController.swift
//  Recipe
//
//  Created by Uliana Lukash on 05.06.2024.
//

import Foundation
import UIKit

final class OnboardingViewController: UIViewController {
    
    lazy private var toplabel: UILabel = {
        let label = UILabel()
        label.text = "What’s Inside?"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    lazy private var separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "LightGrey")
        return view
    }()
    
    lazy private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    lazy private var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGrey
        pageControl.currentPageIndicatorTintColor = .primary
        return pageControl
    }()
    
    lazy private var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy private var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "LightGrey")?.cgColor
        button.setTitleColor(UIColor(named: "LightGrey"), for: .normal)
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = UIColor(named: "Primary")
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 23
        button.isHidden = true
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUp()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func setUp() {
        view.backgroundColor = .white
        [toplabel, separator, scrollView, pageControl, nextButton, skipButton, continueButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setConstraints()
        scrollView.delegate = self
        let views: [UIView] = [FirstOnBView(), SecondOnBView(), ThirdOnBView(), FourthOnBView()]
        setupSlideScrollView(slides: views)
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            toplabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            toplabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            toplabel.heightAnchor.constraint(equalToConstant: 22),
            
            separator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            separator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 24),
            scrollView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -16),
            
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -16),
            pageControl.heightAnchor.constraint(equalToConstant: 12),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 46),
            nextButton.bottomAnchor.constraint(equalTo: skipButton.topAnchor, constant: -12),
            
            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            skipButton.heightAnchor.constraint(equalToConstant: 46),
            skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 46),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc private func nextButtonTapped() {
        scrollView.contentOffset.x += view.frame.width
        toggleButtons()
    }
    
    @objc private func skipButtonTapped() {
        scrollView.contentOffset.x = view.frame.width * 3
        toggleButtons()
    }
    
    @objc private func continueButtonTapped() {
        
    }
    
    private func setupSlideScrollView(slides : [UIView]) {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: 300)
            scrollView.addSubview(slides[i])
        }
    }
    
//    TODO: более плавное переключение кнопок...
    private func toggleButtons() {
        if scrollView.contentOffset.x > view.frame.width * 2 {
            nextButton.isHidden = true
            skipButton.isHidden = true
            continueButton.isHidden = false
        } else {
            nextButton.isHidden = false
            skipButton.isHidden = false
            continueButton.isHidden = true
        }
    }
}

extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        toggleButtons()
    }
}

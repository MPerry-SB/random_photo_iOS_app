//
//  ViewController.swift
//  Random_Photo_App
//
//  Created by Mitchell Perry on 22/03/2022.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        view.addSubview(button)
        button.frame = CGRect(x: 20,
                              y: view.frame.size.height-100-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-40,
                              height: 50)

        imageView.frame = CGRect(x:0,
                                 y:0,
                                 width: 300,
                                 height:300)
        imageView.center = view.center
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    
    @objc func didTapButton(){
        getRandomPhoto()
    }
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        guard let url = URL(string: urlString) else { return }
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}


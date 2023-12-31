//
//  ViewController.swift
//  Random Photo
//
//  Created by Mac on 12/18/23.
//  Copyright © 2023 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // image view that shows a random photo everytime a button is tapped
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    // creating a custom button
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    // Setting up multiple background colors
    let colors: [UIColor] = [
    .systemPink,
    .systemBlue,
    .systemRed,
    .systemGray,
    .systemIndigo,
    .systemYellow,
    .systemTeal,
    .systemOrange]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Attaching imageView to View
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)

        getRandomPhoto()
        
        // attaching the button to the function
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    /* Making the button to do something
     @objc attaches the function to a button */
    @objc func didTapButton() {
        getRandomPhoto()
        
        // changes background color when button is tapped
        view.backgroundColor = colors.randomElement()
    }
    
    // Button position oand size
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150,
                                     width: view.frame.size.width-60, height: 50)
    }

    // adding URL to get image contents
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url)
            else { return
                
        }
        // creating image from the data
        imageView.image = UIImage(data: data)
    }
    
}


//
//  IntroViewController.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit
import AVKit

class IntroViewController: BaseViewController {

  // MARK: - IBOutlets

  @IBOutlet weak var aboutLabel: AMLabel!

  // MARK: - Properties

  weak var delegate: IntroViewControllerDelegate?

  // MARK: Private properties
  private var player: AVPlayer!

  // MARK: - View Controller lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.hideAllViews()
    
    aboutLabel.setTextWithTypeAnimation(typedText: "intro_about_text".localize, characterDelay:  10)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    view.showAllViews()
  }

  // MARK: - IBActions

  @IBAction func letsGo(_ sender: Any) {
    delegate?.nextViewController()
  }
  
}

protocol IntroViewControllerDelegate: AnyObject {
  func nextViewController()
}

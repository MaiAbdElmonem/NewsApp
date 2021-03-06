//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit
import Shared

class NewsTableViewCell: UITableViewCell {
  
  // MARK: - IBOutlets

  @IBOutlet weak var newImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var containerView: UIView!

  
  // MARK: - View lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()

    containerView.backgroundColor = Theme.colors.mainLight
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    containerView.roundedCorner(radius: 10)
  }
  
  // MARK: - Setups
  
  func setupCellWith(news: NewsViewModel?) {
    guard let news = news else {
      return
    }
    if let imageLink = news.urlToImage, let url = URL(string: imageLink) {
      newImageView.setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeholder"))
    } else {
      newImageView.image = #imageLiteral(resourceName: "placeholder")
    }
    titleLabel.text = news.title
    dateLabel.text = news.publishedAt
    authorLabel.text = news.author != nil ? news.author : news.sourceName
    authorLabel.textColor = Theme.colors.red
  }
  
}

//
//  HomeFestivalCell.swift
//  Basecamp
//
//  Created by Sang hun Lee on 2022/12/18.
//

import UIKit
import Kingfisher

class HomeFestivalCell: UICollectionViewCell {
  static let identifier = "HomeFestivalCell"
  
  private var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "placeHolder")
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.alpha = 0.7
    imageView.layer.cornerRadius = 12.0
    return imageView
  }()
  
  private var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "축제 개요"
    label.textColor = .white
    label.font = .title3M14
    return label
  }()
  
  private var rangeLabel: UILabel = {
    let label = UILabel()
    label.text = "캠핑장 위치"
    label.textColor = .white
    label.font = .body4R12
    return label
  }()
  
  // Image, name, date
  override init(frame: CGRect) {
    super.init(frame: frame)
    setConstraint()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setConstraint() {
    [imageView, titleLabel, rangeLabel].forEach {
      contentView.addSubview($0)
    }
    
    contentView.backgroundColor = .black
    contentView.layer.cornerRadius = 12.0
    contentView.clipsToBounds = true
    
    imageView.snp.makeConstraints {
      $0.edges.equalTo(safeAreaLayoutGuide)
    }
    
    rangeLabel.snp.makeConstraints {
      $0.bottom.equalToSuperview().offset(-8.0)
      $0.leading.equalToSuperview().offset(12.0)
      $0.trailing.equalToSuperview().offset(-12.0)
    }
    
    titleLabel.snp.makeConstraints {
      $0.bottom.equalTo(rangeLabel.snp.top)
      $0.trailing.equalToSuperview().offset(-12.0)
      $0.leading.equalToSuperview().offset(12.0)
    }
  }

  func setData(touristInfo: TouristInfo) {
    guard let urlString = touristInfo.subImage else { return }
    let url = URL(string: urlString)
    let processor = DownsamplingImageProcessor(size: CGSize(width: 300, height: 400))
    imageView.kf.indicatorType = .activity
    imageView.kf.setImage(
        with: url,
        placeholder: UIImage(named: "placeHolder"),
        options: [
            .processor(processor),
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
    {
        result in
        switch result {
        case .success(let value):
            print("Task done for: \(value.source.url?.absoluteString ?? "")")
        case .failure(let error):
            print("Job failed: \(error.localizedDescription)")
        }
    }
    
    titleLabel.text = touristInfo.title
    
    guard let eventStartDate = touristInfo.eventStartDate, let eventEndDate = touristInfo.eventEndDate else { return }
    
    rangeLabel.text = eventStartDate.toString(format: "MM.dd") + " ~ " + eventEndDate.toString(format: "MM.dd")
  }
}

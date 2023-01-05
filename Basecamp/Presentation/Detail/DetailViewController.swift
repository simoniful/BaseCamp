//
//  DetailViewController.swift
//  Basecamp
//
//  Created by Sang hun Lee on 2023/01/02.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

final class DetailViewController: UIViewController {
  private let name: String
  
  private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  lazy var rightBarShareButton: UIBarButtonItem = {
    let barButton = UIBarButtonItem()
    barButton.image = UIImage(systemName: "square.and.arrow.up")
    barButton.style = .plain
    return barButton
  }()
  
  lazy var rightBarDropDownButton: UIBarButtonItem = {
    let barButton = UIBarButtonItem()
    barButton.image = UIImage(systemName: "ellipsis")
    barButton.style = .plain
    return barButton
  }()
  
  let viewModel: DetailViewModel
  private let disposeBag = DisposeBag()
  
  private lazy var input = DetailViewModel.Input(
     viewWillAppear: self.rx.viewWillAppear.asObservable()
  )
  
  private lazy var output = viewModel.transform(input: input)
  
  init(viewModel: DetailViewModel, name: String) {
    self.viewModel = viewModel
    self.name = name
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bind()
    register()
    setupNavigationBar()
    setViews()
    setConstraints()
  }
  
  func bind() {
    switch viewModel.style {
    case .campsite:
      collectionView.collectionViewLayout = viewModel.createLayout()
      let dataSource = viewModel.campsiteDataSource()
      output.data
        .drive(self.collectionView.rx.items(dataSource: dataSource))
    case .touristInfo:
      print("Not yet")
    }
  }
}


private extension DetailViewController {
  private func setViews() {
    view.addSubview(collectionView)
  }
  
  private func setConstraints() {
    collectionView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
  func setupNavigationBar() {
    navigationItem.largeTitleDisplayMode = .never
    navigationController?.navigationBar.topItem?.title = ""
    navigationItem.title = name
    navigationItem.rightBarButtonItems = [
      rightBarShareButton,
      rightBarDropDownButton
    ]
  }

  
  func register() {
    self.collectionView.register(HomeHeaderCell.self, forCellWithReuseIdentifier: HomeHeaderCell.identifier)
    self.collectionView.register(HomeAreaCell.self, forCellWithReuseIdentifier: HomeAreaCell.identifier)
    self.collectionView.register(HomeCampsiteCell.self, forCellWithReuseIdentifier: HomeCampsiteCell.identifier)
    self.collectionView.register(HomeFestivalCell.self, forCellWithReuseIdentifier: HomeFestivalCell.identifier)
    self.collectionView.register(HomeSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeSectionHeader.identifier)
  }
}

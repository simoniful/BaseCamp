//
//  HomeViewController.swift
//  Basecamp
//
//  Created by Sang hun Lee on 2022/12/14.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
  private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  lazy var rightBarSearchButton: UIBarButtonItem = {
    let barButton = UIBarButtonItem()
    barButton.image = UIImage(systemName: "magnifyingglass")
    barButton.style = .plain
    return barButton
  }()
  
  lazy var rightBarListButton: UIBarButtonItem = {
    let barButton = UIBarButtonItem()
    barButton.image = UIImage(systemName: "list.bullet")
    barButton.style = .plain
    return barButton
  }()
  
  lazy var rightBarMapButton: UIBarButtonItem = {
    let barButton = UIBarButtonItem()
    barButton.image = UIImage(systemName: "mappin.and.ellipse")
    barButton.style = .plain
    return barButton
  }()
  
  private let viewModel: HomeViewModel
  private let disposeBag = DisposeBag()
  
  private lazy var input = HomeViewModel.Input(
    viewDidLoad: self.rx.viewDidLoad.asObservable(),
    viewWillAppear: self.rx.viewWillAppear.asObservable(),
    didSelectItemAt: self.collectionView.rx.modelAndIndexSelected(HomeItem.self).asSignal()
  )
  
  private lazy var output = viewModel.transform(input: input)
  
  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("HomeViewController: fatal error")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bind()
    register()
    setupNavigationBar()
    setViews()
    setConstraints()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    self.collectionView.performBatchUpdates(nil, completion: nil)
  }
  
  func bind() {
    collectionView.collectionViewLayout = viewModel.createLayout()
    let dataSource = viewModel.dataSource()
    
    output.data
      .drive(self.collectionView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
}

private extension HomeViewController {
  private func setViews() {
    view.addSubview(collectionView)
  }
  
  private func setConstraints() {
    collectionView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
  func setupNavigationBar() {
    setupLogo()
    navigationItem.largeTitleDisplayMode = .never
    navigationItem.rightBarButtonItems = [
      rightBarMapButton,
      rightBarListButton,
      rightBarSearchButton
    ]
  }
  
  func setupLogo() {
    let logoImage = UIImage.init(named: "logo")
    let logoImageView = UIImageView.init(image: logoImage)
    logoImageView.frame = CGRect(x: 0.0, y: 0.0,  width: 44, height: 44.0)
    logoImageView.contentMode = .scaleAspectFit
    let imageItem = UIBarButtonItem.init(customView: logoImageView)
    logoImageView.snp.makeConstraints {
      $0.width.height.equalTo(44)
    }
    navigationItem.leftBarButtonItem = imageItem
  }
  
  func register() {
    self.collectionView.register(HomeHeaderCell.self, forCellWithReuseIdentifier: HomeHeaderCell.identifier)
    self.collectionView.register(HomeAreaCell.self, forCellWithReuseIdentifier: HomeAreaCell.identifier)
    self.collectionView.register(HomeCampsiteCell.self, forCellWithReuseIdentifier: HomeCampsiteCell.identifier)
    self.collectionView.register(HomeFestivalCell.self, forCellWithReuseIdentifier: HomeFestivalCell.identifier)
    self.collectionView.register(HomeSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeSectionHeader.identifier)
  }
}


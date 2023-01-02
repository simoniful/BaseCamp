//
//  HomeCoordinator.swift
//  Basecamp
//
//  Created by Sang hun Lee on 2022/12/14.
//

import Foundation
import UIKit
import Toast

final class HomeCoordinator: Coordinator {
  
  weak var delegate: CoordinatorDelegate?
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  var type: CoordinatorStyleCase = .home
  
  init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
    //        navigationController.setNavigationBarHidden(true, animated: false)
  }
  
  func start() {
    let vc = HomeViewController(
      viewModel: HomeViewModel(
        coordinator: self,
        homeUseCase: HomeUseCase(
          realmRepository: RealmRepository(),
          campsiteRepository: CampsiteRepository(),
          touristInfoRepository: TouristInfoRepository()
        )
      )
    )
    navigationController.pushViewController(vc, animated: true)
  }
  
  func showCampsiteDetailViewController(campsite: Campsite) {
    let vc = UIViewController()
    
    vc.hidesBottomBarWhenPushed = true
  }
  
  func changeTabByIndex(tabCase: TabBarPageCase ,message: String) {
    navigationController.tabBarController?.selectedIndex = tabCase.pageOrderNumber
      navigationController.tabBarController?.view.makeToast(message, position: .top)
  }
  
  func popToRootViewController(message: String? = nil) {
    navigationController.popToRootViewController(animated: true)
    if let message = message {
      navigationController.view.makeToast(message, position: .top)
    }
  }
}

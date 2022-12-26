//
//  ViewController.swift
//  MyFavoriteStoreList
//
//  Created by changgyo seo on 2022/12/26.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let nakyungProfileImageView: UIButton = {
        let imageView = UIImageView(image: UIImage(named: "nakyung"))
        
        let container = UIButton()
        container.roundedAndAddShadow(to: imageView)
        
        return container
    }()
    let jongseoProfileImageView: UIButton = {
        let imageView = UIImageView(image: UIImage(named: "jongseo"))
        
        let container = UIButton()
        container.roundedAndAddShadow(to: imageView)
        
        return container
        
    }()
    let changgyoProfileImageView: UIButton = {
        let imageView = UIImageView(image: UIImage(named: "changgyo"))
        
        let container = UIButton()
        container.roundedAndAddShadow(to: imageView)
        
        return container
    }()
    let pushNextVCObserver: PublishSubject<String> = {
        let publisher = PublishSubject<String>()
        
        return publisher
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // AutoLayOut
        layout()
        settingObserver()
        bind()
    }
    
    private func settingObserver() {
        pushNextVCObserver
            .subscribe { [weak self] userId in
                guard let self = self else { return }
                
                let mainMapViewController = MainMapViewController(dependency: userId)
            
                self.navigationController?.pushViewController(mainMapViewController, animated: false)
            }
            .disposed(by: disposeBag)
    }
    
    private func bind() {
        changgyoProfileImageView.rx.tap
            .bind { _ in self.pushNextVCObserver.onNext("changgyo") }
            .disposed(by: disposeBag)
        
        nakyungProfileImageView.rx.tap
            .bind { _ in self.pushNextVCObserver.onNext("nakyung") }
            .disposed(by: disposeBag)
        
        jongseoProfileImageView.rx.tap
            .bind { _ in self.pushNextVCObserver.onNext("jongseo") }
            .disposed(by: disposeBag)
    }
    
    private func layout() {
        view.addSubviews([nakyungProfileImageView,
                         jongseoProfileImageView,
                         changgyoProfileImageView])
        
        nakyungProfileImageView.snp.makeConstraints {
            $0.width.height.equalTo(drawConstants.profileSize)
            $0.centerX.centerY.equalToSuperview()
        }
        
        jongseoProfileImageView.snp.makeConstraints {
            $0.width.height.equalTo(drawConstants.profileSize)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(drawConstants.inset)
        }
        
        changgyoProfileImageView.snp.makeConstraints {
            $0.width.height.equalTo(drawConstants.profileSize)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(drawConstants.inset)
        }
    }
}
extension LoginViewController {
    
    struct drawConstants {
        static let profileSize = 100
        static let inset = 20
    }
}


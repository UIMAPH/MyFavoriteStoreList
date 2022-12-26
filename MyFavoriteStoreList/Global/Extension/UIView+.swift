//
//  UIView + .swift
//  MyFavoriteStoreList
//
//  Created by changgyo seo on 2022/12/26.
//

import Foundation
import SnapKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach(self.addSubview)
    }
    
    func makeRounded() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
    
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: 10, height: 10)
        layer.shadowRadius = 10
    }
    
    func roundedAndAddShadow(to view: UIView) {
        self.addSubview(view)
        self.addShadow()
        view.makeRounded()
        view.contentMode = .scaleToFill
        view.snp.makeConstraints { $0.edges.equalToSuperview()}
    }
    
    
    
}

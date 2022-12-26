//
//  LoginViewModel.swift
//  MyFavoriteStoreList
//
//  Created by changgyo seo on 2022/12/26.
//

import UIKit
import RxSwift
import RxCocoa

class MainMapViewModel {
    
    let disposeBag = DisposeBag()
    
    // userid를 String 하나로 할 것이기 때문에 depency는 String이면 충분하다.
    var dependency: String
    
    init(dependency: String){
        
        self.dependency = dependency
    }
    
    struct input {
        
    }
    
    struct output {
        
    }
    

}

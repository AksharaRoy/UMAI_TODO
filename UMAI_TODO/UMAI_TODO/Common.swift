//
//  Common.swift
//  UMAI_TODO
//
//  Created by Akshara on 15/09/17.
//  Copyright © 2017 UMAI. All rights reserved.
//

import UIKit

class Common {
  static let sharedInstance = Common()  // singleton object
  
  var items: [TodoItem] = []
}

//
//  DTUBattery.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/16/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import Foundation


class DTUBattery : DTUSensor {
    
    func initwithConfiguration () {
    
    }
    
    
    func isSensorAvailable() -> Bool {
        //No battery no life !
        return true
    }
    
    
}

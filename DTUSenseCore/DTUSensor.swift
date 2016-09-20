//
//  DTUSensor.swift
//  DTUSenseCore
//
//  Created by Trevon Fernando on 9/19/16.
//  Copyright © 2016 DTU. All rights reserved.
//

import UIKit

public class DTUSensor: NSObject {
    
    
    var sensorType : SensorType!
    var sensorConfiguration : DTUSensorConfiguration? = DTUSensorConfiguration()
    var sensorDataListeners : [String : DTUSensorDataHandler.CompletionBlock] = [:]
    var sensing : Bool = false
    
    public func subscribeHandler(handler : @escaping DTUSensorDataHandler.CompletionBlock) {
        
        if (sensorDataListeners[self.sensorType.rawValue] != nil) {
            print("Handler Already registered")
        }
        
        //Maybe use else to catch extra handlers
        sensorDataListeners[self.sensorType.rawValue] = handler
        
    }
    
    
    public func unsubscribeHandler(handler : DTUSensorDataHandler.CompletionBlock) {
        if sensorDataListeners[self.sensorType.rawValue] == nil{
            print("Handler is not registered")
        }
        
        //Maybe use else to catch extra handlers
        sensorDataListeners.removeValue(forKey: sensorType.rawValue)
    }
    
    
    func unsubscribeAllHandlers() {
        sensorDataListeners.removeAll()
    }
    
    
    func sensorDataListenersList() -> [DTUSensorDataHandler.CompletionBlock] {
        return Array(sensorDataListeners.values)
    }
    
    
    func startSensing() {
        sensing = true
    }
    
    func stopSensing() {
        sensing = false
    }
    
    
    func shouldPostSensorData() -> Bool {
        return true
    }
    
    func submitSensorData(data : DTUSensorData)  {
        if shouldPostSensorData() {
            if sensorDataListeners.count > 0 {
                for handler : DTUSensorDataHandler.CompletionBlock in sensorDataListeners.values {
                    handler(self.sensorType, data)
                }
            }
        }
    }
    
}

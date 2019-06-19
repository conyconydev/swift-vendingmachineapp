//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Elena on 07/05/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine: VendingMachine?
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            try vendingMachine = AppDelegate.load()
        } catch {
            vendingMachine = AppDelegate.set()
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) {
        AppDelegate.archive(vendingMachine: vendingMachine)
    }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) {
        AppDelegate.archive(vendingMachine: vendingMachine)
    }
    
    static func archive(vendingMachine: VendingMachine?) {
        guard let vendingMachine = vendingMachine else { return }
        let vendingMachineEncoded = try? NSKeyedArchiver.archivedData(
            withRootObject: vendingMachine,
            requiringSecureCoding: false)
        UserDefaults.standard.set(vendingMachineEncoded, forKey:"vendingMachine")
        
    }
    
    enum loadError: Error {
        case noData
        case noLoad
    }
    
    static func load() throws -> VendingMachine? {
        guard let data = UserDefaults.standard.data(forKey: "vendingMachine") else { throw loadError.noData }
        guard let vendingMachine = try NSKeyedUnarchiver
            .unarchiveTopLevelObjectWithData(data) as? VendingMachine else { throw loadError.noLoad }
        return vendingMachine
    }

    static func set() -> VendingMachine {
        return VendingMachine.init(list: Inventory(list: [ObjectIdentifier: Packages]()))
    }
    
}


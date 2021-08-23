//
//  UserSettings.swift
//  UserSettings
//
//  Created by Vincio on 8/23/21.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var isFirstLoad: Bool {
        didSet {
            UserDefaults.standard.set(isFirstLoad, forKey: "load")
        }
    }

    init() {
        self.isFirstLoad = UserDefaults.standard.object(forKey: "load") as? Bool ?? true
    }
}

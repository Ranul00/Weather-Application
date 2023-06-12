//
//  CourseWork2StarterApp.swift
//  CourseWork2Starter
//
//  Ranul Akmeemana on 2023-03-31.
//

import SwiftUI

@main
struct CourseWork2StarterApp: App {
    @StateObject var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

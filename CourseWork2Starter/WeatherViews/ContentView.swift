//
//  ContentView.swift
//  CourseWork2Starter
//
//  Ranul Akmeemana on 2023-03-31.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        //        NavBar()
        
        var views = [ Home(),
                              CurrentWeatherView(),
                              HourlyView(),
                              ForecastView(),
                              PollutionView()
        ] as [Any]
        
        var count: Int = 0
        
        ZStack {
            VStack{
                TabView(selection: $selectedTab) {
                    if selectedTab == .house {
                        Home()
                            
                    }
                    
                    if selectedTab == .cloudSun {
                        CurrentWeatherView()
                            
                    }
                    

                    HourlyView()
                        .tabItem {
                            Text("gg")
                        }
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

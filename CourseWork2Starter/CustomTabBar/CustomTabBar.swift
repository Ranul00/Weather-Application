//
//  CustomTabBar.swift
//  CourseWork2Starter
//
//  Created by Ranul Akmeemana on 2023-06-12.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house = "house"
    case cloudSun = "cloud.sun"
    case forecast = "clock"
    case pollution = "sun.dust"
    
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue )
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                    
                }
            }
            .frame(width: nil, height: 60)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}

//
//  Hourly.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct HourlyView: View {
    
   @EnvironmentObject var modelData: ModelData

    var body: some View {
        ZStack {
//            Image("background")
//                .resizable()
//                .ignoresSafeArea()
//                .overlay(.ultraThinMaterial)
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.vertical)
            
            
            VStack{
                Text("\(modelData.userLocation)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                List {
                    ForEach(modelData.forecast!.hourly) { hour in
                        HourCondition(current: hour)
                        
                    }
                    .listRowBackground(Color(hue: 0.608, saturation: 0.98, brightness: 0.229).opacity(0.4))
                }
    
                //                .frame(height: UIScreen.main.bounds.height * 0.8)
                //                .foregroundStyle(.ultraThinMaterial)
                                .scrollContentBackground(.hidden)
                                .mask(LinearGradient(colors: [.black, .white, .clear], startPoint: .top, endPoint: .bottom))
//                                .background(.ultraThinMaterial)
//                .background(Color.white.opacity(0.5))
//                .scrollContentBackground(.hidden)
//                Spacer()
            }
            
        }
        
    }
}

struct Hourly_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView().environmentObject(ModelData())
    }
}

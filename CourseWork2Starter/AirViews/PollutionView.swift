//
//  PollutionView.swift
//  Coursework2
//
//  Created by Ranul Akmeemana on 2023-03-31.
//


import SwiftUI

struct PollutionView: View {
    
    // @EnvironmentObject and @State varaibles here
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        
        ZStack {
            //            Image("background")
            //                .resizable()
            //                .ignoresSafeArea()
            // Use ZStack for background images
            
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.vertical)
            
            
            VStack {
                Text("\(modelData.userLocation)")
                    .fontWeight(.semibold)
                Text("Temp: \((Int)(modelData.forecast!.current.temp))ºC")
                
                
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                
                Text("\(modelData.forecast!.current.weather[0].weatherDescription.rawValue)")
                    .textCase(.uppercase)
                    .padding()
                    .font(.title2)
                    .bold()
                
                VStack (spacing: 20) {
                    Label {
                        Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC")
                    } icon: {
                        Image(systemName: "thermometer.medium")
                            .foregroundColor(.red)
                    }
                                            
                    Label {
                        Text("Air Quality Data")
                    } icon: {
                        Image(systemName: "aqi.medium")
                            .foregroundColor(.teal)
                    }
                    .font(.title2)
                    
                    HStack {
                        VStack {
                            Image ("so2")
                            Text("\(String(format: "%.2f", modelData.airPollutionData?.list[0].components.so2 ?? 0.0))")
                            //                    Text("\(modelData)")
                        }
                        VStack {
                            Image ("no")
                            Text("\(String(format: "%.2f", modelData.airPollutionData?.list[0].components.no ?? 0.0))")
                        }
                        VStack {
                            Image ("voc")
                            Text("\(String(format: "%.2f", modelData.airPollutionData?.list[0].components.nh3 ?? 0.0))")
                        }
                        
                    }
                    VStack {
                        Image ("pm")
                        Text("\(String(format: "%.2f", modelData.airPollutionData?.list[0].components.pm10 ?? 0.0))")
                    }
                    
                }
                .padding()
                .multilineTextAlignment(.center)
                .padding()
                .frame(width:(UIScreen.main.bounds.width - 20))
//                .background(.ultraThinMaterial)
                .background(Color(hue: 0.608, saturation: 0.98, brightness: 0.229).opacity(0.4))
                .foregroundStyle(.white)
                .cornerRadius(20)
                Spacer()
                
            }
        }
        .onAppear {
            Task {
                try await modelData.loadPollutionData()
            }
        }
    }
}




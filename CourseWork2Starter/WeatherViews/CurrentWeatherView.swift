//
//  Conditions.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct CurrentWeatherView: View {
    @EnvironmentObject var modelData: ModelData
    @State var locationString: String = "No location"
       
    var body: some View {
        ZStack {
            // Background Image rendering code here
//            Image("background2")
//                .resizable()
//                .ignoresSafeArea()
//                .overlay(.ultraThinMaterial)
            
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.vertical)
            
            
            
            VStack(spacing: 20) {
                Text("\(modelData.userLocation)")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Text("\((Int)(modelData.forecast!.current.temp))ºC")
                    .font(.system(size: 100))
                    .fontWeight(.heavy)
                    .mask(LinearGradient(colors: [.white, .white, .clear], startPoint: .top, endPoint: .bottom))
                //                    .bold()
                
                HStack {
                    AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                    
                    Text(modelData.forecast!.current.weather[0].weatherDescription.rawValue.capitalized)
                        .bold()
                }
                
                Spacer()
                
                Text("Current Weather Details")
                    .font(.title2)
                    .fontWeight(.heavy)
                
                Spacer()
                ScrollView(showsIndicators: false) {
                    VStack {
                        Label {
                            Text("Feels Like : \((Int)(modelData.forecast!.current.feelsLike))ºC")
                                .fontWeight(.semibold)
                        } icon: {
                            Image(systemName: "thermometer.medium")
                                .foregroundColor(.red)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 20)
                        .background(.ultraThinMaterial)
                        .background(.blue.opacity(0.5))
                        .foregroundStyle(.white)
                        .cornerRadius(20)
                        
                        HStack {
                            Label {
                                Text("Wind Speed: \((Int)(modelData.forecast!.current.feelsLike)) m/s")
                                    .fontWeight(.semibold)
                            } icon: {
                                Image(systemName: "wind")
                                    .foregroundColor(.yellow)
                            }
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width:(UIScreen.main.bounds.width - 20) * 0.49, height: 150)
                            .background(.ultraThinMaterial)
                            .background(.blue.opacity(0.5))
                            .foregroundStyle(.white)                   .cornerRadius(20)

//                            Label("Wind Speed: \((Int)(modelData.forecast!.current.feelsLike)) m/s", systemImage: "wind")
//                                .multilineTextAlignment(.center)
//                                .padding()
//                                .frame(width:(UIScreen.main.bounds.width - 20) * 0.49, height: 150)
//                                .background(.ultraThinMaterial)
//                                .background(.blue.opacity(0.5))
//                                .foregroundStyle(.white)                                .cornerRadius(20)
                            
//                            Text("Direction: \(convertDegToCardinal(deg:modelData.forecast!.current.windDeg))")
//                                .padding()
//                                .frame(width:(UIScreen.main.bounds.width - 20) * 0.49, height: 150)
//                                .background(.ultraThinMaterial)
//                                .background(.blue.opacity(0.5))
//                                .foregroundStyle(.white)
//                                .cornerRadius(20)
                            
                            Label {
                                Text("Direction: \(convertDegToCardinal(deg:modelData.forecast!.current.windDeg))")
                                    .fontWeight(.semibold)
                            } icon: {
                                Image(systemName: "safari")
                                    .foregroundColor(.green)
                            }
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width:(UIScreen.main.bounds.width - 20) * 0.49, height: 150)
                            .background(.ultraThinMaterial)
                            .background(.blue.opacity(0.5))
                            .foregroundStyle(.white)                   .cornerRadius(20)
                        }
                        
                        HStack {
                            
//                            Text("Humidity: \((Int)(modelData.forecast!.current.humidity))%")
//                                .padding()
//                                .frame(width:(UIScreen.main.bounds.width - 20) * 0.49, height: 150)
//                                .background(.ultraThinMaterial)
//                                .background(.blue.opacity(0.5))
//                                .foregroundStyle(.white)                                .cornerRadius(20)
//
                            Label {
                                Text("Humidity: \((Int)(modelData.forecast!.current.humidity))%")
                                    .fontWeight(.semibold)
                            } icon: {
                                Image(systemName: "humidity")
                                    .foregroundColor(.white)
                            }
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width:(UIScreen.main.bounds.width - 20) * 0.49, height: 150)
                            .background(.ultraThinMaterial)
                            .background(.blue.opacity(0.5))
                            .foregroundStyle(.white)                   .cornerRadius(20)

                            Label {
                                Text("Pressure: \((Int)(modelData.forecast!.current.pressure)) hPa")
                                    .fontWeight(.semibold)
                            } icon: {
                                Image(systemName: "speedometer")
                                    .foregroundColor(.orange)
                            }
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width:(UIScreen.main.bounds.width - 20) * 0.49, height: 150)
                            .background(.ultraThinMaterial)
                            .background(.blue.opacity(0.5))
                            .foregroundStyle(.white)                   .cornerRadius(20)
                            
//                            Text("Pressure: \((Int)(modelData.forecast!.current.pressure)) hPa")
//                                .multilineTextAlignment(.center)
//                                .padding()
//                                .frame(width:(UIScreen.main.bounds.width - 20) * 0.49, height: 150)
//                                .background(.ultraThinMaterial)
//                                .background(.blue.opacity(0.5))
//                                .foregroundStyle(.white)                                .cornerRadius(20)
                        }
                        
                        HStack{
                            
                            HStack {
                                Image(systemName: "sunrise.fill")
                                    .foregroundColor(.yellow)
                                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.sunrise ?? 0))))
                                    .formatted(.dateTime.hour().minute()))
                                .fontWeight(.semibold)
                            }
                            .padding()
                            .frame(width:(UIScreen.main.bounds.width - 20) * 0.49)
                            .background(.ultraThinMaterial)
                            .background(.blue.opacity(0.5))
                            .foregroundStyle(.white)                            .cornerRadius(20)
                            
                            HStack {
                                
                                Image(systemName: "sunset.fill")
                                    .foregroundColor(.yellow)
                                
                                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.sunset ?? 0))))
                                    .formatted(.dateTime.hour().minute()))
                                .fontWeight(.semibold)
                                
                                
                            }
                            .padding()
                            .frame(width:(UIScreen.main.bounds.width - 20) * 0.49)
                            .background(.ultraThinMaterial)
                            .background(.blue.opacity(0.5))
                            .foregroundStyle(.white)
                            .cornerRadius(20)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct Conditions_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
            .environmentObject(ModelData())
    }
}

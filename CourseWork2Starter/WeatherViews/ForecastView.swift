//
//  Forecast.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct ForecastView: View {
    @EnvironmentObject var modelData: ModelData
    @State var locationString: String = "No location"
    
    var body: some View {
        ZStack {
//            Image("background2")
//                .resizable()
//                .ignoresSafeArea()
//                .overlay(.ultraThinMaterial)
            
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.vertical)
            
            VStack{
                Text("\(modelData.userLocation)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                List{
                    ForEach(modelData.forecast!.daily) { day in
                        DailyView(day: day)
                    }
                    .listRowBackground(Color(hue: 0.608, saturation: 0.98, brightness: 0.229).opacity(0.4))

                }
//                .frame(height: UIScreen.main.bounds.height * 0.8)
//                .foregroundStyle(.ultraThinMaterial)
                .scrollContentBackground(.hidden)
                .mask(LinearGradient(colors: [.black, .white, .clear], startPoint: .top, endPoint: .bottom))
                

            }
        }
        .onAppear {
            Task.init {
                self.locationString = await getLocFromLatLong(lat: modelData.forecast!.lat, lon: modelData.forecast!.lon)
               
            }
        }
    }
}

struct Forecast_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView().environmentObject(ModelData())
    }
}

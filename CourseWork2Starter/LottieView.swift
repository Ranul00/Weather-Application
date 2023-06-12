//
//  LottieView.swift
//  CourseWork2Starter
//
//  Created by Ranul Akmeemana on 2023-04-01.
//

import Foundation
import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    let loopMode: LottieLoopMode
    

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: "scrollAnimation")
        let view = UIView(frame: .zero)
//        view.frame = CGRect(x: 20, y: 20, width: 10, height: 10)
        animationView.play()
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
//        NSLayoutConstraint.activate([
//            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
//            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
//        ])

        
        return animationView
    }
}

//
//  ButtonScaleStyle.swift
//  SwiftUI_Challenge4
//
//  Created by Danil Chernikov on 09.12.2023.
//

import SwiftUI

#Preview {
    SparrowPlayButton()
        .frame(width: 100, height: 100)
        .buttonStyle(ButtonScaleStyle(scale: 0.86, animationDuration: 0.22))
}

/*
 - Всё сделать в ButtonStyle. Кнопке только установить стиль.
 - Скейл 0.86. Длина анимации нажатия 0.22 секунды.
 - ⚠️ Анимация непрерываемая. Кнопка должна дойти до скейла и только после вернуться.
 */

struct ButtonScaleStyle: ButtonStyle {
    private let scale: Double
    private let animationDuration: TimeInterval
    
    init(scale: Double, animationDuration: TimeInterval) {
        self.scale = scale
        self.animationDuration = animationDuration
    }
    
    @State private var performScale = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 10)
            .background(alignment: .center) {
                GeometryReader { reader in
                    
                    Circle()
                        .offset(x: -3)
                        .foregroundStyle(.gray)
                        .opacity(performScale ? 0.5 : .zero)
                    
                }
            }
            .scaleEffect(performScale ? scale : 1)
            .onChange(of: configuration.isPressed) {
                guard configuration.isPressed else { return }
                
                withAnimation(.easeOut(duration: animationDuration)) {
                    performScale.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        withAnimation(.easeOut(duration: animationDuration)) {
                            performScale.toggle()
                        }
                    }
                }
            }
    }
}

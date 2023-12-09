//
//  SparrowPlayButton.swift
//  SwiftUI_Challenge4
//
//  Created by Danil Chernikov on 09.12.2023.
//

import SwiftUI

#Preview {
    SparrowPlayButton()
}

struct SparrowPlayButton: View {
    @State private var performAnimation = false
    
    var body: some View {
        Button {
            if !performAnimation {
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                    performAnimation.toggle()
                } completion: {
                    performAnimation.toggle()
                }
            }
        } label: {
            GeometryReader { reader in
                let width = reader.size.width / 2
                
                HStack(alignment: .center, spacing: 0) {
                    playIcon
                        .frame(width: performAnimation ? width : .zero)
                        .opacity(performAnimation ? 1 : .zero)
                    
                    playIcon
                        .frame(width: width)
                    
                    playIcon
                        .frame(width: performAnimation ? 0.5 : width)
                        .opacity(performAnimation ? .zero : 1)
                }
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
    }
    
    @ViewBuilder
    private var playIcon: some View {
        Image(systemName: "play.fill")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
    }
}

//
//  ContentView.swift
//  SwiftUI_Challenge4
//
//  Created by Danil Chernikov on 09.12.2023.
//

import SwiftUI

#Preview {
    ContentView()
}

struct ContentView: View {
    var body: some View {
        
        SparrowPlayButton()
            .frame(width: 100, height: 100)
            .buttonStyle(ButtonScaleStyle(scale: 0.86, animationDuration: 0.22))
            .foregroundStyle(.blue)
    }
}

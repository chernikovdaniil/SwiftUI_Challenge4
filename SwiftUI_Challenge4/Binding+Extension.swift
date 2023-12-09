//
//  Binding+Extension.swift
//  SwiftUI_Challenge4
//
//  Created by Danil Chernikov on 09.12.2023.
//

import SwiftUI

extension Binding {
    init(get value: Value) {
        self.init(get: { value }, set: { _ in })
    }
}

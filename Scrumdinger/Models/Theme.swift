/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable  { //Codable: protocal for persistency
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue) /* 열거형의 case 는 모두 독립적인 값이지만 내부에 또 다른 값을 저장할 수 있습니다. 이것을 원시값(raw value)이라고 합니다. 열거형을 정의할 때 원시값 저장은 필수사항이 아닙니다. */
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}

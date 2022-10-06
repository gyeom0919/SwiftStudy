//
//  IndicatorType.swift
//  CustomLoadingBtn
//
//  Created by 겸 on 2022/10/06.
//

import Foundation
import UIKit
import MHLoadingButton

enum IndicatorType: String, CaseIterable{ // CaseIterable for문
    
    case sysDefault = "System Default"
    case material = "Material Design"
    case ballPulseSync = "Ball Pulse Sync"
    case ballSpinFade = "Ball Spin"
    case ballPulse = "Ball Pulse"
    case lineScalePulse = "Line Scale Pulse"
    case lineScale = "Line Scale"
    case ballBeat = "Ball Beat"
    case lineSpin = "Line Spin"
    
    func getIndicator(_ color : UIColor = UIColor.gray) -> UIView & IndicatorProtocol{
        switch self {
        case .sysDefault:
            let indicator = UIActivityIndicatorView()
            indicator.color = color
            return indicator
        case .material:
            return MaterialLoadingIndicator(color: color)
        case .ballPulseSync:
            return BallPulseSyncIndicator(color: color)
        case .ballSpinFade:
            return BallSpinFadeIndicator(color: color)
        case .lineScalePulse:
            return LineScalePulseIndicator(color: color)
        case .lineScale:
            return LineScaleIndicator(color: color)
        case .ballPulse:
            return BallPulseIndicator(color: color)
        case .ballBeat:
            return BallBeatIndicator(color: color)
        case .lineSpin:
            return LineSpinFadeLoader(color: color)
        }
    }
}

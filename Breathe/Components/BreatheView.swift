//
//  BreatheView.swift
//  Breathe
//
//  Created by Andrew on 13.11.2019.
//  Copyright © 2019 Andrew Zaiets. All rights reserved.
//

import UIKit

class BreatheView: UIView {
    
    // MARK: - Properties
    
    private var phases: [Phase]?
    private var timer: Timer!
    
    private var initSize: CGSize!
    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        set()
        initSize = frame.size
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        set()
        initSize = frame.size
    }
    
    private func set() {
        timer = Timer()
        backgroundColor = .cyan
        frame.size = CGSize(width: frame.width * 0.75,
                            height: frame.height * 0.75)
    }
    
    deinit {
        timer.invalidate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startCycle()
    }
    
    // MARK: - Methods
    
    func config(with phases: [Phase]) {
        self.phases = phases
    }
    
    private var index = 0
    private func startCycle() {
        guard (phases?.count ?? 0) > index else {
            set()
            return
        }
        
        animatePhase(phase: phases![index]) {
            self.startCycle()
            self.index += 1
        }
    }
    
    private func animatePhase(phase: Phase, _ compleation: @escaping () -> Void) {
        self.backgroundColor = phase.parsedColor
        switch phase.type {
        case .inhale:
            UIView.animate(withDuration: phase.duration,
                           animations: { self.transform = CGAffineTransform(scaleX: 0.25, y: 0.25) },
                           completion: { _ in compleation() })
        case .exhale:
            UIView.animate(withDuration: phase.duration,
                           animations: { self.transform = CGAffineTransform(scaleX: 1, y: 1) },
                           completion: { _ in compleation() })
            
        case .hold:
            UIView.animate(withDuration: phase.duration,
                           animations: {  },
                           completion: { _ in compleation() })
        }
    }

}

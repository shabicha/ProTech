//
//  LiveCameraRepresentable.swift
//  co-ml
//
//  Created by Tiffany Tseng on 12/03/21.
//

import Foundation
import SwiftUI
import AVFoundation

struct LiveCameraRepresentable: UIViewControllerRepresentable {
    private var handleObservations: (LivePredictionResults, String, String) -> ()
    
    init(handleObservations: @escaping (LivePredictionResults, String, String) -> () ) {
        self.handleObservations = handleObservations
    }
    
    func makeUIViewController(context: Context) -> LiveCameraViewController {
        let vc = LiveCameraViewController(handleObservations: handleObservations)
        do {
            try vc.runSession()
        } catch {
            print(error.localizedDescription)
        }
        return vc
    }
    
    func updateUIViewController(_ cameraViewController: LiveCameraViewController, context: Context) {
    }
}

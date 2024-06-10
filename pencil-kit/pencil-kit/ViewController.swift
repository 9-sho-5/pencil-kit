//
//  ViewController.swift
//  pencil-kit
//
//  Created by ほしょ on 2024/06/10.
//

import UIKit
import PencilKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var pencilKitContainerView: UIView!
    
    private var canvasView = PKCanvasView()
    private let pkToolPicker = PKToolPicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCanvasView()
    }
    
    private func setupCanvasView() {
        configureCanvasView()
        configureToolPicker()
        addCanvasViewToContainer()
    }
    
    private func configureCanvasView() {
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 30)
        if #available(iOS 14.0, *) {
            canvasView.drawingPolicy = .anyInput
        }
        canvasView.frame = pencilKitContainerView.bounds
        canvasView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func configureToolPicker() {
        pkToolPicker.setVisible(true, forFirstResponder: canvasView)
        pkToolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
    
    private func addCanvasViewToContainer() {
        pencilKitContainerView.addSubview(canvasView)
    }
}


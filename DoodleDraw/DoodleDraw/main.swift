//
//  main.swift
//  DoodleDraw
//
//  Created by Sarah dos Santos Silva on 13/11/23.
//

import Foundation

// Protocolo para ferramentas de desenho
protocol DrawingTool {
    func drawLine()
    func drawCircle()
}

// Implementações concretas para ferramentas de desenho
class Pencil: DrawingTool {
    func drawLine() {
        print("Drawing a line with a pencil")
    }
    
    func drawCircle() {
        print("Drawing a circle with a pencil")
    }
}

class Brush: DrawingTool {
    func drawLine() {
        print("Drawing a line with a brush")
    }
    
    func drawCircle() {
        print("Drawing a circle with a brush")
    }
}

// Protocolo para a fábrica de ferramentas de desenho
protocol DrawingToolFactory {
    func createPencil() -> DrawingTool
    func createBrush() -> DrawingTool
}

// Implementações concretas para fábricas
class iOSDrawingToolFactory: DrawingToolFactory {
    func createPencil() -> DrawingTool {
        return Pencil()
    }
    
    func createBrush() -> DrawingTool {
        return Brush()
    }
}

class MacOSDrawingToolFactory: DrawingToolFactory {
    func createPencil() -> DrawingTool {
        return Pencil()
    }
    
    func createBrush() -> DrawingTool {
        return Brush()
    }
}

class ConsoleUI {
    func getUserInput() -> Int {
        print("Escolha uma ferramenta:")
        print("1. Lápis")
        print("2. Pincel")
        
        guard let userInput = readLine(),
              let choice = Int(userInput) else {
            print("Escolha inválida. Tente novamente.")
            return getUserInput()
        }
        
        return choice
    }
}

// Atualização do cliente para interagir com a interface de console
class DoodleDrawApp {
    let toolFactory: DrawingToolFactory
    let consoleUI: ConsoleUI
    
    init(factory: DrawingToolFactory, consoleUI: ConsoleUI) {
        self.toolFactory = factory
        self.consoleUI = consoleUI
    }
    
    func draw() {
        let choice = consoleUI.getUserInput()
        
        switch choice {
        case 1:
            let pencil = toolFactory.createPencil()
            pencil.drawLine()
        case 2:
            let brush = toolFactory.createBrush()
            brush.drawCircle()
        default:
            print("Escolha inválida.")
        }
    }
}

// Uso do aplicativo com interface de console
let consoleUI = ConsoleUI()

let iOSApp = DoodleDrawApp(factory: iOSDrawingToolFactory(), consoleUI: consoleUI)
iOSApp.draw()

let macOSApp = DoodleDrawApp(factory: MacOSDrawingToolFactory(), consoleUI: consoleUI)
macOSApp.draw()






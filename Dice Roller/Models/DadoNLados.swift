//
//  DadoNLados.swift
//  Dice Roller
//
//  Created by Noelle Figueiredo on 21/10/22.
//

import Foundation

fileprivate enum TiposDeDados : Int {
    case d4 = 4
    case d6 = 6
    case d8 = 8
    case d10 = 10
    case d12 = 12
    case d20 = 20
}

public struct DadoNLados {
    let numeroDeLados : Int
    
    init?(_ lados: Int) {
        guard let lados = TiposDeDados(rawValue: lados) else {
            return nil
        }
        numeroDeLados = lados.rawValue
    }
    
    init() {
        numeroDeLados = 6
    }
    
    func rola() -> Int {
        return Int.random(in: 1...numeroDeLados)
    }
}

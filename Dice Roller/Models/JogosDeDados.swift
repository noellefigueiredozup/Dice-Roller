//
//  JogoDeDados.swift
//  Dice Roller
//
//  Created by Noelle Figueiredo on 21/10/22.
//

import Foundation

struct JogoDeUmDado {
    private(set) var resultado: Int
    private var dado: DadoNLados
    
    init(dado: DadoNLados){
        self.dado = dado
        self.resultado = 0
    }
    
    mutating func joga() {
        self.resultado = dado.rola()
    }
    
    mutating func mudarDado(novoDado: DadoNLados) {
        self = JogoDeUmDado(dado: novoDado)
    }
}

struct JogoDeMultiplosDados {
    private(set) var resultados : [Int]
    private var dados : [DadoNLados]
    
    init(numeroDeDados: Int, dadoBase: DadoNLados) {
        dados = Array(repeating: dadoBase, count: numeroDeDados)
        resultados = Array(repeating: 0, count: numeroDeDados)
    }
    
    mutating func joga() {
        self.resultados = Array()
        for dado in dados {
            self.resultados.append(dado.rola())
        }
    }
    
    mutating func mudarDado(novoDado: DadoNLados) {
        self = JogoDeMultiplosDados(numeroDeDados: self.dados.count, dadoBase: novoDado)
    }
    
    mutating func mudarNumeroDeDados(novoNumero: Int) {
        self = JogoDeMultiplosDados(numeroDeDados: novoNumero, dadoBase: self.dados.first ?? DadoNLados())
    }
    
    
}

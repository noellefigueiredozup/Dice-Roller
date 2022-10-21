//
//  ViewController.swift
//  Dice Roller
//
//  Created by Noelle Figueiredo on 21/10/22.
//

import UIKit

class JogoDeDadosViewController: UIViewController {
    
    @IBOutlet weak var numeroLadosLabel: UILabel!
    @IBOutlet weak var ladosStepper: UIStepper!
    
    @IBOutlet weak var dadosJogadosLabel: UILabel!
    
    @IBOutlet weak var numeroDadosLabel: UILabel!
    @IBOutlet weak var dadosStepper: UIStepper!
    
    
    var jogo: JogoDeMultiplosDados? {
        didSet {
            if jogo != nil && isViewLoaded {
                atualizaLabelDadosJogados(novosResultados: jogo?.resultados ?? [])
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jogo = JogoDeMultiplosDados(numeroDeDados: Int(dadosStepper.value), dadoBase: DadoNLados(Int(ladosStepper.value)) ?? DadoNLados())
        atualizaNumeroLadosLabel(ladosStepper)
        atualizaNumeroDadosLabel(dadosStepper)
    }
    
    @IBAction func stepperLadosMudou(_ sender: UIStepper) {
        corrigeLadosStepper(sender)
        jogo?.mudarDado(novoDado: DadoNLados(Int(sender.value)) ?? DadoNLados())
        atualizaNumeroLadosLabel(sender)
    }
    
    // mantem .value nos valores de TiposDeDados
    private func corrigeLadosStepper(_ stepper: UIStepper) {
        if stepper.value == 14 {
            stepper.value = 20
        }
        if stepper.value == 18 {
            stepper.value = 12
        }
    }
    
    @IBAction func stepperDadosMudou(_ sender: UIStepper) {
        jogo?.mudarNumeroDeDados(novoNumero: Int(sender.value))
        atualizaNumeroDadosLabel(sender)
    }
    
    func atualizaNumeroDadosLabel(_ stepper: UIStepper){
        numeroDadosLabel.text = String(Int(stepper.value))
    }
    
    func atualizaNumeroLadosLabel(_ stepper: UIStepper){
        numeroLadosLabel.text = String(Int(stepper.value))
    }
    
    @IBAction func botaoRolarPressionado(_ sender: UIButton) {
        jogo!.joga()
    }
    
    private func converteArrayDeInteirosEmString(_ array : [Int]) -> String{
        var string = ""
        for n in array {
            string += n.description + " "
        }
        return string
    }
    
    func atualizaLabelDadosJogados(novosResultados : [Int]){
        dadosJogadosLabel.text = converteArrayDeInteirosEmString(novosResultados)
    }
}


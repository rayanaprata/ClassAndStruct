import UIKit

// Tipo Referência (reference type)
class JogadorPorReferencia {
    var nome: String
    
    init(nome: String) {
        self.nome = nome
    }
}

class JogoPorReferencia {
    var jogador1: JogadorPorReferencia? = nil
    var jogador2: JogadorPorReferencia? = nil
    
    func mostrarJogadores() -> String {
        return "Jogador 1: \(jogador1?.nome ?? "Ninguém") \nJogador 2: \(jogador2?.nome ?? "Ninguém")"
    }
}

do {
    print(" *** Reference Type *** \n")
    let jogo = JogoPorReferencia()
    
    let jogador = JogadorPorReferencia(nome: "Rayana")
    jogo.jogador1 = jogador
    
    let segundoJogador = jogador
    segundoJogador.nome = "Camila"
    jogo.jogador2 = segundoJogador
    
    if jogador === segundoJogador { // se ele é exatamente igual (do mesmo tipo) do outro
        print("Igual")
    } else {
        print("Diferente")
    }
    
    print(jogo.mostrarJogadores())
    // Ele imprime os dois jogadores com o nome Camila
    // pois os dois jogadores apontam a mesma referência
    // qualquer alteracao feita em uma instancia, ira afetar a outra
    
    print("---------------")
    
    let terceiroJogador = JogadorPorReferencia(nome: "Maria") // se eu fizer uma nova instancia da classe ela será diferente!
    jogo.jogador2 = terceiroJogador
    
    if jogador === terceiroJogador { // se ele é exatamente igual (do mesmo tipo) do outro
        print("Igual")
    } else {
        print("Diferente")
    }
    
    print(jogo.mostrarJogadores())
    // Imprime o jogador Camila e o jogador Maria pois foi feita uma nova instanciacao e nao uma copia de outro objeto
}

// O struct e o enum são do tipo Value Types, ou seja, eles criam uma cópia da informacao
// entao eles nao fazem um apontamento para aquela informacao e sim, criam um novo espaco de memória

// Tipo Valor (Value Types)
struct JogadorPorValor {
    var nome: String
}

struct JogoPorValor {
    var jogador1: JogadorPorValor? = nil
    var jogador2: JogadorPorValor? = nil
    
    func mostrarJogadores() -> String {
        return "Jogador 1: \(jogador1?.nome ?? "Ninguém") \nJogador 2: \(jogador2?.nome ?? "Ninguém")"

    }
}

do {
    print("\n\n *** Value Types *** \n")
    
    var jogo = JogoPorValor()
    
    let jogador = JogadorPorValor(nome: "Rayana")
    jogo.jogador1 = jogador
    
    var segundoJogador = jogador
    segundoJogador.nome = "Marisa"
    jogo.jogador2 = segundoJogador
    
    print(jogo.mostrarJogadores())
}

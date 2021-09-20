//
//  ViewController.swift
//  AluraViagens
//
//  Created by Guilherme Berson on 19/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ViagensTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configuraTableView()
        view.backgroundColor = UIColor(red: 30/255.0, green: 59/255.0, blue: 119/255.0, alpha: 1)
    }
    
    func configuraTableView(){
        ViagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        ViagensTableView.dataSource = self
        ViagensTableView.delegate = self
    }
}


//MARK: - DATASOURCE METHODS
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else {
            fatalError("Erro ao retornar a ViagemTableViewCell")
        }
    
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:
            celulaViagem.configuraCelula(viewModel?.viagens[indexPath.row] ?? Viagem.init(id: 0, titulo: "", asset: "", subtitulo: "", diaria: 0, hospedes: 0, precoSemDesconto: 0.0, preco: 0.0, cancelamento: ""))
            return celulaViagem
        default:
            return UITableViewCell()
        }
    }
}

//MARK: - DELEGATE METHODS
extension ViewController: UITableViewDelegate {
    //Definindo op header para a tableview
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner:self, options: nil)?.first as? HomeTableViewHeader
        headerView?.configuraView()
        return headerView
    }
    
    //Definindo a altura do header da tableview
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    //Altura da linha da tabela
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475
    }
}

/*
 Tabelas:
 
 - Numero de linhas = 10
 
    Primeira linha: Pão
    Segunda linha: Ovos
    Terceira Linha: Leira
 
 
    Um protocolo define um esquema de métodos, propriedades e outros requisitos que se adequam a uma tarefa ou funcionalidade específica. O protocolo pode então ser adotado por uma classe, estrutura ou enumeração para fornecer uma implementação real desses requisitos. Qualquer tipo que satisfaça os requisitos de um protocolo está em conformidade com esse protocolo.
    Fonte:https://docs.swift.org/swift-book/LanguageGuide/Protocols.html
 
 */

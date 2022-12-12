//
//  HomeViewController.swift
//  Frase_App
//
//  Created by mayre contreras on 06-12-22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableViewFrases: UITableView!
    @IBOutlet weak var nameUserLabel: UILabel!
    
    
    
    
    let database = Firestore.firestore()
    let loginUser = Auth.auth().currentUser
    var dataFrases: [FrasesModel] = []
    var selecteFrate: FrasesModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataUser()
        tableViewFrases.dataSource = self
        tableViewFrases.register(UINib(nibName: "CellFrasesTableViewCell", bundle: nil), forCellReuseIdentifier: "CellFrasesTableViewCell")
        tableViewFrases.delegate = self
    }
    // hacer que la vista se recargue
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getFrases()
    }
    
    
    func getDataUser(){
        database.collection("users").whereField("userId", isEqualTo: loginUser?.uid ?? "").getDocuments { result, error in
            if !(result?.documents.isEmpty)!{
                let nameUser =  result?.documents[0].data()["name"] as? String
                self.nameUserLabel.text = nameUser
                    }
            }
    }
    
    func getFrases(){
        dataFrases = []
        database.collection("frases").getDocuments { result, error in
            if !(result?.documents.isEmpty)!{
                do{let frasesList: [QueryDocumentSnapshot] = result!.documents
                    for frase in frasesList {
                        let guardData = try frase.data(as: FrasesModel.self)
                        self.dataFrases.append(guardData)
                        }
                self.tableViewFrases.reloadData()
            }catch{
                print(error)
                }
            }
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show-Frase"{
            if let showFraseVC = segue.destination as? ShowFraseViewController{
               let dataShowFrases = self.selecteFrate
                showFraseVC.fraseSelect = dataShowFrases
                }
            }
        }
        

}


extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFrases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellFrasesTableViewCell", for: indexPath)
        (cell as? CellFrasesTableViewCell)?.setupCell(frase: dataFrases[indexPath.row])
        (cell as? CellFrasesTableViewCell)?.deleteFrase = {
            
            let alert = UIAlertController(title: "Delete", message: "Do you want delete the phrase", preferredStyle: UIAlertController.Style.alert)
            let btOK = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
                self.database.collection("frases").document(self.dataFrases[indexPath.row].id!).delete()
                self.getFrases()
            }
            alert.addAction(btOK)
            let btCancel = UIAlertAction(title: "Cancel", style: .default)
            alert.addAction(btCancel)
            
            self.present(alert, animated: true)
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La frase #\(indexPath.row) fue seleccionada.")
        selecteFrate = dataFrases[indexPath.row]
       
        self.performSegue(withIdentifier: "Show-Frase", sender: self)
    }


}


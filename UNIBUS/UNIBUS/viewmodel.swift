//
//  viewmodel.swift
//  UNIBUS
//
//  Created by Turma01-27 on 10/10/24.
//
class ViewModel: ObservableObject{
    @Published var chars : [unibus] = []
    
    @Published var pref : [unibusPref] = []
    
    func removeAllPrefs(arr: [unibus]){
        // URL da sua API
        guard let url = URL(string: "http://127.0.0.1:1880/removePref") else {
            print("URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        for o in pref{
            // Codificando o gasto para JSON
            do {
                let jsonData = try JSONEncoder().encode(o)
                request.httpBody = jsonData
            } catch {
                print("Erro ao codificar gasto: \(error)")
                return
            }
            
            // Fazendo a requisição
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Erro na requisição: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Resposta não foi 200: \(response!)")
                    return
                }
                
                // Manipule a resposta se necessário
                if let data = data {
                    // Se precisar, você pode decodificar a resposta aqui
                    print("Resposta recebida: \(String(data: data, encoding: .utf8) ?? "")")
                }
            }
            task.resume()
        }
    }
    
    func fetch(){
        
        self.fetch2()
        
        let task = URLSession.shared.dataTask(with: URL(string: "http://127.0.0.1:1880/gethacka")!){ data, _, error in
            do{
                self.chars = try JSONDecoder().decode([unibus].self, from: data!)
                
                //                //ordenar dando prioridade pras prefenrecias
                var aux : [unibus] = []

                
//                print("Total \(self.chars.count)")
                
                let sortPref = self.pref.sorted(by: { $0.date! > $1.date!}).first
                
                for y in  self.chars{
                    for z in sortPref!.ids{
                        if( y._id == z){
                            aux.append(y)
//                            print("pref \(y.letra!)")
                            if let index = self.chars.firstIndex(of: y) {
                                self.chars.remove(at: index)
                            }
                        }
                        
                    }
                }
                
                
                
                for y in  self.chars{
                    
                    aux.append(y)
                    
                }
               
                self.chars = []
                self.chars = aux
                
               
                
                
            }catch{
                print(error)
            }
        }
        task.resume()
        
    }
    
    func fetch2(){
        let task = URLSession.shared.dataTask(with: URL(string: "http://127.0.0.1:1880/getpreferencias")!){ data, _, error in
            do{
                self.pref = try JSONDecoder().decode([unibusPref].self, from: data!)
            }catch{
                print(error)
            }
        }
        task.resume()
        
    }
    
    
    func post(p: unibusPref) {
        // URL da sua API
        guard let url = URL(string: "http://127.0.0.1:1880/postpreferencias") else {
            print("URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Codificando o gasto para JSON
        do {
            let jsonData = try JSONEncoder().encode(p)
            request.httpBody = jsonData
        } catch {
            print("Erro ao codificar gasto: \(error)")
            return
        }
        
        // Fazendo a requisição
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro na requisição: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Resposta não foi 200: \(response!)")
                return
            }
            
            // Manipule a resposta se necessário
            if let data = data {
                // Se precisar, você pode decodificar a resposta aqui
                print("Resposta recebida: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }
        task.resume()
        
        fetch()
    }
    
}

//
//  ContentModel.swift
//  LearningApp
//
//  Created by Tony Clayton on 9/5/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    func getLocalData() {
        
        // get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)

            // decode json into array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // assign parsed modules to modules property
            self.modules = modules
            
        }
        catch {
            // ToDo log error
            print("Couldn't parse local data.")
            print(error)
        }
        
        // parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            // read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            // log error
            print("Couldn't parse the style data")
            print(error)
        }
        
    }
    
}

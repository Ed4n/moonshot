//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Edgardo Valencia on 26/12/24.
//

import Foundation

extension Bundle {
//    Here we are using a Geneirc called T. This could be anything that we want but is a good practice to add the letter T to refere to a generic.
//    Also we are telling the compiler that T must conform to Codable. in order to use decode method.
    func decode<T: Codable>( _ file: String) -> T {
        
        let decoder = JSONDecoder()
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("fail to Locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Faild to load \(file) from bundle.")
        }
        
        do {
            return try decoder.decode(T.self, from: data)
        }catch DecodingError.keyNotFound(let key,let context) {
            fatalError("Faild to decode \(file) from bundle due to missing key \(key.stringValue) - \(context.debugDescription)")
        }catch DecodingError.typeMismatch(_,  let context){
            fatalError("Fail to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
        }catch DecodingError.valueNotFound(let type, let context){
            fatalError("Faild to decode \(file) from bundle due to value not found \(type) - \(context.debugDescription)")
        }catch DecodingError.dataCorrupted(_){
            fatalError("Faild to decode \(file) from bundle due to data corrupted")
        }catch {
            fatalError("faild to decode \(file) from bundle: \(error.localizedDescription)")
        }
        
    }
}

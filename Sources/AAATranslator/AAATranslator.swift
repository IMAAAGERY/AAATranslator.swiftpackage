import Combine
public class AAATranslator : ObservableObject {

    let parser : AAATranslatorParser
    @Published private(set) public  var data : [String:String] = [:] // Useless but usefull - don't know why
    public init(_ parser:AAATranslatorParser){
        self.parser = parser
    }
    
    public func get(_ key:String) -> String {
        return data[key] ?? "__NO VALUE FOR \(key)__"
    }
    
    public func load(_ language:String) throws{
        data = try parser.load(language)
    }
    
    public func languagesSupported() -> [String] {
        return parser.keys()
    }
    
}

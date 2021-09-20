# AAATranslator

A simple Combine translation manager

## How to use

### Create a Parser

Create your own parser. The parser should output a key value pair of string. 

Exemple : [ici](https://github.com/IMAAAGERY/AAATranslator.swiftpackage/blob/master/Sources/AAATranslator/AAATranslatorParserProtocol.swift)

### Setup 

```
import SwiftUI
import AAATranslator
let translator : AAATranslator = {
    let frFr = Bundle.main.url(forResource: "FrFr", withExtension: "json")!
    let enUs = Bundle.main.url(forResource: "EnUs", withExtension: "json")!

    let files = [
        "FrFr" : frFr,
        "EnUs" : enUs
    ]
    let parser = AAATranslatorParserDefault(files: files)
    let translator = AAATranslator(parser)
    try? translator.load(files.keys.first! as String)
    return translator
}()
@main
struct AAATranslatorAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(translator)
        }
    }
}
```

### In your view

```
import SwiftUI
import AAATranslator
struct ContentView: View {
    @EnvironmentObject private var  translator : AAATranslator
    
    var body: some View {
        VStack{
            Text("Your Text").padding()
            Text(translator.get("item1"))
            
            ForEach(translator.languagesSupported(), id: \.self){ key in//
                Button("Load \(key)") {
                    do {
                        try translator.load(key)
                    } catch {
                        print("Error")
                        
                    }
                }
            }
        }
    }
}
```




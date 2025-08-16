
// basic request to Gemini
function typeAOP = checkTypeAOP(frequencies,gains,apiKey)
    inputQuestion = struct("text","What is the type of this AOP ? Low pass, high pass, bandwith pass ? What is the order ?" + "Frequencies: "+toJSON(frequencies) +"Gains: "+toJSON(gains))
    payload = struct("contents",struct("parts",[inputQuestion]))
    modelGemini ="gemini-2.5-flash-preview-05-20"
    
    url ="https://generativelanguage.googleapis.com/v1beta/models/"+modelGemini +":generateContent?key=" +apiKey
    typeAOPResponse = http_post(url,payload)
    typeAOP=typeAOPResponse(1).candidates(1).content.parts(1).text
    
endfunction

// request structured output wanted
function typeAOP = checkTypeAOPStructured(frequencies,gains,apiKey)
    inputQuestion = struct("text","What is the type of this AOP ? Low pass, high pass, bandwith pass ? What is the order ?" + "Frequencies: "+toJSON(frequencies) +"Gains: "+toJSON(gains))
    
    //structured output wanted (JSON)
    structuredFormat = fromJSON("./outputDefinedFilter.json","file")
    
    payload = struct("contents",struct("parts",[inputQuestion]),"generationConfig",structuredFormat)
    modelGemini ="gemini-2.5-flash-preview-05-20"
    
    url ="https://generativelanguage.googleapis.com/v1beta/models/"+modelGemini +":generateContent?key=" +apiKey
    typeAOPResponse = http_post(url,payload)
    typeAOP=typeAOPResponse(1).candidates(1).content.parts(1).text
    
endfunction

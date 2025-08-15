
function frequencies = generateMockDataF()
    frequencies = [] 
    // mock passe bas
    for i = 1:1:10000
        frequencies($+1) = i
    end
    
    for i =10001:1:50000
        frequencies($+1) = i
    end
    

endfunction

function gains = generateMockDataG()
    gains = []
    // mock low pass order 1
    for i = 1:1:10000
        gains($+1) =0
    end
    
    for i =10001:1:50000
        gains($+1) =-40 * (i - 10000)/40000        
        
    end

endfunction

function typeAOP = checkTypeAOP(frequencies,gains,apiKey)
    inputQuestion = struct("text","What is the type of this AOP ? Low pass, high pass, bandwith pass ? What is the order ?" + "Frequencies: "+toJSON(frequencies) +"Gains: "+toJSON(gains))
    payload = struct("contents",struct("parts",[inputQuestion]))
    modelGemini ="gemini-2.5-flash-preview-05-20"
    
    url ="https://generativelanguage.googleapis.com/v1beta/models/"+modelGemini +":generateContent?key=" +apiKey
    typeAOPResponse = http_post(url,payload)
    typeAOP=typeAOPResponse(1).candidates(1).content.parts(1).text
    
endfunction
apiKeyGemini = x_dialog("Enter your Gemini API Key:","scilab")


frequencies = generateMockDataF()
gains = generateMockDataG()

plot2d(frequencies,gains)
disp(checkTypeAOP(frequencies,gains,apiKeyGemini))

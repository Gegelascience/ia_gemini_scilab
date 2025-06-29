
function frequences = generateMockDataF()
    frequences = [] 
    // mock passe bas
    for i = 1:1:10000
        frequences($+1) = i
    end
    
    for i =10001:1:50000
        frequences($+1) = i
    end
    

endfunction

function gains = generateMockDataG()
    gains = []
    // mock passe bas
    for i = 1:1:10000
        gains($+1) =-40 * (10000 -i)/10000
    end
    
    for i =10001:1:50000
        gains($+1) =0
        
    end

endfunction

function typeAOP = checkTypeAOP(frequences,gains,apiKey)
    inputQuestion = struct("text","Quel est ce type d amplificateur opérationnel proportionnel (AOP) ?" + "Fréquences: "+toJSON(frequences) +"Gains: "+toJSON(gains))
    //inputFrequence = struct("text","Fréquences: "+toJSON(frequences))
    //inputGain = struct("text","Gains: "+toJSON(gains))
    //payload = struct("contents",struct("parts",[inputQuestion,inputFrequence,inputGain]))
    payload = struct("contents",struct("parts",[inputQuestion]))
    modelGemini ="gemini-2.5-flash-preview-05-20"
    
    url ="https://generativelanguage.googleapis.com/v1beta/models/"+modelGemini +":generateContent?key=" +apiKey
    typeAOPResponse = http_post(url,payload)
    typeAOP=typeAOPResponse(1).candidates(1).content.parts(1).text
    
endfunction

apiKeyGemini = input("clé API Gemini: ","string")

frequences = generateMockDataF()
gains = generateMockDataG()

plot2d(frequences,gains)
disp(checkTypeAOP(frequences,gains,apiKeyGemini))

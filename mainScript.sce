getd(".")

apiKeyGemini = x_dialog("Enter your Gemini API Key:","scilab")

disp("generate mock data")
[frequencies, gains] = generateMockData()

plot2d(frequencies,gains)

disp("request GEMINI")

//disp(checkTypeAOP(frequencies,gains,apiKeyGemini))

outputStruct = fromJSON(checkTypeAOPStructured(frequencies,gains,apiKeyGemini))
disp(outputStruct)

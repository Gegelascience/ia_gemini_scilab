getd(".")

apiKeyGemini = x_dialog("Enter your Gemini API Key:","scilab")

disp("generate mock data")
[frequencies, gains] = generateMockData()

plot2d(frequencies,gains)

disp("request GEMINI verbose")

disp(checkTypeAOP(frequencies,gains,apiKeyGemini))

disp("request GEMINI structured")

outputStruct = fromJSON(checkTypeAOPStructured(frequencies,gains,apiKeyGemini))
disp(outputStruct)

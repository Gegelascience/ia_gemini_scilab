
// mock low pass filter signal
function [frequencies,gains] = generateMockData()
    tmpF = []
    tmpG = []
    for i = 1:1:10000
        tmpF($+1) = i
        tmpG($+1) =0
    end
    
    for i =10001:1:50000
        tmpF($+1) = i
        tmpG($+1) =-40 * (i - 10000)/40000 
    end
    
    frequencies = tmpF
    gains =tmpG
    

endfunction

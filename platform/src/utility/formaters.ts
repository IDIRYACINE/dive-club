

export function formatEntryTime(value:string):string{
    let result = "";
  const seperators = [":",".",""]

  const extractedValues = value
  .replace(/\D/g, '')
  .match(/(\d{0,2})(\d{0,2})(\d{0,2})/)?.slice(1)
  ?? [[],[],[]];
  for(let arrayGroupIndex = 0 ; arrayGroupIndex < extractedValues.length ; arrayGroupIndex++){
      const groupLength = extractedValues[arrayGroupIndex].length
      switch(groupLength){
          case 0 :
              result += "00" 
              break;
          case 1 :
              result += "0" + extractedValues[arrayGroupIndex][0]    
              break;
          default :
              result += extractedValues[arrayGroupIndex][0] + extractedValues[arrayGroupIndex][1]
           break;
      }

      result += seperators[arrayGroupIndex]
  }


  return result 
}
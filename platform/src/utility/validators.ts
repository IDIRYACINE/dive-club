import { IAthelete } from "@/core/athelete/atheleteEntity";
import { IParticipation } from "@/core/participants/participantsEntity";


export function validateAthelete(athelete: IAthelete) {


    const validName = validateName(athelete.firstName) && validateName(athelete.lastName)
    const validBirthDate = validateBirthDate(athelete.dateOfBirth)
    const validLicense = validateLicense(athelete.atheleteId)

    return validName && validBirthDate && validLicense
}


export function validateName(value: string) {
    const namePattern = /^[A-Za-z\s]+$/
    return namePattern.test(value)
}

export function validateLicense(value: string) {
    const licensePattern = /^[0-9]+/
    return licensePattern.test(value)

}

export function validateBirthDate(value: string) {
    const dateRegex = /^(?:(?:31(\/)(?:0[13578]|1[02]))\1|(?:(?:29|30)(\/)(?:0[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;
    return dateRegex.test(value)
}

export function validateParticipation(atheleteId: string|null|undefined, participations: IParticipation[]) {
    
    return (atheleteId) && validateLicense(atheleteId!) && (participations.length > 0)
}

export function validateEntryTime(entryTime:string){
    const timeRegex = /^(?:[0-5][0-9]):(?:[0-5][0-9]):(?:[0-9]{1,2})$/;
    return timeRegex.test(entryTime)
}


export class AtheleteId{
    constructor(public readonly value : number){}


    equals(other : AtheleteId) : boolean{
        return other.value === this.value
    }
}


export class AtheleteEntity{
    
    constructor(public readonly atheleteId:AtheleteId){

    }

    equals(other:AtheleteEntity) :boolean{
        return other.atheleteId.equals(this.atheleteId)
    }
}
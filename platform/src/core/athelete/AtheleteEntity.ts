

export class AtheleteId {
    constructor(public readonly value: number) { }


    equals(other: AtheleteId): boolean {
        return other.value === this.value
    }
}


export class AtheleteGender {
    private constructor(public readonly value: string) { }


    static male(): AtheleteGender {
        return new AtheleteGender("Male")
    }

    static female(): AtheleteGender {
        return new AtheleteGender("Female")
    }
}

export class AtheleteEntity {

    constructor(public readonly atheleteId: AtheleteId) {

    }

    equals(other: AtheleteEntity): boolean {
        return other.atheleteId.equals(this.atheleteId)
    }
}

export interface IAthelete {
    atheleteId: string,
    firstName: string,
    lastName: string,
    gender: string,
    dateOfBirth: string,
}
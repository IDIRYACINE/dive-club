

export class AtheleteId {
    constructor(public readonly value: number) { }


    equals(other: AtheleteId): boolean {
        return other.value === this.value
    }

    static fromString(value: string): AtheleteId {
        return new AtheleteId(parseInt(value))
    }
}

export class AtheleteName {
    constructor(public readonly value: string) {

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

    static fromRaw(raw: string): AtheleteGender {
        return raw === "Male" ? AtheleteGender.male() : AtheleteGender.female()
    }
}

export class AtheleteEntity {

    constructor(
        public readonly atheleteId: AtheleteId,
        public readonly firstName: AtheleteName,
        public readonly lastName: AtheleteName,
        public readonly gender: AtheleteGender

    ) {

    }

    equals(other: AtheleteEntity): boolean {
        return other.atheleteId.equals(this.atheleteId)
    }

    static fromRaw(raw: IAthelete): AtheleteEntity {
        return new AtheleteEntity(
            AtheleteId.fromString(raw.atheleteId),
            new AtheleteName(raw.firstName),
            new AtheleteName(raw.lastName),
            AtheleteGender.fromRaw(raw.gender)
        )
    }
}

export interface IAthelete {
    atheleteId: string,
    firstName: string,
    lastName: string,
    gender: string,
    dateOfBirth: string,
}
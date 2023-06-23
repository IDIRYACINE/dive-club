import { IAthelete, mockAtheletes } from "@/core/athelete/atheleteEntity";

export interface IParticipation {
    specialty: IParticipationEntity,
    division: IParticipationEntity,
    entryTime: string
}

export interface IParticipant {
    athelete: IAthelete,
    participations: IParticipation[]

}

export interface IParticipationEntity {
    id: number,
    name: string,
}


export const mockParticipants: IParticipant[] = [
    {
        athelete: mockAtheletes[0],
        participations: [
            {
                specialty: {
                    id: 1,
                    name: "Specialty 1"
                },
                division: {
                    id: 1,
                    name: "Division 1"
                },
                entryTime:"99:99.99"
            }
        ]
    },
    {
        athelete: mockAtheletes[1],
        participations: [
            {
                specialty: {
                    id: 2,
                    name: "Specialty 2"
                },
                division: {
                    id: 2,
                    name: "Division 2"
                },
                entryTime:"99:99.99"

            }
        ]
    },
]

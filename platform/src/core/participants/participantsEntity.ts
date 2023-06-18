import { IAthelete } from "@/core/athelete/atheleteEntity";

export interface IParticipation {
    specialty:IParticipationEntity,
    division:IParticipationEntity,
}

export interface IParticipant {
    athelete: IAthelete,
    participations : IParticipation[]

}

export interface  IParticipationEntity{
    id: number,
    name: string,
}
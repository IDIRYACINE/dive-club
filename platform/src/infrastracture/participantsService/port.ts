import { IParticipant } from "@/core/participants/participantsEntity";

export interface AddParticipantOptions {
    participant: IParticipant;
    clubId: string | number;
}

export interface UpdateParticipantOptions {
    participant: Partial<IParticipant>;
    participantId: string | number;
    clubId: string | number;
}

export interface LoadParticipantsOptions {
    clubId: string | number;
}

export interface DeleteParticipantOptions {
    clubId: string | number;
    participantId: string | number;
}

export interface ParticipantsServicePort {
    getParticipants(options:LoadParticipantsOptions): Promise<IParticipant[]>;
    addParticipant (options: AddParticipantOptions) : Promise<void>;
    updateParticipant(options: UpdateParticipantOptions) : Promise<void>;
    deleteParticipant(options: DeleteParticipantOptions) : Promise<void>;
}
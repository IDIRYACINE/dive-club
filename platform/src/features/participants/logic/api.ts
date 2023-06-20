import { IParticipant } from "@/core/participants/participantsEntity";

interface DeleteParticipantApiOptions {
  participantId: string;
  clubId: string | number;
}

interface CreateParticipantApiOptions {
  clubId: string | number;
  participantId: string | number;
  participant: IParticipant;
}

interface UpdateParticipantApiOptions {
    clubId: string | number;
    participantId: string | number;
    participant: Partial<IParticipant>;
}

interface LoadParticipantsApiOptions {
  clubId: string | number
}

const baseUrl = "/api/participants";


export async function createParticipantApi(options: CreateParticipantApiOptions) {
  const response = await fetch(baseUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(options),
  });

  return response.json();
}

export async function updateParticipantApi(options: UpdateParticipantApiOptions) {
  const response = await fetch(baseUrl, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(options),
  });

  return response.json();
}

export async function deleteParticipantApi(options: DeleteParticipantApiOptions) {
  const response = await fetch(`${baseUrl}?participantId=${options.participantId}clubId=${options.clubId}`, {
    method: "DELETE",
  });

  return response.json();
}

export async function loadParticipantsApi(options: LoadParticipantsApiOptions): Promise<IParticipant[]> {
  let response = await fetch(`${baseUrl}?clubId=${options.clubId}`, {
    method: "GET",
  });

  let json = await response.json();

  return json.data;
}
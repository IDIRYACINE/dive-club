import { IAthelete } from "@/core/athelete/atheleteEntity";

interface DeleteAtheleteApiOptions {
  atheleteId: string;
  clubId: string | number;
}

interface CreateAtheleteApiOptions {
  clubId: string | number;
  atheleteId: string | number;
  athelete: IAthelete;
}

interface UpdateAtheleteApiOptions {
    clubId: string | number;
    atheleteId: string | number;
    athelete: Partial<IAthelete>;
}

interface LoadAtheletesApiOptions {
  clubId: string | number
}

const baseUrl = "/api/atheletes";


export async function createAtheleteApi(options: CreateAtheleteApiOptions) {
  const response = await fetch(baseUrl, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(options),
  });

  return response.json();
}

export async function updateAtheleteApi(options: UpdateAtheleteApiOptions) {
  const response = await fetch(baseUrl, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(options),
  });

  return response.json();
}

export async function deleteAtheleteApi(options: DeleteAtheleteApiOptions) {
  const response = await fetch(`${baseUrl}?atheleteId=${options.atheleteId}&clubId=${options.clubId}`, {
    method: "DELETE",
  });

  return response.json();
}

export async function loadAtheletesApi(options: LoadAtheletesApiOptions): Promise<IAthelete[]> {
  let response = await fetch(`${baseUrl}?clubId=${options.clubId}`, {
    method: "GET",
  });

  let json = await response.json();

  return json.data;
}
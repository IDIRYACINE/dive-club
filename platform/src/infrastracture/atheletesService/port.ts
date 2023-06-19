import { IAthelete } from "@/core/athelete/atheleteEntity";


export interface LoadAtheletesOptions {
    clubId: string | number;
}

export interface AddAtheleteOptions {
    clubId: string | number;
    athelete: IAthelete;
}

export interface DeleteAtheleteOptions {
    clubId: string | number;
    atheleteId: string | number;
}

export interface UpdateAtheleteOptions {
    clubId: string | number;
    atheleteId: string | number;
    athelete: Partial<IAthelete>;
}

export interface AtheletesServicePort {
    getAtheletes (options:LoadAtheletesOptions) : Promise<IAthelete[]>;
    addAthelete (options: AddAtheleteOptions) : Promise<void>;
    updateAthelete(options:UpdateAtheleteOptions) : Promise<void>;
    deleteAthelete(options:DeleteAtheleteOptions) : Promise<void>;
}
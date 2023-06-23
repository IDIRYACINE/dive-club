import { AtheletesServicePort } from "../atheletesService/port";
import { ParticipantsServicePort } from "../participantsService/port";
import { ServicesProviderPort } from "./port";

import {getFirestore} from "firebase/firestore";

import { initializeApp } from "firebase/app";
import { FirebaseAtheletesService } from "../atheletesService/service";
import { FirebaseParticipantsService } from "../participantsService/service";
import { firebaseConfig } from "./secret";


export class FirebaseServicesProvider implements ServicesProviderPort {

    private static instance: ServicesProviderPort;

    private constructor(private readonly atheletesService: AtheletesServicePort,
         private readonly participantsService: ParticipantsServicePort) {

    }





    getAtheletesService(): AtheletesServicePort { return this.atheletesService };
    getParticipationsService(): ParticipantsServicePort { return this.participantsService };


     static  create(): ServicesProviderPort {
        if(FirebaseServicesProvider.instance) return FirebaseServicesProvider.instance;


        const firebaseApp = initializeApp(firebaseConfig);

        const firestore = getFirestore(firebaseApp);

        const atheletesService = new FirebaseAtheletesService(firestore);
        const participantsService = new FirebaseParticipantsService(firestore);

        return new FirebaseServicesProvider(atheletesService,participantsService);
    }

}


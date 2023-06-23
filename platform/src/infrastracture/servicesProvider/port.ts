import { AtheletesServicePort } from "../atheletesService/port";
import { ParticipantsServicePort } from "../participantsService/port";



export interface ServicesProviderPort {
    getAtheletesService() : AtheletesServicePort;
    getParticipationsService () : ParticipantsServicePort;
}
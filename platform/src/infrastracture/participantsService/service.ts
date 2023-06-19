import { IParticipant } from "@/core/participants/participantsEntity";
import { AddParticipantOptions, DeleteParticipantOptions, LoadParticipantsOptions, ParticipantsServicePort, UpdateParticipantOptions } from "./port";
import { Firestore, doc, collection, getDocs, setDoc, updateDoc, deleteDoc } from "firebase/firestore";


export class FirebaseParticipantsService implements ParticipantsServicePort{

    private participantsCollectionPath = "clubsParticipants";

    constructor(
        private readonly firestore: Firestore
    ){

    }

    async deleteParticipant(options: DeleteParticipantOptions): Promise<void> {
        const participantDoc = doc(this.firestore, this.participantsCollectionPath, options.clubId.toString(), options.participantId.toString(),options.participantId.toString());

        deleteDoc(participantDoc)
        
    }
    async getParticipants (options: LoadParticipantsOptions) :Promise<IParticipant[]>{
        const collectionRef = collection(this.firestore, this.participantsCollectionPath, options.clubId.toString());

        const snapshot = await getDocs(collectionRef);

        const results: IParticipant[] = [];

        snapshot.forEach((doc) => {
            const data = doc.data() as IParticipant;
            results.push(data);
        });

        return results
    }
    async addParticipant(options: AddParticipantOptions) : Promise<void>{
        const collectionRef = collection(this.firestore, this.participantsCollectionPath, options.clubId.toString());

        const docRef = doc(collectionRef);

        await setDoc(docRef, options.participant);
    }
    async updateParticipant (options: UpdateParticipantOptions) : Promise<void>{
        const collectionRef = collection(this.firestore, this.participantsCollectionPath, options.clubId.toString());

        const docRef = doc(collectionRef, options.participantId.toString());

        await updateDoc(docRef, options.participant);
    }
}
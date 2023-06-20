import { IParticipant } from "@/core/participants/participantsEntity";
import { AddParticipantOptions, DeleteParticipantOptions, LoadParticipantsOptions, ParticipantsServicePort, UpdateParticipantOptions } from "./port";
import { Firestore, doc, collection, getDocs, setDoc, updateDoc, deleteDoc } from "firebase/firestore";


export class FirebaseParticipantsService implements ParticipantsServicePort{

    private participantsCollectionPath = "clubsParticipants";
    private participantsSubCollectionPath = "participants";

    constructor(
        private readonly firestore: Firestore
    ){

    }

    async deleteParticipant(options: DeleteParticipantOptions): Promise<void> {
        const collectionRef = this.getClubParticipantsCollection(options.clubId)
        const participantDoc = doc(collectionRef,  options.participantId.toString());

        deleteDoc(participantDoc)
        
    }
    async getParticipants (options: LoadParticipantsOptions) :Promise<IParticipant[]>{
        const collectionRef = this.getClubParticipantsCollection(options.clubId)

        const snapshot = await getDocs(collectionRef);



        const results: IParticipant[] = [];

        snapshot.forEach((doc) => {
            const data = doc.data() as IParticipant;
            results.push(data);
        });

        return results
    }
    async addParticipant(options: AddParticipantOptions) : Promise<void>{
        const collectionRef = this.getClubParticipantsCollection(options.clubId)

        const docRef = doc(collectionRef, options.participant.athelete.atheleteId.toString());

        await setDoc(docRef, options.participant);
    }
    async updateParticipant (options: UpdateParticipantOptions) : Promise<void>{
        const collectionRef = this.getClubParticipantsCollection(options.clubId)

        const docRef = doc(collectionRef, options.participantId.toString());

        await updateDoc(docRef, options.participant);
    }

    private getClubParticipantsDoc(clubId: string | number) {
        const collectionRef = collection(this.firestore, this.participantsCollectionPath,);
        return doc(collectionRef, clubId.toString());

    }

    private getClubParticipantsCollection(clubId: string | number) {
        const docRef = this.getClubParticipantsDoc(clubId)


        return collection(docRef, this.participantsSubCollectionPath);
    }
}
import { IAthelete } from "@/core/athelete/atheleteEntity";
import { AddAtheleteOptions, AtheletesServicePort, DeleteAtheleteOptions, LoadAtheletesOptions, UpdateAtheleteOptions } from "./port";

import { Firestore, doc, collection, getDocs, setDoc, updateDoc, deleteDoc } from "firebase/firestore";


export class FirebaseAtheletesService implements AtheletesServicePort {

    private atheletesCollectionPath = "clubsAtheletes";
    private atheletesSubCollectionPath = "atheletes";


    constructor(
        private readonly firestore: Firestore
    ) {


    }
    async deleteAthelete(options: DeleteAtheleteOptions): Promise<void> {
        const collectionRef = this.getClubAtheletesSubCollection(options.clubId)
        const atheleteDoc = doc(collectionRef,  options.atheleteId.toString());

        deleteDoc(atheleteDoc)
    }

    async getAtheletes(options: LoadAtheletesOptions): Promise<IAthelete[]> {
        const collectionRef = this.getClubAtheletesSubCollection(options.clubId)

        const snapshot = await getDocs(collectionRef);


        const results: IAthelete[] = [];

        snapshot.forEach((doc) => {

            const data = doc.data() as IAthelete;
            results.push(data);
        }
        )



        return results
    }

    async addAthelete(options: AddAtheleteOptions) {
        const collectionRef = this.getClubAtheletesSubCollection(options.clubId)

        const atheleteDocRef = doc(collectionRef, options.athelete.atheleteId.toString());

        await setDoc(atheleteDocRef, options.athelete);

    }

    async updateAthelete(options: UpdateAtheleteOptions) {

        const collectionRef = this.getClubAtheletesSubCollection(options.clubId)

        const docRef = doc(collectionRef, options.atheleteId.toString());

        await updateDoc(docRef, options.athelete);

    }

    private getClubAtheletesDoc(clubId: string | number) {
        const collectionRef = collection(this.firestore, this.atheletesCollectionPath,);
        return doc(collectionRef, clubId.toString());

    }

    private getClubAtheletesSubCollection(clubId: string | number) {
        const docRef = this.getClubAtheletesDoc(clubId)


        return collection(docRef, this.atheletesSubCollectionPath);
    }
}
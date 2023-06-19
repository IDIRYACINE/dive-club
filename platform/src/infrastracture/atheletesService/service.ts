import { IAthelete } from "@/core/athelete/atheleteEntity";
import { AddAtheleteOptions, AtheletesServicePort, DeleteAtheleteOptions, LoadAtheletesOptions, UpdateAtheleteOptions } from "./port";

import { Firestore, doc, collection, getDocs, setDoc, updateDoc, deleteDoc } from "firebase/firestore";


export class FirebaseAtheletesService implements AtheletesServicePort{

    private atheletesCollectionPath = "clubsAtheletes";


    constructor(
        private readonly firestore: Firestore
    ) {
        

    }
    async deleteAthelete(options: DeleteAtheleteOptions): Promise<void> {
        const atheleteDoc = doc(this.firestore, this.atheletesCollectionPath, options.clubId.toString(), options.atheleteId.toString(),options.atheleteId.toString());

        deleteDoc(atheleteDoc)
    }

    async getAtheletes (options: LoadAtheletesOptions) : Promise<IAthelete[]>{
        const collectionRef = collection(this.firestore, this.atheletesCollectionPath, options.clubId.toString());

        const snapshot = await getDocs(collectionRef);

        const results: IAthelete[] = [];

        snapshot.forEach((doc) => {
            const data = doc.data() as IAthelete;
            results.push(data);
        });


        return results
    }

    async  addAthelete (options: AddAtheleteOptions) {
        const collectionRef = collection(this.firestore, this.atheletesCollectionPath, options.clubId.toString());

        const docRef = doc(collectionRef);

        await setDoc(docRef, options.athelete);

    }

    async updateAthelete (options: UpdateAtheleteOptions) {

        const collectionRef = collection(this.firestore, this.atheletesCollectionPath, options.clubId.toString());

        const docRef = doc(collectionRef, options.atheleteId.toString());

        await updateDoc(docRef, options.athelete);

    }
}
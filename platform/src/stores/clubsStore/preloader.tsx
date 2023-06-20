"use client"

import { loadAtheletesApi } from "@/features/atheletes/logic/api";
import { loadParticipantsApi } from "@/features/participants/logic/api";
import { useSession } from "next-auth/react";
import { useRef } from "react"
import { useAppDispatch } from "./hooks"
import { setAtheletes } from "./slices/atheleteSlice";
import { setClubId } from "./slices/navigationSlice";
import { setParticipants } from "./slices/participantsSlice";


export function ClubStorePreloader() {
    const isLoaded = useRef(false)

    const dispatch = useAppDispatch();


    const session = useSession()

    if (!isLoaded.current) {
        if (session.data) {
            const clubId = session.data?.user.sub!
            dispatch(setClubId(clubId));

            loadAtheletesApi({ clubId }).then((participants) => {
                dispatch(setAtheletes(participants));
            });

            loadParticipantsApi({ clubId }).then((participants) =>
                dispatch(setParticipants(participants))
            )

            isLoaded.current = true

        }


    }

    return (
        <></>
    )
}
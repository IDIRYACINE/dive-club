"use client";

import {ParticipantTable,ParticipationDialog} from "@/features/participants"
import { loadParticipantsApi } from "@/features/participants/logic/api";
import { useAppDispatch } from "@/stores/clubsStore/hooks";
import { setParticipants } from "@/stores/clubsStore/slices/participantsSlice";
import { useSession } from "next-auth/react";
import { useEffect } from "react";

export default function ParticipantsPage(){
    const dispatch = useAppDispatch();
    const session = useSession()

    const clubId = session!.data!.user.sub

    useEffect(() => {
    loadParticipantsApi({clubId}).then((participants) => dispatch(setParticipants(participants)))
    })

    return (
            <>
            <ParticipantTable />
            <ParticipationDialog />
            </>
        
    )
}
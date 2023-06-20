"use client";

import { AtheleteEditor, AtheleteTable } from "@/features/atheletes";
import { loadAtheletesApi } from "@/features/atheletes/logic/api";
import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { setAtheletes } from "@/stores/clubsStore/slices/atheleteSlice";
import { setClubId } from "@/stores/clubsStore/slices/navigationSlice";
import { Container } from "@mui/material";
import {  useSession } from "next-auth/react";



export default function ClubsDashboardPage() {
    const dispatch = useAppDispatch();


    const session = useSession()
    

    if (session.data) {
        const clubId = session.data?.user.sub!
        dispatch(setClubId(clubId));

        loadAtheletesApi({ clubId }).then((participants) => {
            dispatch(setAtheletes(participants));
        });

    }


    const containerStyle = {
        display: "flex",
        flexDirection: "column",
        justifyContent: "start",
        alignItems: "center",
        height: "100vh",
        overflowY: "scroll"
    }
    return (
        <Container sx={containerStyle}>
            <AtheleteTable />
            <AtheleteEditor />
        </Container>
    )
}
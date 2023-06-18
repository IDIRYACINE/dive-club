"use client";

import { AtheleteEditor, AtheleteTable } from "@/features/atheletes";
import { Container } from "@mui/material";



export default function ClubsDashboardPage() {
    const containerStyle = {
        display: "flex",
        flexDirection: "column",
        justifyContent: "start",
        alignItems: "center",
        height: "100vh",
        overflowY: "scroll"
    }
    return (
        <Container sx ={containerStyle}>
            <AtheleteTable />
            <AtheleteEditor />
        </Container>
    )
}
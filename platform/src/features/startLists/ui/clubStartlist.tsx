"use client"

import { IParticipant } from "@/core/participants/participantsEntity";
import { GenderDropdown } from "@/features/atheletes/ui/components";
import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { selectFilteredParticipants } from "@/stores/clubsStore/slices/participantsSlice";
import { Box, Button, Card, CardContent, Stack, Typography } from "@mui/material";
import { useRef, useState } from "react";


interface StartListFilterProps {
    onUpdateGender: (value: string) => void,
    initialGender?: string,
}
function StartListFilter(props: StartListFilterProps) {
    const { initialGender, onUpdateGender } = props


    return (
        <Stack className="items-center" direction="row" spacing={4}>
            <Typography variant="h6">البحث</Typography>
            <GenderDropdown initialGender={initialGender} updateGender={onUpdateGender} />
        </Stack>
    )
}

interface StartListTableProps {
    participants: IParticipant[]
}
function StartListTable(props: StartListTableProps) {
    const { participants } = props

    return (
        <Stack  direction="column" spacing={4}>
            {
                participants.map((participant) => {
                    return (
                        <Card key={"participant" + participant.athelete.atheleteId}>
                            <CardContent>
                                <Stack direction="column" spacing={4}>
                                    <Typography variant="h6">{participant.athelete.lastName} {participant.athelete.firstName}</Typography>
                                    <Typography variant="h6">تاريخ الميلاد : {participant.athelete.dateOfBirth}</Typography>

                                    {
                                        participant.participations.map((participation) => {
                                            return (
                                                <Stack key={"participation" + participant.athelete.atheleteId} direction="column" spacing={2}>
                                                    <Typography variant="body1">{participation.division.name} {participation.specialty.name}</Typography>

                                                </Stack>
                                            )
                                        })
                                    }

                                </Stack>
                            </CardContent>
                        </Card>
                    )
                }
                )
            }
        </Stack>
    )
}

export function ClubStartLists() {
    const [gender, setGender] = useState("Male")
    const filteredParticipants = useAppSelector(state => selectFilteredParticipants(state, gender))

    function updateGender(value: string) {
        setGender(value)
    }

    return (
        <Stack className="p-4 justify-center h-screen overflow-y-scroll" direction="column" spacing={4}>
            <StartListFilter initialGender={gender} onUpdateGender={updateGender} />
            <StartListTable participants={filteredParticipants} />
        </Stack>
    )
}
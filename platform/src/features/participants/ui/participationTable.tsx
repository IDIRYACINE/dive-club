"use client";

import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import {selectParticipant, setEditingMode} from "@/stores/clubsStore/slices/participantsSlice"
import {
    Box, TableCell,Button,
    TableRow, Paper, Table, TableBody, TableContainer, TableHead, Typography
} from "@mui/material";
import clsx from "clsx";
import {IParticipant} from "@/core/participants/participantsEntity"
import { openModal } from "@/stores/clubsStore/slices/navigationSlice";

interface ActionsHeaderProps {
    className?: string
}

function ActionsHeader(props:ActionsHeaderProps) {

    const dispatch = useAppDispatch()


    function handleAddParticipant() {
        dispatch(setEditingMode(false))
        dispatch(openModal())

    }

    const boxClassName= clsx([
        props.className,
        "flex flex-row justify-between"
    ])


    return (<Box className={boxClassName}>

        <Typography variant="h6">Participants</Typography>

        <Button onClick={handleAddParticipant} color="primary" variant="contained">
        Add Participant
    </Button>


    </Box>)
}

interface ParticipantHeaderProps {
    headers: string[]
}

function ParticipantHeader(props: ParticipantHeaderProps) {
    const className = "font-bold";
    return (
        <TableHead>
            <TableRow >
                {props.headers.map((header) => (
                    <TableCell className={className} key={header}>
                        <Typography variant="body1">{header}</Typography>
                    </TableCell>
                ))}
            </TableRow>
        </TableHead>
    );
}


interface ParticipantRowProps {
    participant: IParticipant,
    onClick : (participant:IParticipant) => void
}

function ParticipantRow(props: ParticipantRowProps) {
    const { participant } = props

    function handleClick(){
        props.onClick(participant)

    }

    return (
        <TableRow onClick={handleClick} hover>
            <TableCell>{participant.athelete.firstName}</TableCell>
            <TableCell>{participant.athelete.lastName}</TableCell>
            <TableCell>{participant.athelete.gender}</TableCell>
        </TableRow>
    )
}


export function ParticipantTable() {

    const Participants = useAppSelector(state => state.participant.participants)
    const headersData = ["firstName", "lastName", "gender"]
    const dispatch = useAppDispatch()

    function handleRowClick(participant:IParticipant){
        dispatch(selectParticipant(participant.athelete.atheleteId))
        dispatch(setEditingMode(true))
        dispatch(openModal())
    }

    return (
        <Box>
            <ActionsHeader className="m-4" />
            <TableContainer component={Paper}>
                <Table sx={{ minWidth: 700 }} aria-label="customized table">

                    <ParticipantHeader headers={headersData} />
                    <TableBody>
                        {Participants.map((participant) => (
                            <ParticipantRow
                                key={participant.athelete.atheleteId}
                                participant={participant}
                                onClick={handleRowClick}
                            />
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
        </Box>
    )
}



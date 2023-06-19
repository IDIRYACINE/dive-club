"use client";

import { IAthelete } from "@/core/athelete/atheleteEntity";
import { IParticipationEntity, IParticipation } from "@/core/participants/participantsEntity"
import { participantsRoute } from "@/features/navigation/logic/routes";
import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks"
import { updateAthelete } from "@/stores/clubsStore/slices/atheleteSlice";
import { addAtheleteParticipation, addParticipant, deleteAtheleteParticipation, selectEditedParticipant, selectParticipantParticipations, updateAtheleteParticipation } from "@/stores/clubsStore/slices/participantsSlice"
import { Typography, TableHead, TableCell, TableRow, Box, Button, TableContainer, Table, TableBody, Paper, Stack } from "@mui/material"
import { useRouter } from "next/navigation";
import { useState } from "react";
import { AtheleteLicenseSearch, ParticipantCard, ParticipationEntityDropdown } from "./components"


interface ParticipationEntityRowProps {
    participation: IParticipation,
    onClick: (participation: IParticipation) => void
}

function ParticipationEntityRow(props: ParticipationEntityRowProps) {
    const { participation } = props

    function handleClick() {
        props.onClick(participation)
    }

    return (
        <TableRow onClick={handleClick} hover>
            <TableCell>{participation.division.name}</TableCell>
            <TableCell>{participation.specialty.name}</TableCell>
        </TableRow>
    )
}

interface AtheleteHeaderProps {
    headers: string[]
}

function ParticipationEntityHeader(props: AtheleteHeaderProps) {
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

interface AtheleteParticipationActionsProps {
    participations: IParticipation[]
    onAdd: (participation: IParticipation) => void
}

function AtheleteParticipationActions(props: AtheleteParticipationActionsProps) {

    const sharedClassName = "m-2"

    const divisions = useAppSelector(state => state.participant.divisions)
    const specialties = useAppSelector(state => state.participant.specialties)



    const divisionSpecialtySelection: IParticipation = {
        division: divisions[0],
        specialty: specialties[0],
    }

    function updateDivision(value: IParticipationEntity) {
        divisionSpecialtySelection.division = value
    }

    function updateSpecialty(value: IParticipationEntity) {
        divisionSpecialtySelection.specialty = value
    }

    const specialtyDropdownProps = {
        updateEntity: updateSpecialty,
        className: sharedClassName,
        entities: specialties,
        label: "Specialties",
    }

    const divisionDropdownProps = {
        updateEntity: updateDivision,
        className: sharedClassName,
        entities: divisions,
        label: "Divisions",
    }

    function handleAdd() {
        props.onAdd(divisionSpecialtySelection)
    }

    return (
        <Box className="flex flex-col ">
            <Typography variant="h6">Participation</Typography>
            <Box className="flex flex-row">
                <ParticipationEntityDropdown {...divisionDropdownProps} />
                <ParticipationEntityDropdown {...specialtyDropdownProps} />
                <Button onClick={handleAdd} variant="contained" color="primary">Add</Button>
            </Box>

        </Box>
    )
}
interface AtheleteParticipationTableProps {
    onDeletion: (participation: IParticipation) => void,
    participations: IParticipation[],
    athelete: IAthelete | undefined | null
}

function AtheleteParticipationTable(props: AtheleteParticipationTableProps) {
    const headersData = ["division", "specialty"]
    const dispatch = useAppDispatch()
    const router = useRouter()
    const isEditMode = useAppSelector(state => state.participant.isEditing)

    function handleRowClick(participation: IParticipation) {
        props.onDeletion(participation)
    }

    function cancel() {
        router.push(participantsRoute)
    }

    function save() {
        if (isEditMode) {
            dispatch(updateAtheleteParticipation(props.participations))

        }
        else {

            if (!props.athelete) {
                return;
            }

            dispatch(addParticipant({
                athelete: props.athelete,
                participations: props.participations,
            }))
        }
        router.push(participantsRoute)
    }

    return (
        <Stack direction="column" spacing={4}>
            <TableContainer component={Paper}>
                <Table sx={{ minWidth: 700 }} aria-label="customized table">

                    <ParticipationEntityHeader headers={headersData} />
                    <TableBody>
                        {props.participations.map((participation, index) => (
                            <ParticipationEntityRow
                                key={"participation" + index}
                                participation={participation}
                                onClick={handleRowClick}
                            />
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>

            <Box className="flex flex-row justify-between">
                <Button onClick={cancel} >Cancel</Button>
                <Button onClick={save} variant="contained" color="primary">Save</Button>
            </Box>

        </Stack>

    )
}

export function ParticipationEditor() {
    const participationsQuery = useAppSelector(state => selectParticipantParticipations(state))
    const [participations, setParticipations] = useState(participationsQuery)
    const athelete = useAppSelector(state => selectEditedParticipant(state)?.athelete)


    function addParticipation(participation: IParticipation) {
        const exists = participations.find((target) => target.division.id === participation.division.id && target.specialty.id === participation.specialty.id)

        if (!exists) {
            setParticipations([...participations, participation])
        }
    }

    function deleteParticipation(participation: IParticipation) {
        setParticipations(participations.filter((target) => target.division.id !== participation.division.id && target.specialty.id !== participation.specialty.id))
    }

    return (
        <Box sx={{"backgroundColor":"white","padding":"4rem","overflowY":"scroll"}}>
            <AtheleteLicenseSearch />
            <ParticipantCard athelete={athelete} />
            <AtheleteParticipationActions participations={participations} onAdd={addParticipation} />
            <AtheleteParticipationTable athelete={athelete} onDeletion={deleteParticipation} participations={participations} />
        </Box>
    )
}
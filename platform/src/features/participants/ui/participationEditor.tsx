"use client";

import { IAthelete } from "@/core/athelete/atheleteEntity";
import { IParticipationEntity, IParticipation } from "@/core/participants/participantsEntity"
import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks"
import { selectAtheletes } from "@/stores/clubsStore/slices/atheleteSlice";
import { closeModal } from "@/stores/clubsStore/slices/navigationSlice";
import { addParticipant, deleteParticipant, selectParticipantParticipations, setSearchedAthelete, updateAtheleteParticipation } from "@/stores/clubsStore/slices/participantsSlice"
import { Typography, TableHead, TableCell, TableRow, Box, Button, TableContainer, Table, TableBody, Paper, Stack, Modal } from "@mui/material"
import { useEffect, useState } from "react";
import { createParticipantApi, deleteParticipantApi, updateParticipantApi } from "../logic/api";
import { AtheleteLicenseSearch,EntryTimeField, ParticipantCard, ParticipationEntityDropdown } from "./components"


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
            <TableCell>{participation.entryTime}</TableCell>
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
    let entryTime ="99:99.99"



    const divisionSpecialtySelection: IParticipation = {
        division: divisions[0],
        specialty: specialties[0],
        entryTime:entryTime
    }

    function updateDivision(value: IParticipationEntity) {
        divisionSpecialtySelection.division = value
    }

    function updateSpecialty(value: IParticipationEntity) {
        divisionSpecialtySelection.specialty = value
    }

    function updateEntryTime(value:string){
        entryTime = value
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

    const entryTimeFieldProps = {
        onUpdate: updateEntryTime,
        className:sharedClassName
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
                <EntryTimeField {...entryTimeFieldProps} />
                <Button onClick={handleAdd} variant="contained" color="primary">Add</Button>
            </Box>

        </Box>
    )
}
interface AtheleteParticipationTableProps {
    onDeletion: (participation: IParticipation) => void,
    participations: IParticipation[],
    athelete: IAthelete | undefined | null,
    isEditMode:boolean
}

function AtheleteParticipationTable(props: AtheleteParticipationTableProps) {
    const headersData = ["division", "specialty","entryTime"]
    const dispatch = useAppDispatch()
    const{onDeletion,participations,athelete,isEditMode} = props

    const clubId = useAppSelector(state => state.navigation.clubId!)

    function handleRowClick(participation: IParticipation) {
        onDeletion(participation)
    }

    function cancel() {
        dispatch(closeModal())
        dispatch(setSearchedAthelete())
    }




    function onDelete() {

        if (athelete) {
            dispatch(closeModal())
            return
        }

        dispatch(deleteParticipant(athelete!.atheleteId))

        dispatch(closeModal())

        deleteParticipantApi({
            clubId,
            participantId: props.athelete!.atheleteId,
        })

    }

    function save() {
        if (isEditMode) {
            dispatch(updateAtheleteParticipation(props.participations))
            updateParticipantApi(
                {
                    clubId,
                    participantId: props.athelete!.atheleteId,
                    participant: { participations: props.participations },

                }
            )
        }
        else {

            if (!athelete) {
                return;
            }

            dispatch(addParticipant(
                participations,
            ))

            createParticipantApi({
                clubId,
                participantId: athelete.atheleteId,
                participant: {
                    athelete: athelete,
                    participations: participations,
                }
            })
        }
        dispatch(closeModal())
    }

    return (
        <Stack direction="column" spacing={4}>
            <TableContainer component={Paper}>
                <Table sx={{ minWidth: 700 }} aria-label="customized table">

                    <ParticipationEntityHeader headers={headersData} />
                    <TableBody>
                        {participations.map((participation, index) => (
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
            {isEditMode ? <Button onClick={onDelete} color="warning" variant="contained"> Delete </Button> : null}

                <Button onClick={cancel} >Cancel</Button>
                <Button onClick={save} variant="contained" color="primary">Save</Button>

            </Box>

        </Stack>

    )
}

export function ParticipationEditor() {
    const participationsQuery = useAppSelector(state => selectParticipantParticipations(state))
    const [participations, setParticipations] = useState(participationsQuery)
    const atheletes = useAppSelector(state => selectAtheletes(state))
    const athelete = useAppSelector(state => state.participant.searchedAthelete)
    const isModalOpen = useAppSelector(state => state.navigation.isModalOpen)
    const isEditMode = useAppSelector(state => state.participant.selectedParticipantId !== null)

    useEffect(() => {
        setParticipations(participationsQuery);
      }, [participationsQuery]);

    const dispatch=useAppDispatch()

    function addParticipation(participation: IParticipation) {
        const exists = participations.find((target) => target.division.id === participation.division.id && target.specialty.id === participation.specialty.id)

        if (!exists) {
            setParticipations([...participations, participation])
        }
    }

    function deleteParticipation(participation: IParticipation) {
        setParticipations(participations.filter((target) => target.division.id !== participation.division.id && target.specialty.id !== participation.specialty.id))
    }

    
    const modalStyle = {
        "display": "flex",
        "flexDirection": "column",
        "justifyContent": "center",
        "alignItems": "center",

    }

    function onCancel() {
        dispatch(closeModal())
        dispatch(setSearchedAthelete())

    }

    return (
        <Modal sx={modalStyle} onClose={onCancel} open={isModalOpen}>
            <Box sx={{ "backgroundColor": "white", "padding": "4rem", "overflowY": "scroll" }}>
            {isEditMode? null : <AtheleteLicenseSearch atheletes={atheletes} />} 
            <ParticipantCard athelete={athelete} />
            <AtheleteParticipationActions participations={participations} onAdd={addParticipation} />
            <AtheleteParticipationTable isEditMode={isEditMode} athelete={athelete} onDeletion={deleteParticipation} participations={participations} />
        </Box>

        </Modal>
    )

}
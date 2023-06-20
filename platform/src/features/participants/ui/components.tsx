"use client";

import { useAppDispatch } from "@/stores/clubsStore/hooks"
import { setSearchedAthelete } from "@/stores/clubsStore/slices/participantsSlice"
import { TextField, Container, Typography, SelectChangeEvent, MenuItem, Select } from "@mui/material"
import { useState, ChangeEvent } from "react"
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import { IAthelete } from "@/core/athelete/atheleteEntity"
import { IParticipationEntity } from "@/core/participants/participantsEntity"


interface AtheleteLicenseSearchProps {
    atheletes: IAthelete[]
}
export function AtheleteLicenseSearch(props: AtheleteLicenseSearchProps) {

    const { atheletes } = props

    const [license, setLicense] = useState<string>("")
    const dispatch = useAppDispatch()


    function handleOnChange(event: ChangeEvent<HTMLInputElement>) {
        setLicense(event.target.value)
    }

    function handleSearch() {
        const athelete = atheletes.find((target) => target.atheleteId === license)

        dispatch(setSearchedAthelete(athelete))
    }

    return (
        <Stack direction="row" spacing={2} >
            <TextField value={license} onChange={handleOnChange} id="outlined-license" label="Athelete License" variant="outlined" />
            <Button onClick={handleSearch} color="primary" variant="contained">Search</Button>
        </Stack>
    )
}

interface ParticipantCardProps {
    athelete?: IAthelete | null
}

export function ParticipantCard(props: ParticipantCardProps) {
    const { athelete } = props

    const containerStyle = {
        display: "flex",
        flexDirection: "column",
        justifyContent: "start",
        alignItems: "center",
    }
    const unkown = "unkown"

    return (
        <Container sx={containerStyle}>
            <Stack direction="row" spacing={2} >
                <Typography variant="body1">Athelete : {athelete?.lastName ?? unkown} {athelete?.firstName ?? unkown}</Typography>
                <Typography variant="body1">Birth : {athelete?.dateOfBirth ?? unkown}</Typography>
            </Stack>

        </Container>
    )


}


interface ParticipationEntityDropdownProps {
    updateEntity: (value: IParticipationEntity) => void,
    initialValue?: string,
    className?: string,
    entities: IParticipationEntity[],
    label: string,

}
export function ParticipationEntityDropdown(props: ParticipationEntityDropdownProps) {

    const { entities, label, className, updateEntity, initialValue } = props

    const [entity, setEntity] = useState(entities[0])

    function handleChange(event: SelectChangeEvent<string>) {
        const index = parseInt(event.target.value)
        const value = entities.find(target => target.id === index)!
        setEntity(value)
        updateEntity(value)
    }

    return (
        <Select
            className={className}
            labelId="participation-entity-select-label"
            id="participation-entity-select"
            value={entity.id.toString()}
            label={label}
            onChange={handleChange}
        >
            {
                entities.map((entity, index) => {
                    return <MenuItem key={"entity" + entity.id} value={entity.id}>{entity.name}</MenuItem>

                })
            }
        </Select>
    )
}

interface EntryTimeFieldProps {
    initialValue?: string,
    onUpdate: (value: String) => void,
    className?: string
}
export function EntryTimeField(props: EntryTimeFieldProps) {
    const { initialValue, onUpdate, className } = props

    const [entryTime, setEntryTime] = useState(initialValue ?? "99:99.9")

    function updateEntryTime(e) {
        const value = e.target.value
        setEntryTime(value)
        onUpdate(value)
    }

    return (
        <TextField onChange={updateEntryTime} value={entryTime}  />
    );

}
import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks"
import { selectEditedParticipant, selectEditParticipantId, selectParticipant } from "@/stores/clubsStore/slices/participantsSlice"
import { Box, Button, TextField, Container, Typography, SelectChangeEvent, MenuItem, Select } from "@mui/material"
import { useState, ChangeEvent } from "react"


import { IAthelete } from "@/core/athelete/atheleteEntity"
import { IParticipationEntity } from "@/core/participants/participantsEntity"

export function AtheleteLicenseSearch() {

    const [license, setLicense] = useState<string>("")
    const dispatch = useAppDispatch()

    function handleOnChange(event: ChangeEvent<HTMLInputElement>) {
        setLicense(event.target.value)
    }

    function handleSearch() {
        dispatch(selectParticipant(license))
    }

    return (
        <Box>
            <TextField value={license} onChange={handleOnChange} id="outlined-license" label="Athelete License" variant="outlined" />
            <Button onClick={handleSearch} color="primary" variant="contained">Search</Button>
        </Box>
    )
}

export function ParticipantCard() {
    const athelete = useAppSelector(state => selectEditedParticipant(state)?.athelete)

    const containerStyle = {
        display: "flex",
        flexDirection: "column",
        justifyContent: "start",
        alignItems: "center",
    }
    const unkown = "unkown"

    return (
        <Container sx={containerStyle}>
            <Box className="flex flex-row justify-between">
                <Typography variant="body1">Athelete : {athelete?.lastName ?? unkown} {athelete?.firstName ?? unkown}</Typography>
                <Typography variant="body1">Birth : {athelete?.dateOfBirth ?? unkown}</Typography>
            </Box>

        </Container>
    )


}


interface ParticipationEntityDropdownProps {
    updateEntity: (value: number) => void,
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
        updateEntity(index)
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


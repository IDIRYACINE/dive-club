"use client";

import { useAppDispatch } from "@/stores/clubsStore/hooks"
import { setSearchedAthelete } from "@/stores/clubsStore/slices/participantsSlice"
import { TextField, Container, Typography, SelectChangeEvent, MenuItem, Select } from "@mui/material"
import { useState, ChangeEvent } from "react"
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import { IAthelete } from "@/core/athelete/atheleteEntity"
import { IParticipationEntity } from "@/core/participants/participantsEntity"
import { validateEntryTime, validateLicense } from "@/utility/validators";
import { formatEntryTime } from "@/utility/formaters";


interface AtheleteLicenseSearchProps {
    atheletes: IAthelete[]
}
export function AtheleteLicenseSearch(props: AtheleteLicenseSearchProps) {

    const { atheletes } = props

    const [license, setLicense] = useState<string | null>(null)
    const dispatch = useAppDispatch()


    function handleOnChange(event: ChangeEvent<HTMLInputElement>) {
        const value = event.target.value
        if (value && validateLicense(value)) {
            setLicense(value)

        }
    }

    function handleSearch() {
        if (!license) return

        const athelete = atheletes.find((target) => target.atheleteId === license)

        dispatch(setSearchedAthelete(athelete))
    }

    return (
        <Stack direction="row" spacing={2} >
            <TextField required error={!license}
                helperText={!license ? "Invalid License" : null}
                value={license}
                onChange={handleOnChange}
                id="outlined-license"
                label="Athelete License" variant="outlined" />
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
        paddingTop: "1rem",
        paddingBottom: "1rem",
        width: "100%"
    }

    const unkown = "unkown"

    return (

        <Stack sx={containerStyle} direction="row" spacing={8} >
            <Typography variant="body1">Athelete : {athelete?.lastName ?? unkown} {athelete?.firstName ?? unkown}</Typography>
            <Typography variant="body1">Birth : {athelete?.dateOfBirth ?? unkown}</Typography>

        </Stack>
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

    const [entryTime, setEntryTime] = useState({
        raw: initialValue ?? "",
        formated: initialValue ?? ""
    })


    function updateEntryTime(e) {
        const raw = e.target.value
        const formated = formatEntryTime(raw)


        setEntryTime({
            raw,
            formated
        })

        onUpdate(formated)
    }

    return (
        <Stack direction="row" spacing={2} sx={{ "alignItems": "center" }}>
            <TextField required error={!validateEntryTime(entryTime.formated)}
                value={entryTime.raw}
                onChange={updateEntryTime} />

            <Typography variant="body1">{!validateEntryTime(entryTime.formated) ? "Invalid EntryTime" : entryTime.formated}</Typography>

        </Stack>
    );

}
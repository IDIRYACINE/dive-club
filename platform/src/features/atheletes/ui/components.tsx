"use client";

import { AtheleteGender } from "@/core/athelete/AtheleteEntity";
import { Box, MenuItem, Select, SelectChangeEvent, TextField } from "@mui/material";
import { DatePicker } from "@mui/x-date-pickers";
import { Dayjs } from "dayjs";
import { useState } from "react";


interface GenderDropdownProps {
    updateGender: (value: string) => void
}
export function GenderDropdown(props: GenderDropdownProps) {
    const genders = [
        AtheleteGender.male().value,
        AtheleteGender.female().value
    ]

    function handleChange(event: SelectChangeEvent<string>) {
        props.updateGender(event.target.value)
    }

    return (
        <Select
            labelId="athelete-gender-select-label"
            id="athelete-gender-select"
            value={genders[0]}
            label="Gender"
            onChange={handleChange}
        >
            {
                genders.map((gender, index) => {
                    return <MenuItem key={"gender" + index} value={gender}>{gender}</MenuItem>

                })
            }
        </Select>
    )
}

interface AgeDropdownProps {
    updateAge: (value: string) => void
}
export function AgeDropdown(props: AgeDropdownProps) {

    const [age,setAge] = useState<Dayjs | null>(null)

    
    function handleChange(newValue: Dayjs | null): void {
        setAge(newValue)
        props.updateAge(newValue?.format("YYYY-MM-DD") || "")
    }

    return(<DatePicker value ={age} onChange={(newValue) => handleChange(newValue)}/>)
}


interface AtheleteNameFieldProps{
    updateName: (firstName: string) => void,
    updateLastName: (lastName: string) => void
}

export function AtheleteNameField(props: AtheleteNameFieldProps){
    const [firstName, setFirstName] = useState<string>("")
    const [lastName, setLastName] = useState<string>("")

    function handleFirstNameChange(event: React.ChangeEvent<HTMLInputElement>){
        setFirstName(event.target.value)
        props.updateName(event.target.value)
    }

    function handleLastNameChange(event: React.ChangeEvent<HTMLInputElement>){
        setLastName(event.target.value)
        props.updateLastName(event.target.value)
    }

    return(
        <Box className="flex flex-row">
            <TextField id="first-name" label="First Name" variant="outlined" onChange={handleFirstNameChange}/>
            <TextField id="last-name" label="Last Name" variant="outlined" onChange={handleLastNameChange}/>
        </Box>
    )
}

interface AtheleteLicenseProps{
    updateAtheleteLicense: (license: string) => void
}
export function AtheleteLicense(props: AtheleteLicenseProps){
    const [license, setLicense] = useState<string>("")

    function handleLicenseChange(event: React.ChangeEvent<HTMLInputElement>){
        setLicense(event.target.value)
        props.updateAtheleteLicense(event.target.value)
    }

    return(
        <Box className="flex flex-row">
            <TextField id="athelete-license" label="Athelete License" variant="outlined" onChange={handleLicenseChange}/>
        </Box>
    )
}
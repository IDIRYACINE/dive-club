"use client";

import { AtheleteGender } from "@/core/athelete/atheleteEntity";
import { validateLicense, validateName } from "@/utility/validators";
import { Box, MenuItem, Select, SelectChangeEvent, TextField } from "@mui/material";
import { DatePicker } from "@mui/x-date-pickers";
import { Dayjs } from "dayjs";
import { useState } from "react";


interface GenderDropdownProps {
    updateGender: (value: string) => void,
    initialGender?: string,
    className?: string,

}
export function GenderDropdown(props: GenderDropdownProps) {
    const genders = [
        AtheleteGender.male().value,
        AtheleteGender.female().value
    ]

    const [gender, setGender] = useState(props.initialGender ?? genders[0])

    function handleChange(event: SelectChangeEvent<string>) {
        const value = event.target.value
        setGender(value)
        props.updateGender(value)
    }

    return (
        <Select
            className={props.className}
            labelId="athelete-gender-select-label"
            id="athelete-gender-select"
            value={gender}
            label="الجنس"
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
    updateAge: (value: string) => void,
    initialAge?: Dayjs,
    className?: string,

}
export function AgeDropdown(props: AgeDropdownProps) {

    const [age, setAge] = useState<Dayjs | null>(props.initialAge ?? null)

    function handleChange(newValue: Dayjs | null): void {
        setAge(newValue)
        props.updateAge(newValue?.format("DD/MM/YYYY") || "01/01/1990")
    }

    return (<DatePicker className={props.className} value={age} onChange={(newValue) => handleChange(newValue)} />)
}


interface AtheleteNameFieldProps {
    updateName: (firstName: string) => void,
    updateLastName: (lastName: string) => void,
    initialFirstName?: string,
    initialLastName?: string,
    className?: string,

}

export function AtheleteNameField(props: AtheleteNameFieldProps) {
    const [firstName, setFirstName] = useState<string>(props.initialFirstName ?? "")
    const [lastName, setLastName] = useState<string>(props.initialLastName ?? "")


    function handleFirstNameChange(event: React.ChangeEvent<HTMLInputElement>) {
        setFirstName(event.target.value)
        props.updateName(event.target.value)
    }

    function handleLastNameChange(event: React.ChangeEvent<HTMLInputElement>) {
        setLastName(event.target.value)
        props.updateLastName(event.target.value)
    }

    return (
        <Box className="flex flex-row">
            <TextField required
                error={!validateName(firstName)}
                helperText={!validateName(firstName) ? "الاسم المدخل خاطئ" : null}
                className={props.className} value={firstName} id="first-name" label="الاسم" variant="outlined" onChange={handleFirstNameChange} />
            <TextField
                error={!validateName(lastName)}
                helperText={!validateName(lastName) ? "الاسم المدخل خاطئ" : null}
                required className={props.className}
                value={lastName} id="last-name" label="اللقب"
                variant="outlined" onChange={handleLastNameChange} />
        </Box>
    )
}

interface AtheleteLicenseProps {
    updateAtheleteLicense: (license: string) => void,
    initialLicense?: string,
    className?: string,

}
export function AtheleteLicense(props: AtheleteLicenseProps) {
    const [license, setLicense] = useState<string | null>(props.initialLicense ?? "")

    function handleLicenseChange(event: React.ChangeEvent<HTMLInputElement>) {
        const value = parseInt(event.target.value)
        setLicense(event.target.value)

        if (!isNaN(value)) {
            props.updateAtheleteLicense(event.target.value)

        }
    }

    return (
        <Box className="flex flex-row">
            <TextField required className={props.className}
                value={license} id="athelete-license" label="رقم الترخيص"
                variant="outlined" onChange={handleLicenseChange}
                error={!validateLicense(license??"")}
                helperText={!validateLicense(license??"")? "Invalid License Number": null}
            />
        </Box>
    )
}
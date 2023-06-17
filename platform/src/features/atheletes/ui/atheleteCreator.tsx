import { IAthelete } from "@/core/athelete/AtheleteEntity";
import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { closeModal } from "@/stores/clubsStore/slices/navigationSlice";
import { Box, Button } from "@mui/material";
import { useRef } from "react";
import { AtheleteNameField, GenderDropdown, AgeDropdown, AtheleteLicense } from "./components";


export function AtheleteCreator() {

    const dispatch = useAppDispatch()
    const isEditMode = useAppSelector(state => state.athelete.isEditMode)

    const athelete = useRef<IAthelete>({
        firstName: "",
        lastName: "",
        dateOfBirth: "",
        gender: "",
        atheleteId: ""
    });

    function updateName(firstName: string) {
        athelete.current.firstName = firstName
    }

    function updateLastName(lastName: string) {
        athelete.current.lastName = lastName
    }

    function updateAge(age: string) {
        athelete.current.dateOfBirth = age
    }

    function updateGender(gender: string) {
        athelete.current.gender = gender
    }


    function updateAtheleteLicense(license: string) {
        athelete.current.atheleteId = license
    }

    function onConfirm() {
        if(isEditMode){

        }
        else{

        }

        dispatch(closeModal())
    }

    function onCancel() {
        if(isEditMode){

        }
        else{
            
        }

        dispatch(closeModal())
    }


  

    return (
        <Box>
            <h1> {isEditMode? "Update Athelete" :"Create Athelete" } </h1>
            <AtheleteLicense updateAtheleteLicense={updateAtheleteLicense} />
            <AtheleteNameField updateName={updateName} updateLastName={updateLastName} />
            <GenderDropdown updateGender={updateGender} />
            <AgeDropdown updateAge={updateAge} />

            <ActionsRow onConfirm={onConfirm} onCancel={onCancel} />
        </Box>
    )
}

interface ActionsProps {
    onConfirm: () => void,
    onCancel: () => void
}

function ActionsRow(props: ActionsProps) {
    return (
        <Box className="flex flex-row justify-between">
            <Button onClick={props.onConfirm}> Confirm </Button>
            <Button onClick={props.onCancel}> Cancel </Button>
        </Box>
    )
}
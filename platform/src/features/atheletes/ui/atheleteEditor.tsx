import { AtheleteEntity, IAthelete } from "@/core/athelete/AtheleteEntity";
import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { addAthelete, updateAthelete } from "@/stores/clubsStore/slices/atheleteSlice";
import { closeModal } from "@/stores/clubsStore/slices/navigationSlice";
import { Box, Button, Modal, Container } from "@mui/material";
import { useRef } from "react";
import { AtheleteNameField, GenderDropdown, AgeDropdown, AtheleteLicense } from "./components";


export function AtheleteEditor() {

    const dispatch = useAppDispatch()
    const isEditMode = useAppSelector(state => state.athelete.isEditMode)
    const isModalOpen = useAppSelector(state => state.navigation.isModalOpen)

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
        const entity = AtheleteEntity.fromRaw(athelete.current)

        if (isEditMode) {
            dispatch(updateAthelete(entity))

        }
        else {
            dispatch(addAthelete(entity))

        }

        dispatch(closeModal())
    }

    function onCancel() {

        dispatch(closeModal())
    }

    function onDelete(){

    }


    const containerStyle = {
        "display": "flex",
        "flexDirection": "column",
        "backgroundColor": "white"
    }

    const licenseProps = {
        updateAtheleteLicense: updateAtheleteLicense,
        initialLicense:athelete.current.atheleteId,
    }

    const atheleteNameProps = {
        updateName:updateName ,
        updateLastName:updateLastName,
        initialFirstName : athelete.current.firstName,
        initialLastName:athelete.current.lastName,
    }

    return (
        <Modal onClose={onCancel} open={isModalOpen}>

            <Container sx={containerStyle}>
                <h1> {isEditMode ? "Update Athelete" : "Create Athelete"} </h1>
                <AtheleteLicense  {...licenseProps} />
                <AtheleteNameField {...atheleteNameProps} />
                <GenderDropdown updateGender={updateGender} />
                <AgeDropdown updateAge={updateAge} />

                <ActionsRow  onDelete={isEditMode?onDelete : null} onConfirm={onConfirm} onCancel={onCancel} />
            </Container>
        </Modal>

    )
}

interface ActionsProps {
    onConfirm: () => void,
    onCancel: () => void,
    onDelete : (() => void )| null,
}

function ActionsRow(props: ActionsProps) {
    return (
        <Box className="flex flex-row justify-between">
            {props.onDelete !=null ? <Button onClick={props.onDelete}> Delete </Button> : null}
            <Button onClick={props.onCancel}> Cancel </Button>
            <Button onClick={props.onConfirm}> Confirm </Button>

        </Box>
    )
}
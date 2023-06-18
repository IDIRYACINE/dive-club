import {  IAthelete } from "@/core/athelete/AtheleteEntity";
import { selectEditedAthelete, useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { addAthelete, deleteAthelete, updateAthelete } from "@/stores/clubsStore/slices/atheleteSlice";
import { closeModal } from "@/stores/clubsStore/slices/navigationSlice";
import { Box, Typography,Button, Modal, Container } from "@mui/material";
import dayjs from "dayjs";
import { useRef } from "react";
import { AtheleteNameField, GenderDropdown, AgeDropdown, AtheleteLicense } from "./components";
import clsx from "clsx";

export function AtheleteEditor() {

    const dispatch = useAppDispatch()
    const isModalOpen = useAppSelector(state => state.navigation.isModalOpen)
    const editedAtheleteEntity = useAppSelector (state => selectEditedAthelete(state))

    const isEditMode = editedAtheleteEntity !== null

    const athelete = useRef<IAthelete>({
        firstName: editedAtheleteEntity?.firstName ?? "",
        lastName: editedAtheleteEntity?.lastName ?? "",
        dateOfBirth: editedAtheleteEntity?.dateOfBirth ?? "",
        gender: editedAtheleteEntity?.gender ?? "",
        atheleteId: editedAtheleteEntity?.atheleteId ?? "",
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

        if (isEditMode) {
            dispatch(updateAthelete(athelete.current))

        }
        else {
            dispatch(addAthelete(athelete.current))

        }

        dispatch(closeModal())
    }

    function onCancel() {

        dispatch(closeModal())
    }

    function onDelete() {

        dispatch(deleteAthelete(athelete.current.atheleteId))

        dispatch(closeModal())

    }

    const containerStyle = {
        "display": "flex",
        "flexDirection": "column",
        "justifyContent": "space-between",
        "backgroundColor": "white"
    }

    const sharedClassName = "m-4"

    const licenseProps = {
        updateAtheleteLicense: updateAtheleteLicense,
        initialLicense: athelete.current.atheleteId,
        className: sharedClassName
    }

    const atheleteNameProps = {
        updateName: updateName,
        updateLastName: updateLastName,
        initialFirstName: athelete.current.firstName,
        initialLastName: athelete.current.lastName,
        className: sharedClassName

    }

    const genderProps = {
        updateGender: updateGender,
        initialGender: athelete.current.gender,
        className: sharedClassName

    }

    const ageProps = {
        updateAge: updateAge,
        initialAge: dayjs(athelete.current.dateOfBirth, "MM/DD/YYYY"),
        className: sharedClassName

    }

    const actionsRowProps = {
        onDelete: (isEditMode ? onDelete : null),
         onConfirm:onConfirm,
          onCancel:onCancel,
        className:sharedClassName
        }

    const modalStyle = {
        "display": "flex",
        "flexDirection": "column",
        "justifyContent": "center",
        "alignItems": "center",

    }

    return (
        <Modal sx={modalStyle} onClose={onCancel} open={isModalOpen}>

            <Container sx={containerStyle}>
                <Typography className={sharedClassName} variant="h5"> {isEditMode ? "Update Athelete" : "Create Athelete"} </Typography>
                <AtheleteLicense  {...licenseProps} />
                <AtheleteNameField {...atheleteNameProps} />
                <GenderDropdown {...genderProps} />
                <AgeDropdown {...ageProps} />

                <ActionsRow {...actionsRowProps} />
            </Container>
        </Modal>

    )
}

interface ActionsProps {
    onConfirm: () => void,
    onCancel: () => void,
    onDelete: (() => void) | null,
    className?: string
}

function ActionsRow(props: ActionsProps) {
    const boxClassName = clsx([props.className, "flex flex-row justify-between"])

    return (
        <Box className={boxClassName}>
            {props.onDelete != null ? <Button onClick={props.onDelete}> Delete </Button> : null}
            <Button onClick={props.onCancel}> Cancel </Button>
            <Button onClick={props.onConfirm}> Confirm </Button>

        </Box>
    )
}
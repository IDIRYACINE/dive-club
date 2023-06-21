import {  IAthelete } from "@/core/athelete/atheleteEntity";
import {  useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { addAthelete,selectEditedAthelete, deleteAthelete, updateAthelete, unselectAthelete } from "@/stores/clubsStore/slices/atheleteSlice";
import { closeModal } from "@/stores/clubsStore/slices/navigationSlice";
import { Box, Typography,Button, Modal, Container } from "@mui/material";
import dayjs from "dayjs";
import { useRef,useEffect } from "react";
import { AtheleteNameField, GenderDropdown, AgeDropdown, AtheleteLicense } from "./components";
import clsx from "clsx";
import { createAtheleteApi, deleteAtheleteApi, updateAtheleteApi } from "../logic/api";

interface AtheleteEditorProps {
    clubId: string|number}
export function AtheleteEditor() {

    const dispatch = useAppDispatch()
    const isModalOpen = useAppSelector(state => state.navigation.isModalOpen)
    const editedAtheleteEntity = useAppSelector (state => selectEditedAthelete(state))
    const clubId = useAppSelector(state => state.navigation.clubId!)

    const isEditMode = editedAtheleteEntity !== null

    const athelete = useRef<IAthelete>({
        firstName: editedAtheleteEntity?.firstName ?? "",
        lastName: editedAtheleteEntity?.lastName ?? "",
        dateOfBirth: editedAtheleteEntity?.dateOfBirth ?? "01/01/1990",
        gender: editedAtheleteEntity?.gender ?? "",
        atheleteId: editedAtheleteEntity?.atheleteId ?? "",
    });

    useEffect(() => {
        if (editedAtheleteEntity) {
          athelete.current = {
            firstName: editedAtheleteEntity.firstName ?? "",
            lastName: editedAtheleteEntity.lastName ?? "",
            dateOfBirth: editedAtheleteEntity.dateOfBirth ?? "01/01/1990",
            gender: editedAtheleteEntity.gender ?? "",
            atheleteId: editedAtheleteEntity.atheleteId ?? "",
          };
        }
      }, [editedAtheleteEntity]);

    function updateName(firstName: string) {
        athelete.current = {...athelete.current , firstName: firstName}
    }

    function updateLastName(lastName: string) {
        athelete.current = {...athelete.current , lastName: lastName}
    }

    function updateAge(age: string) {
        athelete.current = {...athelete.current , dateOfBirth: age}
    }

    function updateGender(gender: string) {
        athelete.current = {...athelete.current , gender:gender}
    }


    function updateAtheleteLicense(license: string) {
        athelete.current = {...athelete.current , atheleteId: license}
    }

    function onConfirm() {

        if (isEditMode) {
            dispatch(updateAthelete(athelete.current))
            updateAtheleteApi({
                clubId,
                atheleteId: athelete.current.atheleteId,
                athelete: athelete.current
            })
        }
        else {
            dispatch(addAthelete(athelete.current))

            createAtheleteApi({
                clubId,
                atheleteId: athelete.current.atheleteId,
                athelete: athelete.current
            })
        }

        dispatch(closeModal())
    }

    function onCancel() {
        dispatch(unselectAthelete())
        dispatch(closeModal())
    }

    function onDelete() {

        dispatch(deleteAthelete(athelete.current.atheleteId))

        dispatch(closeModal())

        deleteAtheleteApi({
            clubId,
            atheleteId: athelete.current.atheleteId,
        })

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
        initialLicense: editedAtheleteEntity?.atheleteId,
        className: sharedClassName
    }

    const atheleteNameProps = {
        updateName: updateName,
        updateLastName: updateLastName,
        initialFirstName: editedAtheleteEntity?.firstName,
        initialLastName: editedAtheleteEntity?.lastName,
        className: sharedClassName

    }

    const genderProps = {
        updateGender: updateGender,
        initialGender: editedAtheleteEntity?.gender,
        className: sharedClassName

    }

    const ageProps = {
        updateAge: updateAge,
        initialAge: dayjs(editedAtheleteEntity?.dateOfBirth, "DD/MM/YYYY"),
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
            {props.onDelete != null ? <Button onClick={props.onDelete} variant="contained" color="error"> Delete </Button> : null}
            <Button onClick={props.onCancel}> Cancel </Button>
            <Button onClick={props.onConfirm} variant="contained"> Confirm </Button>

        </Box>
    )
}
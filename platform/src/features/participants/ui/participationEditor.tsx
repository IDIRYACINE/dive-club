import { IParticipationEntity, IParticipation } from "@/core/participants/participantsEntity"
import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks"
import { addAtheleteParticipation, deleteAtheleteParticipation, selectParticipantParticipations } from "@/stores/clubsStore/slices/participantsSlice"
import { Typography, TableHead, TableCell, TableRow, Box, Button, TableContainer, Table, TableBody, Paper } from "@mui/material"
import { AtheleteLicenseSearch, ParticipantCard, ParticipationEntityDropdown } from "./components"


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

function AtheleteParticipationActions() {

    const sharedClassName = "m-2"

    const divisions = useAppSelector(state => state.participant.divisions)
    const specialties = useAppSelector(state => state.participant.specialties)
    const dispatch = useAppDispatch()

    const divisionSpecialtySelection = {
        divisionId: 0,
        specialtyId: 0,
    }

    function updateDivision(value: number) {
        divisionSpecialtySelection.divisionId = value
    }

    function updateSpecialty(value: number) {
        divisionSpecialtySelection.specialtyId = value
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

    function handleAdd() {

        dispatch(addAtheleteParticipation({
            division: {
                id: divisionSpecialtySelection.divisionId,
                name: ""
            },
            specialty: {
                id: divisionSpecialtySelection.specialtyId,
                name: ""
            }
        }))
    }

    return (
        <Box className="flex flex-col ">
            <Typography variant="h6">Participation</Typography>
            <Box className="flex flex-row">
                <ParticipationEntityDropdown {...divisionDropdownProps} />
                <ParticipationEntityDropdown {...specialtyDropdownProps} />
                <Button onClick={handleAdd} variant="contained" color="primary">Add</Button>
            </Box>

        </Box>
    )
}

function AtheleteParticipationTable() {
    const participations = useAppSelector(state => selectParticipantParticipations(state))
    const headersData = ["division", "specialty"]
    const dispatch = useAppDispatch()

    function handleRowClick(participation: IParticipation) {
        dispatch(deleteAtheleteParticipation(
            participation
        ))
    }

    return (

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

    )
}

export function ParticipationEditor() {
    return (
        <Box>
            <AtheleteLicenseSearch />
            <ParticipantCard />
            <AtheleteParticipationActions />
            <AtheleteParticipationTable />
        </Box>
    )
}
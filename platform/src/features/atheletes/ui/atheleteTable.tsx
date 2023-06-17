import { PrimaryTextButton } from "@/components/buttons";
import { AtheleteEntity } from "@/core/athelete/AtheleteEntity";
import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { selectAthelete, setEditMode } from "@/stores/clubsStore/slices/atheleteSlice";
import { openModal } from "@/stores/clubsStore/slices/navigationSlice";
import {
    Box, TableCell,
    TableRow, Paper, Table, TableBody, TableContainer, TableHead, Typography
} from "@mui/material";



function ActionsHeader() {

    const dispatch = useAppDispatch()


    function handleAddAthelete() {
        dispatch(openModal())

    }

    const props = {
        text: "Add Athelete",
        onClick: handleAddAthelete,
    }


    return (<Box className="flex flex-row justify-between">

        <Typography variant="h6">Atheletes</Typography>

        <PrimaryTextButton {...props} />


    </Box>)
}

interface AtheleteHeaderProps {
    headers: string[]
}

function AtheleteHeader(props: AtheleteHeaderProps) {
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


interface AtheleteRowProps {
    athelet: AtheleteEntity,
    onClick : (athelte:AtheleteEntity) => void
}

function AtheleteRow(props: AtheleteRowProps) {
    const { athelet } = props

    function handleClick(){
        props.onClick(athelet)
    }

    return (
        <TableRow onClick={handleClick} hover>
            <TableCell>{athelet.firstName.value}</TableCell>
            <TableCell>{athelet.lastName.value}</TableCell>
            <TableCell>{athelet.gender.value}</TableCell>
        </TableRow>
    )
}


export function AtheleteTable() {

    const atheletes = useAppSelector(state => state.athelete.athelete)
    const headersData = ["firstName", "lastName", "gender"]
    const dispatch = useAppDispatch()

    function handleRowClick(athelete:AtheleteEntity){
        dispatch(selectAthelete(athelete.atheleteId))
        dispatch(setEditMode(true))
        dispatch(openModal())
    }

    return (
        <Box>
            <ActionsHeader />
            <TableContainer component={Paper}>
                <Table sx={{ minWidth: 700 }} aria-label="customized table">

                    <AtheleteHeader headers={headersData} />
                    <TableBody>
                        {atheletes.map((athelete) => (
                            <AtheleteRow
                                key={athelete.atheleteId.value}
                                athelet={athelete}
                                onClick={handleRowClick}
                            />
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
        </Box>
    )
}



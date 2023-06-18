import { IAthelete } from "@/core/athelete/AtheleteEntity";
import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { selectAthelete } from "@/stores/clubsStore/slices/atheleteSlice";
import { openModal } from "@/stores/clubsStore/slices/navigationSlice";
import {
    Box, TableCell,Button,
    TableRow, Paper, Table, TableBody, TableContainer, TableHead, Typography
} from "@mui/material";
import clsx from "clsx";

interface ActionsHeaderProps {
    className?: string
}
function ActionsHeader(props:ActionsHeaderProps) {

    const dispatch = useAppDispatch()


    function handleAddAthelete() {
        dispatch(openModal())

    }

    const boxClassName= clsx([
        props.className,
        "flex flex-row justify-between"
    ])


    return (<Box className={boxClassName}>

        <Typography variant="h6">Atheletes</Typography>

        <Button onClick={handleAddAthelete} color="primary" variant="contained">
        Add Athelete
    </Button>


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
    athelet: IAthelete,
    onClick : (athelte:IAthelete) => void
}

function AtheleteRow(props: AtheleteRowProps) {
    const { athelet } = props

    function handleClick(){
        props.onClick(athelet)
    }

    return (
        <TableRow onClick={handleClick} hover>
            <TableCell>{athelet.firstName}</TableCell>
            <TableCell>{athelet.lastName}</TableCell>
            <TableCell>{athelet.gender}</TableCell>
        </TableRow>
    )
}


export function AtheleteTable() {

    const atheletes = useAppSelector(state => state.athelete.atheletes)
    const headersData = ["firstName", "lastName", "gender"]
    const dispatch = useAppDispatch()

    function handleRowClick(athelete:IAthelete){
        dispatch(selectAthelete(athelete.atheleteId))
        dispatch(openModal())
    }

    return (
        <Box>
            <ActionsHeader className="m-4" />
            <TableContainer component={Paper}>
                <Table sx={{ minWidth: 700 }} aria-label="customized table">

                    <AtheleteHeader headers={headersData} />
                    <TableBody>
                        {atheletes.map((athelete) => (
                            <AtheleteRow
                                key={athelete.atheleteId}
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



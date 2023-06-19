import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { closeModal } from "@/stores/clubsStore/slices/navigationSlice";
import { Modal } from "@mui/material";
import { ParticipationEditor } from "./participationEditor";


export function ParticipationDialog(){

    const dispatch = useAppDispatch()
    const isModalOpen = useAppSelector(state => state.navigation.isModalOpen)
    
    const modalStyle = {
        "display": "flex",
        "flexDirection": "column",
        "justifyContent": "center",
        "alignItems": "center",

    }

    function onCancel() {

        dispatch(closeModal())
    }

    return (
        <Modal sx={modalStyle} onClose={onCancel} open={isModalOpen}>
            <ParticipationEditor />

        </Modal>
    )
}
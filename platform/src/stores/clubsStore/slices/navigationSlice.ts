import {clubPanels, IPanelEntity } from '../../../features/navigation/logic/panelEntity'
import { createSlice, PayloadAction } from '@reduxjs/toolkit'


interface StoreInitialState {
    panels: IPanelEntity[],
    selectedPanelIndex: number,
    isModalOpen:boolean,
    clubId : string|number | null,
}


const initialState: StoreInitialState = {
    panels: clubPanels,
    selectedPanelIndex: 0,
    clubId: null,
    isModalOpen : false,
}

export const navigationSlice = createSlice({
    name: 'navigation',
    initialState: initialState,
    reducers: {
        setActivePanel(state, action: PayloadAction<IPanelEntity>) {

            state.selectedPanelIndex = action.payload.index
        },
        openModal(state){
            state.isModalOpen = true
        },
        closeModal(state){
            state.isModalOpen = false
        },
        setClubId(state,action:PayloadAction<string|number>){
            state.clubId = action.payload
        }

    },
})

export const { setActivePanel,openModal,closeModal,setClubId } = navigationSlice.actions

export default navigationSlice.reducer
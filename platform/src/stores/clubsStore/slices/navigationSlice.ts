import {clubPanels, PanelEntity } from '../../../features/navigation/logic/panelEntity'
import { createSlice, PayloadAction } from '@reduxjs/toolkit'


interface StoreInitialState {
    panels: PanelEntity[],
    selectedPanelIndex: number,
    isModalOpen:boolean,
}


const initialState: StoreInitialState = {
    panels: clubPanels,
    selectedPanelIndex: 0,
    isModalOpen : false
}

export const navigationSlice = createSlice({
    name: 'navigation',
    initialState: initialState,
    reducers: {
        setActivePanel(state, action: PayloadAction<PanelEntity>) {

            state.selectedPanelIndex = action.payload.index
        },
        openModal(state){
            state.isModalOpen = true
        },
        closeModal(state){
            state.isModalOpen = false
        }

    },
})

export const { setActivePanel,openModal,closeModal } = navigationSlice.actions

export default navigationSlice.reducer
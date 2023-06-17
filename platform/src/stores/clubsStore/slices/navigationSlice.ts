import { clubPanels, PanelEntity } from '@/features/navigation'
import { createSlice, PayloadAction } from '@reduxjs/toolkit'


interface StoreInitialState {
    panels: PanelEntity[],
    selectedPanelIndex: number
}


const initialState: StoreInitialState = {
    panels: clubPanels,
    selectedPanelIndex: 0
}

export const navigationSlice = createSlice({
    name: 'navigation',
    initialState: initialState,
    reducers: {
        setActivePanel(state, action: PayloadAction<PanelEntity>) {

            state.selectedPanelIndex = action.payload.index
        },


    },
})

export const { setActivePanel } = navigationSlice.actions

export default navigationSlice.reducer
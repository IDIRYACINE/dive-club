import {  IAthelete } from '@/core/athelete/AtheleteEntity'
import { createSlice, PayloadAction } from '@reduxjs/toolkit'


interface StoreInitialState {
    atheletes: IAthelete[],
    selectedAtheleteId: string | null
}

const initialState: StoreInitialState = {
    atheletes: [],
    selectedAtheleteId: null,
}

export const atheleteSlice = createSlice({
    name: 'athelete',
    initialState: initialState,
    reducers: {
        addAthelete(state, action: PayloadAction<IAthelete>) {
            const existsIndex = state.atheletes.findIndex(target => target.atheleteId === action.payload.atheleteId)
            if (existsIndex === -1) {
                state.atheletes.push(action.payload)
            }
            state.selectedAtheleteId = null
        },
        deleteAthelete(state, action: PayloadAction<string>) {
            state.atheletes = state.atheletes.filter((athelete) => !(athelete.atheleteId === action.payload));
            state.selectedAtheleteId = null
        },
        updateAthelete(state, action: PayloadAction<IAthelete>) {
            const index = state.atheletes.findIndex(target => target.atheleteId === action.payload.atheleteId)
            if(index !== -1){
                state.atheletes[index] = action.payload
            }
            state.selectedAtheleteId = null

        },
        selectAthelete(state, action: PayloadAction<string>) {
            state.selectedAtheleteId = action.payload
        },
        

    },
})

export const {addAthelete,updateAthelete,deleteAthelete } = atheleteSlice.actions
export const {selectAthelete} = atheleteSlice.actions
export default atheleteSlice.reducer
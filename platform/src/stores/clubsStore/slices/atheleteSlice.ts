import { AtheleteEntity, AtheleteId } from '@/core/athelete/AtheleteEntity'
import { createSlice, PayloadAction } from '@reduxjs/toolkit'


interface StoreInitialState {
    athelete: AtheleteEntity[],
    isEditMode: boolean,
    selectedAtheleteId: AtheleteId | null
}

const initialState: StoreInitialState = {
    athelete: [],
    selectedAtheleteId: null,
    isEditMode: false
}

export const atheleteSlice = createSlice({
    name: 'athelete',
    initialState: initialState,
    reducers: {
        addAthelete(state, action: PayloadAction<AtheleteEntity>) {
            const existsIndex = state.athelete.findIndex(target => target.equals(action.payload))
            if (existsIndex === -1) {
                state.athelete.push(action.payload)
            }
        },
        deleteAthelete(state, action: PayloadAction<AtheleteEntity>) {
            state.athelete = state.athelete.filter((athelete) => !athelete.equals(action.payload));

        },
        updateAthelete(state, action: PayloadAction<AtheleteEntity>) {
            const index = state.athelete.findIndex(target => target.equals(action.payload))
            if(index !== -1){
                state.athelete[index] = action.payload
            }
            state.selectedAtheleteId = null

        },
        selectAthelete(state, action: PayloadAction<AtheleteId>) {
            state.selectedAtheleteId = action.payload
        },
        setEditMode(state, action: PayloadAction<boolean>) {
            state.isEditMode = action.payload
        }
        

    },
})

export const {addAthelete,updateAthelete,deleteAthelete } = atheleteSlice.actions
export const {selectAthelete,setEditMode} = atheleteSlice.actions
export default atheleteSlice.reducer
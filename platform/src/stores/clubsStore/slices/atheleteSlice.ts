import { IAthelete, mockAtheletes } from '@/core/athelete/atheleteEntity'
import { RootState } from '@/stores'
import { createSelector, createSlice, PayloadAction } from '@reduxjs/toolkit'


interface StoreInitialState {
    atheletes: IAthelete[],
    selectedAtheleteId: string | null
}

const initialState: StoreInitialState = {
    atheletes: mockAtheletes,
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
            if (index !== -1) {
                state.atheletes[index] = action.payload
            }
            state.selectedAtheleteId = null

        },
        selectAthelete(state, action: PayloadAction<string>) {
            state.selectedAtheleteId = action.payload
        },

        setAtheletes(state, action: PayloadAction<IAthelete[]>) {
            state.atheletes = action.payload
        },
        unselectAthelete(state) {
            state.selectedAtheleteId = null
        }


    },
})


export const selectAtheletes = (state: RootState) => state.athelete.atheletes
export const selectEditAtheleteId = (state: RootState) => state.athelete.selectedAtheleteId

export const selectEditedAthelete = createSelector([selectAtheletes, selectEditAtheleteId],
    (atheletes, atheleteId) => {
        if(!atheleteId) return null
        return atheletes.find((athelete) => athelete.atheleteId === atheleteId)
    }

)

export const selectAtheleteById = createSelector(
    [selectAtheletes, (license : {atheleteLicense:string}) => license.atheleteLicense],
    (atheletes, atheleteId) => {
        return atheletes.find((athelete) => athelete.atheleteId === atheleteId)
    }
)


export const { addAthelete, updateAthelete, deleteAthelete } = atheleteSlice.actions
export const { selectAthelete,unselectAthelete,setAtheletes } = atheleteSlice.actions
export default atheleteSlice.reducer



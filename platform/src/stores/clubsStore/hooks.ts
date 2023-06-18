import { TypedUseSelectorHook, useDispatch, useSelector } from 'react-redux'
import type { RootState, AppDispatch } from './store'
import { createSelector} from '@reduxjs/toolkit'

export const useAppDispatch: () => AppDispatch = useDispatch
export const useAppSelector: TypedUseSelectorHook<RootState> = useSelector

export const selectAtheletes = (state: RootState) => state.athelete.atheletes
export const selectEditAtheleteId = (state: RootState) => state.athelete.selectedAtheleteId

export const selectEditedAthelete = createSelector([selectAtheletes,selectEditAtheleteId ],
(atheletes,atheleteId) => {
    const filteredAtheletes = atheletes.filter((athelete) => athelete.atheleteId === atheleteId)
    return filteredAtheletes.length > 0 ? filteredAtheletes[0] : null
}
    
    )
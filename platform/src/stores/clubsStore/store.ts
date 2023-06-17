import { configureStore } from '@reduxjs/toolkit'
import atheleteReducer from './slices/atheleteSlice'
import navigationReducer from './slices/navigationSlice'

export const store = configureStore({
  reducer: {
    athelete: atheleteReducer,
    navigation:navigationReducer
  },
})


export type AppDispatch = typeof store.dispatch
export type RootState = ReturnType<typeof store.getState>



import { IAthelete } from '@/core/athelete/atheleteEntity'
import { specialties, divisions } from '@/core/divisions/divisions'
import { IParticipant, IParticipation, IParticipationEntity, mockParticipants } from '@/core/participants/participantsEntity'
import { createSelector, createSlice, PayloadAction } from '@reduxjs/toolkit'
import { RootState } from '../store'



interface StoreInitialState {
    participants: IParticipant[],
    specialties: IParticipationEntity[],
    divisions: IParticipationEntity[],
    selectedParticipantId: string | null,
    isEditing: boolean
}

const initialState: StoreInitialState = {
    participants: mockParticipants,
    divisions: divisions,
    specialties: specialties,
    selectedParticipantId: null,
    isEditing: false
}

export const participantsSlice = createSlice({
    name: 'participants',
    initialState: initialState,
    reducers: {
        addParticipant(state, action: PayloadAction<IParticipant>) {
            const existsIndex = state.participants.findIndex(target => target.athelete.atheleteId === action.payload.athelete.atheleteId)
            if (existsIndex === -1) {
                state.participants.push(action.payload)
            }
            state.selectedParticipantId = null
        },
        deleteParticipant(state, action: PayloadAction<string>) {
            state.participants = state.participants.filter((Participant) => !(Participant.athelete.atheleteId === action.payload));
            state.selectedParticipantId = null
        },
        updateParticipant(state, action: PayloadAction<IParticipant>) {
            const index = state.participants.findIndex(target => target.athelete.atheleteId === action.payload.athelete.atheleteId)
            if (index !== -1) {
                state.participants[index] = action.payload
            }
            state.selectedParticipantId = null

        },
        selectParticipant(state, action: PayloadAction<string>) {
            state.selectedParticipantId = action.payload
        },
        setSpecialties(state, action: PayloadAction<IParticipationEntity[]>) {
            state.specialties = action.payload
        },
        setDivisions(state, action: PayloadAction<IParticipationEntity[]>) {
            state.divisions = action.payload
        },
        addAtheleteParticipation(state, action: PayloadAction<IParticipation>) {
            const index = state.participants.findIndex(target => target.athelete.atheleteId === state.selectedParticipantId)
            if (index !== -1) {
                const existsIndex = state.participants[index].participations.findIndex(target => target.division.id === action.payload.division.id && target.specialty.id === action.payload.specialty.id)
                if (
                    existsIndex !== -1
                ) {
                    state.participants[index].participations.push(action.payload)

                }
            }
        },
        deleteAtheleteParticipation(state, action: PayloadAction<IParticipation>) {
            const index = state.participants.findIndex(target => target.athelete.atheleteId === state.selectedParticipantId)
            if (index !== -1) {
                state.participants[index].participations = state.participants[index].participations
                    .filter(participation =>
                        !(participation.division.id === action.payload.division.id
                            && participation.specialty.id === action.payload.specialty.id)
                    )
            }
        },
        updateAtheleteParticipation(state, action: PayloadAction<IParticipation[]>) {
            const index = state.participants.findIndex(target => target.athelete.atheleteId === state.selectedParticipantId)
            if (index !== -1) {
                state.participants[index].participations = action.payload
            }

        },
        setEditingMode(state, action: PayloadAction<boolean>) {
            state.isEditing = action.payload
        }



    },
})

export const selectParticipants = (state: RootState) => state.participant.participants
export const selectEditParticipantId = (state: RootState) => state.participant.selectedParticipantId
export const selectSpecialties = (state: RootState) => state.participant.specialties
export const selectDivisions = (state: RootState) => state.participant.divisions
const selectedParticipantIndex = (state: StoreInitialState) => state.participants.findIndex(target => target.athelete.atheleteId === state.selectedParticipantId)

export const selectEditedParticipant = createSelector(
    [selectParticipants, selectEditParticipantId], (participants, selectedParticipantId) =>
    participants.find(target => target.athelete.atheleteId === selectedParticipantId)

)

export const selectParticipantParticipations =
    createSelector(
        [selectParticipants, selectEditParticipantId], (participants, selectedParticipantId) =>
        participants.find(target => target.athelete.atheleteId === selectedParticipantId)?.participations ?? []

    )


export const { addParticipant,setEditingMode, updateParticipant, deleteParticipant, addAtheleteParticipation } = participantsSlice.actions
export const { selectParticipant, updateAtheleteParticipation,deleteAtheleteParticipation, setSpecialties, setDivisions } = participantsSlice.actions
export default participantsSlice.reducer
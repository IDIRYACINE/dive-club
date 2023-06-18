import { IParticipant,IParticipation, IParticipationEntity } from '@/core/participants/participantsEntity'
import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import { RootState } from '../store'



interface StoreInitialState {
    participants: IParticipant[],
    specialties: IParticipationEntity[],
    divisions: IParticipationEntity[],
    selectedParticipantId: string | null
}

const initialState: StoreInitialState = {
    participants: [],
    divisions: [],
    specialties: [],
    selectedParticipantId: null,
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
        }



    },
})

export const selectParticipants = (state: RootState) => state.participant.participants
export const selectEditedParticipant = (state: RootState) => state.participant.participants.find(target => target.athelete.atheleteId === state.participant.selectedParticipantId)
export const selectEditParticipantId = (state: RootState) => state.participant.selectedParticipantId
export const selectSpecialties = (state: RootState) => state.participant.specialties
export const selectDivisions = (state: RootState) => state.participant.divisions
export const selectParticipantById = (state: RootState) => state.participant.participants.find(target => target.athelete.atheleteId === state.participant.selectedParticipantId)
export const selectParticipantParticipations = (state: RootState) => state.participant.participants.find(target => target.athelete.atheleteId === state.participant.selectedParticipantId)!.participations

export const { addParticipant, updateParticipant, deleteParticipant,addAtheleteParticipation } = participantsSlice.actions
export const { selectParticipant,deleteAtheleteParticipation, setSpecialties, setDivisions } = participantsSlice.actions
export default participantsSlice.reducer
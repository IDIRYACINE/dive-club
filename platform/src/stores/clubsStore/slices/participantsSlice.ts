import { IAthelete } from '@/core/athelete/atheleteEntity'
import { specialties, divisions } from '@/core/divisions/divisions'
import { IParticipant, IParticipation, IParticipationEntity, mockParticipants } from '@/core/participants/participantsEntity'
import { createSelector, createSlice, PayloadAction } from '@reduxjs/toolkit'
import { RootState } from '../store'



interface StoreInitialState {
    participants: IParticipant[],
    specialties: IParticipationEntity[],
    searchedAthelete: IAthelete | null | undefined,
    divisions: IParticipationEntity[],
    selectedParticipantId: string | null,
}

const initialState: StoreInitialState = {
    participants: [],
    divisions: divisions,
    specialties: specialties,
    selectedParticipantId: null,
    searchedAthelete: null
}

export const participantsSlice = createSlice({
    name: 'participants',
    initialState: initialState,
    reducers: {
        addParticipant(state, action: PayloadAction<IParticipation[]>) {
            const athelete = state.searchedAthelete
            const existsIndex = state.participants.findIndex(target => target.athelete.atheleteId === athelete?.atheleteId)
            if (existsIndex === -1) {
                state.participants.push({
                    athelete: athelete!,
                    participations: action.payload
                })
            }
            state.selectedParticipantId = null
            state.searchedAthelete = null


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
            state.searchedAthelete = null

        },
        selectParticipant(state, action: PayloadAction<string | null>) {
            state.selectedParticipantId = action.payload

            state.searchedAthelete = state.participants.find((target) =>
                target.athelete.atheleteId === action.payload
            )?.athelete

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
        setParticipants(state, action: PayloadAction<IParticipant[]>) {
            state.participants = action.payload
        },
        setSearchedAthelete(state, action: PayloadAction<IAthelete | null | undefined>) {
            state.searchedAthelete = action.payload ?? null
        }


    },
})

export const selectParticipants = (state: RootState) => state.participant.participants
export const selectEditParticipantId = (state: RootState) => state.participant.selectedParticipantId
export const selectSpecialties = (state: RootState) => state.participant.specialties
export const selectDivisions = (state: RootState) => state.participant.divisions
const selectedParticipantIndex = (state: StoreInitialState) => state.participants.findIndex(target => target.athelete.atheleteId === state.selectedParticipantId)

export const selectEditedParticipant = createSelector(
    [selectParticipants, selectEditParticipantId], (participants, selectedParticipantId) => {
        return participants.find(target => target.athelete.atheleteId === selectedParticipantId)
    }

)

export const selectParticipantParticipations =
    createSelector(
        [selectParticipants, selectEditParticipantId], (participants, selectedParticipantId) =>
        participants.find(target => target.athelete.atheleteId === selectedParticipantId)?.participations ?? []

    )

export const selectFilteredParticipants = createSelector(
    [selectParticipants, (_, gender: string) => gender],
    (participants, gender) => participants.filter(
        target => target.athelete.gender === gender
    )
)


export const { addParticipant, updateParticipant, deleteParticipant, addAtheleteParticipation } = participantsSlice.actions
export const { selectParticipant, updateAtheleteParticipation, deleteAtheleteParticipation, setSpecialties, setDivisions } = participantsSlice.actions
export const { setParticipants, setSearchedAthelete } = participantsSlice.actions

export default participantsSlice.reducer
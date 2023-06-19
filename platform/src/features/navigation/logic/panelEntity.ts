import { atheletesRoute, participantsRoute,clubStartListsRoute } from "./routes"


export interface IPanelEntity {
    title: string,
    path: string,
    index: number
}




export const clubPanels:IPanelEntity[] = [
   {
        title:"Atheletes",
        path:atheletesRoute,
        index:0,
    },
   {
        title:"Participants",
        path:participantsRoute,
        index:1
    },
    {
        title:"Startlists",
        path:clubStartListsRoute,
        index:2
    }
]

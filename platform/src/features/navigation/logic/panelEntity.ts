import { atheletesRoute, participantsRoute,clubStartListsRoute } from "./routes"


export interface IPanelEntity {
    title: string,
    path: string,
    index: number
}




export const clubPanels:IPanelEntity[] = [
   {
        title:"الرياضيين",
        path:atheletesRoute,
        index:0,
    },
   {
        title:"المشاركين",
        path:participantsRoute,
        index:1
    },
    {
        title:"قائمة الانطلاق",
        path:clubStartListsRoute,
        index:2
    }
]

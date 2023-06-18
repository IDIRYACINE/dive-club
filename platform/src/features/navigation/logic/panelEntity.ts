

export interface IPanelEntity {
    title: string,
    path: string,
    index: number
}




export const clubPanels:IPanelEntity[] = [
   {
        title:"Atheletes",
        path:"/clubs/",
        index:0,
    },
   {
        title:"Participants",
        path:"/clubs/participants",
        index:1
    }
]

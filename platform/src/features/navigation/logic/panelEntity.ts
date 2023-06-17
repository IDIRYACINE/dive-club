

 interface IPanelEntity {
    title: string,
    index: number
}


 class PanelEntity {
    public readonly title: string;
    public readonly index: number;

    constructor(props : {
        title: string,
        index: number
    }
    ) { 
        this.title = props.title;
        this.index = props.index;
    }

    toRaw(): IPanelEntity {
        return {
            title: this.title,
            index: this.index
        }
    }
}

 const clubPanels:PanelEntity[] = [
    new PanelEntity({
        title:"Atheletes",
        index:0,
    }),
    new PanelEntity({
        title:"Participants",
        index:1
    })
]

export {clubPanels,PanelEntity}
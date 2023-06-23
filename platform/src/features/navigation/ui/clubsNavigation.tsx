"use client";

import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { setActivePanel } from "@/stores/clubsStore/slices/navigationSlice";
import { Box, Button } from "@mui/material";
import clsx from "clsx";
import { IPanelEntity } from "../logic/panelEntity";
import { useRouter } from "next/navigation";


interface ClubNavigationButtonProps {
    panel: IPanelEntity,
    selectedIndex: number
}

function ClubNavigationButton(props: ClubNavigationButtonProps) {
    const dispatch = useAppDispatch()

    const { panel, selectedIndex } = props
    const router = useRouter()

    const isSelected = panel.index === selectedIndex

    const className = clsx(
        [
            
            "p-2"
        ]
    )

    function handleClick(){
        dispatch(setActivePanel(panel))
        router.push(panel.path)
    }

    const variant = isSelected ? "contained" : "text"
    const color = isSelected ? "primary" : "secondary"

    return (
        <Button color={color} variant={variant} onClick={handleClick} className={className}>
            {
                panel.title
            }
        </Button>
    )
}

export function ClubNavigationDrawer() {

    const panels = useAppSelector(state => state.navigation.panels)
    const activeIndex = useAppSelector(state => state.navigation.selectedPanelIndex)

    const boxStyle ={
        display:"flex",
        flexDirection:"column",
        height:"100vh",
        justifyContent:"center",
    }
    return (
        <Box className="bg-slate-100 pl-2" sx={boxStyle} >
            {
                panels.map((panel, index) => <ClubNavigationButton key={panel.index} panel={panel} selectedIndex={activeIndex} />)
            }
        </Box>
    );
}
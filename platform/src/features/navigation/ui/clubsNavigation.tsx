"use client";

import { useAppDispatch, useAppSelector } from "@/stores/clubsStore/hooks";
import { setActivePanel } from "@/stores/clubsStore/slices/navigationSlice";
import { Box, Button } from "@mui/material";
import clsx from "clsx";
import { PanelEntity } from "../logic/panelEntity";



interface ClubNavigationButtonProps {
    panel: PanelEntity,
    selectedIndex: number
}

function ClubNavigationButton(props: ClubNavigationButtonProps) {
    const dispatch = useAppDispatch()

    const { panel, selectedIndex } = props

    const isSelected = panel.index === selectedIndex

    const className = clsx(
        [
            isSelected ? "activeButton" : "",
            "p-2"
        ]
    )

    function handleClick(){
        dispatch(setActivePanel(panel))
    }

    return (
        <Button onClick={handleClick} className={className}>
            {
                panel.title
            }
        </Button>
    )
}

export function ClubNavigationDrawer() {

    const panels = useAppSelector(state => state.navigation.panels)
    const activeIndex = useAppSelector(state => state.navigation.selectedPanelIndex)


    return (
        <Box className="flex flex-col">
            {
                panels.map((panel, index) => <ClubNavigationButton key={panel.index} panel={panel} selectedIndex={activeIndex} />)
            }
        </Box>
    );
}
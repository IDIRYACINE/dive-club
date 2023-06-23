import { Button } from "@mui/material";



interface PrimaryTextButtonProps {
    text: string,
    onClick: () => void
}

export function PrimaryTextButton(props: PrimaryTextButtonProps) {

    return (<Button onClick={props.onClick} color="primary" variant="contained">
        {props.text}
    </Button>)
}
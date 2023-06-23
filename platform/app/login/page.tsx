"use client";

import LoginForm from "@/features/auth/loginForm";
import { Box } from "@mui/material";



export default function LoginPage() {
    const boxStyle = {
        "height": "100vh",
        "display": "flex",
        "justifyContent": "center",
        "alignItems": "center",
        "padding": "0",
        "overflowY":"hidden"
    }

    return (

        <Box sx={boxStyle}>
           <LoginForm /> 
        </Box>
    )
}
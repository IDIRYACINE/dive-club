"use client";

import LoginForm from "@/features/auth/loginForm";
import { Box } from "@mui/material";



export default function LoginPage() {
    const boxStyle = {
        "minHeight": "100vh",
        "display": "flex",
        "justifyContent": "center",
        "alignItems": "center",
        "padding": "2rem",
    }

    return (

        <Box sx={boxStyle}>
           <LoginForm /> 
        </Box>
    )
}
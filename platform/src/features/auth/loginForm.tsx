'use client'

import { Button, Card, Box, CardMedia, CardContent, TextField } from "@mui/material"
import clsx from "clsx";
import { useState } from "react";
import { signIn } from "next-auth/react"

function LoginForm() {
  const boxClassName = clsx("flex flex-row justify-start items-center h-full");
  const imageUrl = "/logo.png"
  const contentStyling = { "minWidth": "10rem",height:"100%",display:"flex",justifyContent:"center",alignItems:"center" }


  return (
    <Card>
      <Box className={boxClassName}>
        <CardMedia component="img" image={imageUrl} />
        <CardContent  sx={contentStyling}>

          <Button variant="contained" onClick={() => signIn(
            "google",
           
          )} >Login</Button>

        </CardContent>
      </Box>
    </Card>
  );
}


export default LoginForm
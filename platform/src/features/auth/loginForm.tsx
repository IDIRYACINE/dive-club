'use client'

import { Button, Card, Box, CardMedia, CardContent, TextField } from "@mui/material"
import clsx from "clsx";
import { useState } from "react";
import { signIn } from "next-auth/react"

function LoginForm() {
  const boxClassName = clsx("flex flex-row justify-start h-full");
  const imageUrl = "https://cdn4.buysellads.net/uu/1/126868/1669847230-GitLab_Blue.png"
  const contentClassName = clsx("flex flex-col justify-between items-end h-full ");
  const contentStyling = { "minWidth": "20rem" }

  const [password, setPassword] = useState<string>("admin34")

  const [email, setEmail] = useState<string>("idiryacinesp@gmail.com")


  return (
    <Card>
      <Box className={boxClassName}>
        <CardMedia component="img" image={imageUrl} />
        <CardContent className={contentClassName} sx={contentStyling}>
          <TextField
            id="outlined-username-input"
            label="Email"
            className="mb-2"
            onChange={e => setEmail(e.target.value)}
            type="text"
            autoComplete="admin email"
          />

          <TextField
            id="outlined-password-input"
            label="Password"
            className="mb-2"

            type="password"
            onChange={e => setPassword(e.target.value)}
            autoComplete="admin password"
          />

          <Button onClick={() => signIn(
            "google",
           
          )}>Login</Button>

        </CardContent>
      </Box>
    </Card>
  );
}


export default LoginForm
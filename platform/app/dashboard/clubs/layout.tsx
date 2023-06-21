"use client";

import { ClubNavigationDrawer } from "@/features/navigation";
import { store } from "@/stores/clubsStore/store";
import { Box, Container } from "@mui/material";
import { ThemeProvider } from "@mui/material/styles"
import { Provider } from "react-redux"
import { LocalizationProvider } from '@mui/x-date-pickers';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import { clubTheme } from "@/components/clubThemes";
import {  SessionProvider } from "next-auth/react";
import { ClubStorePreloader } from "@/stores/clubsStore/preloader";

export default function RootLayout({
  children
}: {
  children: React.ReactNode,
}) {

  return (
    <SessionProvider>
      <Provider store={store}>
        <ThemeProvider theme={clubTheme}>
          <ClubStorePreloader/>
          <Box className="flex flex-row h-screen">
            <ClubNavigationDrawer />
            <Container className="flex justify-center align-center h-screen overflow-y-scroll">
              <LocalizationProvider dateAdapter={AdapterDayjs}>
                {children}
              </LocalizationProvider>
            </Container>
          </Box>
        </ThemeProvider>

      </Provider>
    </SessionProvider>


  )
}

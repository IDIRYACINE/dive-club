"use client";

import { ClubNavigationDrawer } from "@/features/navigation";
import { store } from "@/stores/clubsStore/store";
import { Box, Container } from "@mui/material";
import { Provider } from "react-redux"
import { LocalizationProvider } from '@mui/x-date-pickers';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'


export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (

    <Provider store={store}>
      <Box className="flex flex-row">
        <ClubNavigationDrawer />
        <Container className="flex justify-center align-center p-4">
          <LocalizationProvider dateAdapter={AdapterDayjs}>
            {children}
          </LocalizationProvider>
        </Container>
      </Box>
    </Provider>

  )
}

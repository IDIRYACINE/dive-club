"use client";

import { ClubNavigationDrawer } from "@/features/navigation";
import { store } from "@/stores/clubsStore/store";
import { Box, Container } from "@mui/material";
import {ThemeProvider} from "@mui/material/styles"
import { Provider } from "react-redux"
import { LocalizationProvider } from '@mui/x-date-pickers';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs'
import { clubTheme } from "@/components/clubThemes";


export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
      <Provider store={store}>
            <ThemeProvider theme={clubTheme}>

        <Box className="flex flex-row">
          <ClubNavigationDrawer />
          <Container className="flex justify-center align-center p-4">
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              {children}
            </LocalizationProvider>
          </Container>
        </Box>
    </ThemeProvider>

      </Provider>


  )
}

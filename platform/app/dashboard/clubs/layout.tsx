"use client";

import { ClubNavigationDrawer } from "@/features/navigation";
import { store } from "@/stores/clubsStore/store";
import { Box } from "@mui/material";
import { Provider } from "react-redux"



export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (

    <Provider store={store}>
      <Box className="flex flex-row">
        <ClubNavigationDrawer />
        {children}

      </Box>
    </Provider>

  )
}

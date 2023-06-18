import { createTheme, ThemeOptions } from '@mui/material/styles';

 const themeOptions: ThemeOptions = {
  palette: {
    mode: 'light',
    primary: {
      main: '#3f51b5',
      contrastText: "#fff" 
    },
    secondary : {
      main: "#808080",
      contrastText: "#fff"
    },
    background: {
      default: '#cbcbcb',
    }
  },
};

export const clubTheme = createTheme(themeOptions) 
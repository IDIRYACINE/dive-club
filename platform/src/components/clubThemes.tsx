import { createTheme, ThemeOptions } from '@mui/material/styles';

 const themeOptions: ThemeOptions = {
  palette: {
    mode: 'light',
    primary: {
      main: '#3f51b5',
    },
    secondary: {
      main: '#ce7e00',
    },
    background : {
        default : '#ce7e00'
    },
    action  :{
        disabled: '#3f51b5',

    }
  },
};

export const clubTheme = createTheme(themeOptions) 
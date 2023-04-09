// React
import { useState, useEffect } from 'react';

// MUI
import { styled } from '@mui/material/styles';
import Checkbox from '@mui/material/Checkbox';
import Grid from '@mui/material/Grid';
import FlightClassIcon from '@mui/icons-material/FlightClass';

// Fictichos
import axios from '../api/axios';

const Free = styled(Checkbox)(({ theme } : { theme: any }) => ({
  backgroundColor: '#228b69',
  fontSize: 32,
  padding: theme.spacing(1),
  textAlign: 'center'
}));

const Seats = ({ id }: { id: number }) => {
  const [seats, setSeats] = useState<Array<any>>([]);
  const [left, setLeft] = useState<Array<any>>([]);
  const [right, setRight] = useState<Array<any>>([]);

  useEffect(() => {
    const GetSeats = async () => {
      try
      {
        const t = (await axios.get(`trip/${id}`)).data.seats;
        setSeats(t);
        setLeft(seats.slice(0, 24));
        setRight(seats.slice(24, 48));
      } catch(e)
      {
        console.log("Shit");
      }
    }
    GetSeats();
  }, []);

  useEffect(() => {
  }, [seats]);

  return(
    <Grid>
      <Grid container direction={'row'} columns={12}>
        {left?.map((e, i) => (
          e.occupied ? <></> :
            <Grid xs={1} key={i} p={.5}>
              <Free
                icon={<FlightClassIcon />}
              />
            </Grid>
        ))}
      </Grid>
      <Grid sx={{ height: '90px'}}></Grid>
      <Grid container direction={'row'} columns={12}>
        {right?.map((e, i) => (
          e.occupied ? <></> :
            <Grid xs={1} key={i} p={.5}>
              <Free
                checked={}
                icon={<FlightClassIcon />}
              />
            </Grid>
        ))}
      </Grid>
    </Grid>
  );
}

export default Seats;
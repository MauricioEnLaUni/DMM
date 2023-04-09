// React
import { useState, useEffect } from 'react';

// MUI
import { styled } from '@mui/material/styles';
import Checkbox from '@mui/material/Checkbox';
import Grid from '@mui/material/Grid';
import FlightClassIcon from '@mui/icons-material/FlightClass';
import AirlineSeatReclineNormalIcon from '@mui/icons-material/AirlineSeatReclineNormal';

// Fictichos
import axios from '../api/axios';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import { useLocation, useNavigate } from 'react-router-dom';

const Free = styled(Checkbox)(({ theme } : { theme: any }) => ({
  backgroundColor: '#228b69',
  padding: theme.spacing(2),
  textAlign: 'center'
}));

const Occupied = styled(Checkbox)(({ theme } : { theme: any }) => ({
  backgroundColor: '#c03741',
  padding: theme.spacing(2),
  textAlign: 'center'
}));

class Seat {
  id_bus: number;
  number: number;
  occupied: boolean;

  constructor(id: number, n: number, occupied: boolean)
  {
    this.id_bus = id;
    this.number = n;
    this.occupied = occupied;
  }
}

class SaleInfo {
  id_bus: number;
  id_usr: number;
  seats: Array<number>;
  price: number;

  constructor(id_bus: number, id_usr: number, seats: Array<number>, price: number)
  {
    this.id_bus = id_bus;
    this.id_usr = id_usr;
    this.seats = seats;
    this.price = price;
  }
}

const Seats = ({ id }: { id: number }) => {
  const [seats, setSeats] = useState<Array<Seat>>([]);

  const [left, setLeft] = useState<Array<any>>([]);
  const [right, setRight] = useState<Array<any>>([]);

  const [isLoading, setIsLoading] = useState<boolean>(true);

  const [selection, setSelection] = useState<Array<number>>([]);
  const location = useLocation();
  const from = location.state?.from?.pathname || '/Seat';
  const navigate = useNavigate();

  useEffect(() => {
    const GetSeats = async () => {
      try
      {
        const t: Array<Seat> = (await axios.get(`trip/${id}`)).data.seats;
        setSeats(t);
        setIsLoading(false);
      } catch(e)
      {
        console.log("Shit");
      }
    }
    GetSeats();
  }, [id]);

  useEffect(() => {
    setLeft(seats.slice(0, 24));
    setRight(seats.slice(24, 48));
  }, [isLoading]);

  const handleChange = (id: number) => {
    console.log(id);
    if (selection.includes(id))
        setSelection(selection => selection.filter(i => i !== id));
    if (!selection.includes(id))
        setSelection(selection => [...selection, id]);
  }

  const handleSale = async () => {
    try
    {
      const data: SaleInfo = new SaleInfo(id, 0, selection, 180 * selection.length);
      const response = await axios.post(`tickets`,
      JSON.stringify(data),
        {
          headers: { 'Content-Type': 'application/json' },
          withCredentials: true
        }
      );
    }
    catch (e)
    {
      console.log(e);
    }
    
    navigate(from, { replace: true });
  }

  useEffect(() => {
  },[selection]);
  
  if (isLoading) {
    return (<div>Loading...</div>);
  } else {
    return(
    <Grid>
      <Grid container direction={'row'} columns={12}>
        {left.map((e, i) => (
          e.occupied ?
            <Grid xs={1} key={i} p={.5} item={true}>
            <Occupied
              disabled
              icon={<AirlineSeatReclineNormalIcon />}
            /> </Grid> :
            <Grid xs={1} key={i} p={.5} item={true}>
              <Free
                sx={ selection.includes(e.number) ? { backgroundColor: '#FFA737'} : undefined }
                onChange={() => handleChange(e.number)}
                icon={<FlightClassIcon />}
              />
            </Grid>
        ))}
      </Grid>
      <Grid sx={{ height: '90px'}}></Grid>
      <Grid container direction={'row'} columns={12}>
        {right?.map((e, i) => (
          e.occupied ?
            <Grid xs={1} key={i} p={.5} item={true}>
              <Occupied icon={<AirlineSeatReclineNormalIcon />} disabled/>
            </Grid> :
            <Grid xs={1} key={i} p={.5} item={true}>
              <Free
                sx={ selection.includes(e.number) ? { backgroundColor: '#FFA737'} : undefined }
                onChange={() => handleChange(e.number)}
                icon={<FlightClassIcon />}
              />
            </Grid>
        ))}
      </Grid>
      <Button
        onClick={() => handleSale()}
      >
        <Typography>
          Submit
        </Typography>
      </Button>
    </Grid>
  );
}
}

export default Seats;
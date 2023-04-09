// React
import { useState, useEffect } from 'react';

// MUI
import { Box } from '@mui/material';
import { DataGrid, GridColDef } from '@mui/x-data-grid';

// Fictichos
import axios from '../api/axios';

const Name = (params: any) => {
  return `${params.row.home || ''} - ${params.row.destination || ''}`;
}

const columns: GridColDef[] = [
  { field: 'id', headerName: 'ID', width: 75 },
  {
    field: 'name',
    headerName: 'Corrida',
    valueGetter: Name,
    width: 300,
  },
  {
    field: 'home',
    headerName: 'Origen',
    width: 250,
  },
  {
    field: 'departure',
    headerName: 'Salida',
    width: 220,
  },
  {
    field: 'destination',
    headerName: 'Destino',
    width: 250,
  },
  {
    field: 'arrival',
    headerName: 'Llegada',
    width: 220,
  },
  {
    field: 'seats',
    headerName: 'Asientos',
    type: 'number',
    width: 70,
  }
];

const Trip = () => {
  const [trips, setTrips] = useState<Array<Bus>>([]);

  useEffect(() => {
    const GetData = async () => {
      try {
        const t = (await axios.get('/trip')).data.buses;
        setTrips(t);
      } catch(e)
      {
        console.error("Shit");
      }
    }
    GetData();
  }, []);

  useEffect(() => {
  }, [trips]);

  return(
    <Box sx={{ height: 400, width: '100%' }}>
      <DataGrid
        rows={trips}
        columns={columns}
        initialState={{
          pagination: {
            paginationModel: {
              pageSize: 10,
            },
          },
        }}
        pageSizeOptions={[10, 15, 20]}
      />
    </Box>
  );
}

export default Trip;
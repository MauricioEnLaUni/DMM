// React
import { useState, useEffect } from 'react';

// MUI
import { Box } from '@mui/material';
import { DataGrid, GridColDef } from '@mui/x-data-grid';

// Fictichos
import axios from '../api/axios';

const Name = (params: any) => {
  return `${params.row.home_city || ''} - ${params.row.destination_city || ''}`;
}

const columns: GridColDef[] = [
  { field: 'id', headerName: 'ID', width: 50 },
  {
    field: 'name',
    headerName: 'Corrida',
    valueGetter: Name,
    width: 300,
  },
  {
    field: 'home_city',
    headerName: 'Ciudad origen',
    width: 150,
  },
  {
    field: 'home_state',
    headerName: 'Estado origen',
    width: 150,
  },
  {
    field: 'departure',
    headerName: 'Salida',
    width: 220,
  },
  {
    field: 'destination_city',
    headerName: 'Ciudad de destino',
    width: 150,
  },
  {
    field: 'destination_state',
    headerName: 'Estado De destino',
    width: 150,
  },
  {
    field: 'arrival',
    headerName: 'Llegada',
    width: 200,
  },
  {
    field: 'seats',
    headerName: 'Asientos',
    type: 'number',
    width: 75,
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
    <Box sx={{ height: 400, width: '100%', backgroundColor: 'grey', borderRadius: 10, borderColor: "grey", boxShadow: "none" }}>
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
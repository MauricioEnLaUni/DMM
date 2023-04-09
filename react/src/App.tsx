// React Imports
import { useState } from 'react';
import { Route, Routes } from 'react-router-dom';

// MUI Imports

// Fictichos
import './App.css';
import Layout from './component/Layout';
import Trip from './pages/Trip';
import Seats from './pages/Seat';

const App = () => {
  const [chosen, setChosen] = useState(35);

  return (
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route path="trip" element={<Trip />} />
        <Route path="seat" element={<Seats id={chosen}/>} />
      </Route>
    </Routes>
  );
}

export default App;

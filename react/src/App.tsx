// React Imports
import { useState } from 'react';
import { Route, Routes } from 'react-router-dom';

// MUI Imports

// Fictichos
import './App.css';
import Layout from './component/Layout';
import Test from './pages/Test';

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<Layout />}>
        <Route path="test" element={<Test />} />
      </Route>
    </Routes>
  );
}

export default App;

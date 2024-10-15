import React from 'react';

import Header from "./components/Header";
import Footer from "./components/Footer";

import './App.css';


function App() {
  return (

    <div className="AppAll">

    
    <Header />
    <div>

      div section with a <span> inline span section</span>
      
    </div>
    <Footer/>

    </div>
  
);
}



export default App;
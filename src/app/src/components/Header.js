import './Header.css';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';

import MainContent from "./home/MainContent";
import MainContentAbout from "./about/MainContentAbout";

function Header() {
    return (      
      <header className="HeaderGlobal">

        <div>
          <p>MyCoffeeShop -- Coffee Analytics</p>
          

          <Router>
          
            <nav>
              <Link to="/">Home</Link> | {/* Link to Home */}
              <Link to="/about">About</Link> | {/* Link to About */}
            </nav>

            <Routes>
              <Route path="/" element={<MainContent />} /> {/* Home Page */}
              <Route path="/about" element={<MainContentAbout />} /> {/* About Page */}
            </Routes>
          
          </Router>
        </div>       
        
      </header>
    );
  }
  
  export default Header;
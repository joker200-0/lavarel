import React from 'react'
import {BrowserRouter as Router, Redirect, Route, Switch} from 'react-router-dom'

// import MasterLayout from './layouts/admin/MasterLayout';


import Register from './components/frontend/auth/Register'
import Login from './components/frontend/auth/Login';
import AdminPrivateRoute from './AdminPrivateRoute';
import Page403 from './components/errors/Page403';
import Page404 from './components/errors/Page404';
import axios from 'axios';
import PublicRoute from './PublicRoute';
import MasterLayout from './layouts/admin/MasterLayout';

//ngrok http 3000
//ngrok http 8000 --region us

axios.defaults.baseURL = "http://localhost:8000/"
// axios.defaults.baseURL = " https://4325-112-197-14-130.ngrok.io";
axios.defaults.headers.post['Content-Type'] = 'application/json';
axios.defaults.headers.post['Accept'] = 'application/json';

axios.defaults.withCredentials = true;

axios.interceptors.request.use(function (config){
  const token = localStorage.getItem('auth_token');
  config.headers.Authorization = token ? `Bearer ${token}` : '';
  // config.headers['ngrok-skip-browser-warning'] = '69420';
  return config;
});

function App() {
  return (
    <div className="App">
      <Router>
        <Switch>

            {/* <Route exact path="/" component={Home}/>
            <Route exact path="/about" component={About}/>
            <Route exact path="/contact" component={Contact}/> */}
            <Route path="/admin" component={MasterLayout}/>
        

            <PublicRoute path="/" name="Home"/>
              
            <Route path="/403" component={Page403}/>
            <Route path="/404" component={Page404}/>
       

             <Route path="/Login">
              {localStorage.getItem('auth_token') ? <Redirect to='/' /> : <Login />}
             </Route>
             <Route path="/register">
              {localStorage.getItem('auth_token') ? <Redirect to='/' /> : <Register />}
             </Route>
            <Route/>

            {/* <Route path="/admin" name="Admin" render={(props) => <MasterLayout{...props} /> } />  */}
        <AdminPrivateRoute path="/admin" name="Admin"/>
        </Switch>
      </Router>
    </div>
  );
}

export default App;

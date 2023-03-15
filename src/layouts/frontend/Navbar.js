import axios from "axios";
import React from "react";
import {Link, useHistory} from 'react-router-dom';

import swal from "sweetalert";
function Navbar(){

    const history = useHistory();
    const logoutSubmit = (e) =>{
        e.preventDefault();

        axios.post('/api/logout').then(res => {
            if (res.data.status === 200)
            {
                localStorage.removeItem('auth_token');
                localStorage.removeItem('auth_name');
                swal("Success",res.data.message,"Success");
                history.push('/');
            }
        });
    }

    var AuthButtons = '';
    if (!localStorage.getItem('auth_token'))
    {
        AuthButtons = (
            <ul className="navbar-nav">
                <li className="nav-item">
                    <Link className="btn btn-light" to="/login">
                    <i className="fa-solid fa-right-to-bracket me-2"></i>Đăng nhập</Link>
                </li>
                <li className="nav-item">
                    <Link className="btn btn-light" to="/register">
                    <i className="fa-regular fa-address-card me-2"></i>Đăng ký</Link>
                </li>
            </ul>
        )
    }
    else
    {
        AuthButtons = (
            <li className="nav-item">
                <button type="button" onClick={logoutSubmit} className="nav-link btn btn-danger btn-sm text-white">Đăng xuất</button>
            </li>
            
        )
    }
    return (
        <nav className="navbar navbar-expand-lg navbar-light bg-white px-3 shadow stick-top  ">
            <div className="container-fluid">

            <Link className="navbar-brand fw-bold fs-4" to="#">SHOES SHOP</Link>
            <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
            </button>

            <div className="collapse navbar-collapse" id="navbarSupportedContent">
                <ul className="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li className="nav-item">
                            <Link className="nav-link active" to="/">Trang chủ</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/about">Thông tin</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/contact">Liên hệ</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/collections">Mặt hàng</Link>
                        </li>
                    
                        <li className="nav-item">
                            <Link className="btn btn-light" to="/cart">
                            <i className="fa-brands fa-shopify me-2"></i>Giỏ hàng</Link>
                        </li>
                        {AuthButtons}
                    </ul>
               
                </div>
            </div>
        </nav>
    );
}

export default Navbar;
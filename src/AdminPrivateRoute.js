import React, { useEffect, useState } from "react";
import { Redirect, Route } from "react-router-dom";
import MasterLayout from "./layouts/admin/MasterLayout";
import axios from "axios";
import swal from "sweetalert";
import { useHistory } from "react-router-dom";

//  BrowserRouter: Được sử dụng phổ biến hơn, nó sử dụng History API có trong HTML5 để theo dõi lịch sử bộ định tuyến của bạn.

// HashRouter: Sử dụng hash của URL (window.location.hash) để ghi nhớ mọi thứ.
 //lấy dữ liệu trên trang api get/checkingAuthenticated về 
        //1.useEffect(callback) luôn được gọi sau component 
        //1.1 goi call-back mỗi khi component re-render 
        //1.2 gọi callback sau khi component thêm element vào DOM
        //2.useEffect(callback, [])
        //2.
        // useEffect(callback, [deps])
function AdminPrivateRoute({...rest}) {
        const history = useHistory();

       const [Authenticated, setAuthenticated] = useState(false);
       const [loading, setloading] = useState(true);
     
        useEffect(() => {
                
                axios.get(`/api/checkingAuthenticated`).then(res => {
                    if(res.status === 200 )
                    {
                        setAuthenticated(true);
                    }
                    setloading(false);
                });

                return () => {
                    setAuthenticated(false);
                };
              

            }, []);
          
        //xử lý trả về status 401 
        axios.interceptors.response.use(undefined, function axiosRetryInterceptor(err){
            if(err.response.status === 401)
            {
                swal("Unauthorized",err.response.data.message,"warning");
                history.pushState('/');
            }
            return Promise.reject(err);
        });

        axios.interceptors.response.use(function (response) {
            return response;
        }, function (error){
            if(error.response.status === 403)// Acess Denied
            {
                swal("Forbidden", error.response.data.message, "warning");
                history.push('/403');
            } else  if(error.response.status === 404)// Page Not Found
            {
                swal("404 Error", "Url/Page Not Found", "warning");
                history.push('/404');
            }
            return Promise.reject(error);
        }
        );

        if (loading)
        {
            return <h1>loading...</h1>
        }
        return (
        <Route {...rest}
            render={ ({props, location}) =>
                Authenticated ?
                ( <MasterLayout{...props} />) :
                ( <Redirect to ={{pathname: "/login", state: {from: location} }}/>)
            }
        />

    );
    
}

export default AdminPrivateRoute;
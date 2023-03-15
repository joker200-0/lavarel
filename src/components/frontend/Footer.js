
import React from 'react';
import css from './Home.module.css'
import fb from './image/icon/fb.png'
import tw from './image/icon/twt.png'
import ins from './image/icon/ins.png'
import ytb from './image/icon/ytb.png'

function Footer() {
    return  (
        <div>
       
           
       <table className={css.footer}>
                    <tr>
                        <th>GIF CARDS</th>
                        <th>GET HELP</th>
                        <th>ABOUT ME</th>
                        <th></th>
                        <th></th>
                        <th><img src={fb} className={css.icon}/>  
                        <img src={tw} className={css.icon} />   
                        <img src={ins} className={css.icon} />   
                        <img src={ytb} className={css.icon} /></th>
                    </tr>
                    <tr>
                        <th>PROMOTIONS</th>
                        <td>Order Status</td>
                        <td>News</td>
                    </tr>
                    <tr>
                        <th>FIND A STORE</th>
                        <td>Shipping and Delivery</td>
                        <td>Careers</td>
                    </tr>
                    <tr>
                        <th>SIGN UP FOR EMAIL</th>
                        <td>Returns</td>
                        <td>Investor</td>
                    </tr>
                    <tr>
                        <th>BECOME A MEMBER</th>
                        <td>Payment Options</td>
                        <td>Purpose</td>
                    </tr>
                    <tr>
                        <th>NIKE JOURNAL</th>
                        <td>Gif Card Balance</td>
                        <td>Sustainability</td>
                    </tr>
                    <tr>
                        <th>SEND US FEEDBACK</th>
                        <td>Contact Us</td>
                    </tr>
                </table>
            
        </div>
    )
}

export default Footer;

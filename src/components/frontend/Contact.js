import React from 'react';
import css from './Contact.module.css';
import phonect from './image/contact/phonect.png'
import message from './image/contact/message.png'
import location from './image/contact/location.png'
import Footer from './Footer';

function Contact() {
    return  (
        <div >
            <div className={css.bg}>
            <h2>CONTACT US</h2>
            <hr className={css.hr}/>
            <div>
                <table>
                    <tr>
                        <th><img src={phonect} className={css.icon}/></th>
                        <th><img src={phonect} className={css.icon}/></th>
                        <th><img src={phonect} className={css.icon}/></th>
                    </tr>
                    <tr>
                        <td><h6>PRODUCTS & ORDERS <br/>
                            0945-694-947<br/>
                            4 am - 11 pm PT <br/>
                            7 days a week
                            </h6></td>
                        <td><h6>NRC, NTC & .SWOOSH<br/>
                            0945-134-947<br/>
                            8 am - 5 pm PT <br/>
                            Mon - Fri
                            </h6></td>
                        <td><h6>
                            COMPANY INFO & INQUIRES<br/>
                            0945-675-947 <br/>
                            7 am - 4 pm PT <br/>
                            Mon - Fri
                        </h6></td>
                    </tr>
                    <tr>
                        <th><img src={message} className={css.icon}/></th>
                        <th><img src={location} className={css.icon1}/></th>
                    </tr>
                    <tr>
                    <td><h6>PRODUCTS & ORDERS <br/>
                            Chat with us<br/>
                            4 am - 11 pm PT <br/>
                            7 days a week
                            </h6></td>
                    <td><h6>STORE LOCATOR <br/>
                            Find Nike retail store near you
                            </h6></td>
                    </tr>
                </table>
            </div>
            </div>
            <Footer/>
        </div>
    )
}

export default Contact;
import React from 'react';
import css from './Home.module.css'
import image from './image/giphy.gif'
import nse from './image/NikeW/NSEssential.png'
import banner2 from './image/NikeW/super-awesome-warp-t-shirt-design-typography-text-warp-vector-design_812921-79.avif'
import banner3 from './image/NikeW/banner3.PNG'
import banner4 from './image/NikeW/banner4.PNG'
// import banner5 from './image/NikeW/banner5.PNG'
import Footer from './Footer';
import ViewCategory from './collections/ViewCategory';

function Home()  {
    
    
    
    return (
        
        <div className="hero">
            <div className={css.bg}>
                <table>
                    <th>
                        <td>
                            <img src={image} className = {css.headding} />
                        </td>
                    </th>
                </table>
            </div>
            <div className={css.bg}>
                    <h5>Xu hướng</h5>
                <table>
                    <th>
                        <img src={nse} className={css.banner2} />
                    </th>
                    <th>
                        <img src={banner2} className={css.banner2} />
                    </th>
                </table>
                <button className={css.btn}>Shop</button>
                <button className={css.btn2}>Shop</button>
            </div>
            <div className={css.bg}>
                <h5>Loại hàng</h5>
                <ViewCategory/>
            <table>

                <tr>
                    <th>
                    
                            <img src={banner3} className={css.banner1} />
                            
                    </th>
                    <th>
                            <img src={banner4} className={css.banner1} />
                            
                    </th>
               </tr>
               
                    
                
                </table>
                
            </div>
           
               <Footer/>
              
              
        </div>
        
    );
}

export default Home;
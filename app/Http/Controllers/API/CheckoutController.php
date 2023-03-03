<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Order;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    public function placeorder(Request $request)
    {
        if(auth('sanctum')->check())
        {
            $validator = Validator::make($request->all(),[
                'firstname' => 'required|max:191',
                'lastname' => 'required|max:191',
                'phone' => 'required|max:191',
                'email' => 'required|max:191',
                'address' => 'required|max:191',
                'city' => 'required|max:191',
                'state' => 'required|max:191',
                'zipcode' => 'required|max:191',
            ]);
            if($validator->fails())
            {
                return response()->json([
                    'status'=>422,
                    'errors'=>$validator->messages(),
                ]);
            }
            else
            {
                $user_id = auth('sanctum')->user()->id;
                $order = new Order();
                $order->user_id = auth('sanctum')->user()->id;
                $order->firstname = $request->firstname;
                $order->lastname = $request->lastname;
                $order->phone = $request->phone;
                $order->email = $request->email;
                $order->address = $request->address;
                $order->city = $request->city;
                $order->state = $request->state;
                $order->zipcode = $request->zipcode;

                $order->payment_mode = "COD";
                $order->tracking_no = 'nguyentin'.rand(1111,9999);
                $order->save();

                //lấy ra use_id của mặt hàng 
                $cart = Cart::where('user_id', $user_id)->get();
                
                $orderitems = [];
                foreach($cart as $item)
                {
                    $orderitems[] = [
                        'product_id'=>$item->product_id,
                        'qty'=>$item->product_qty,
                        'price'=>$item->product->selling_price,
                    ];
                    // update số lượng hàng còn lại 
                    $item->product->update([
                        //
                        'qty'=>$item->product->qty - $item->product_qty
                    ]);
                }
                
            //tạo nhiều đơn đặt hàng 
            $order->orderitems()->createMany($orderitems);
            //Hủy các món thêm trong giỏ hàng 
            Cart::destroy($cart);
            
                return response()->json([
                    'status'=>200,
                    'message'=>'Đặt hàng thành công',
                ]);
            }
        }
        else
        {
            return response()->json([
                'status'=> 401,
                'message'=> 'Đăng nhập để tiếp tục',
            ]);
        }
    }

 
}

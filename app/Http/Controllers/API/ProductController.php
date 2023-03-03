<?php

namespace App\Http\Controllers\API;

use App\Models\Product;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    //hàm trả về tất cả sản phẩm 
    public function index()
    {
        $products = Product::all();
        return response()->json([
            'status'=>200,
            'products'=>$products
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_id'=>'required|max:191',
            'slug'=>'required|max:191',
            'name'=>'required|max:191',
	        'meta_title'=>'required|max:191',
            'brand'=>'required|max:20',
            'selling_price'=>'required|max:20',
            'original_price'=>'required|max:20',
            'qty'=>'required|max:4',
            'image'=>'required|image|mimes:jpeg,png,jpg|max:2048',
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
            $product = new Product;
            $product->category_id = $request->input('category_id');
            $product->slug = $request->input('slug');
            $product->name = $request->input('name');
            $product->description = $request->input('description');

	        $product->meta_title = $request->input('meta_title');
            $product->meta_keyword = $request->input('meta_keyword');
            $product->meta_descrip = $request->input('meta_descrip');

            $product->brand = $request->input('brand');
            $product->selling_price = $request->input('selling_price');
            $product->original_price = $request->input('original_price');
            $product->qty = $request->input('qty');

            if($request->hasFile('image'))
            {
                $file = $request->file('image');
                $extension = $file->getClientOriginalExtension();
                $filename = time() .'.'.$extension;
                $file->move('uploads/product/', $filename);
                $product->image = 'uploads/product/'.$filename;
            }

            $product->featured = $request->input('featured') == true ? '1':'0';
            $product->popular = $request->input('popular') == true ? '1':'0';
            $product->status = $request->input('status') == true ? '1':'0';
            $product->save();

            return response()->json([
                'status'=>200,
                'message'=>'Sản phẩm được thêm thành công',
            ]);
        }
    }
    //hàm kiểm tra có đúng id sản phẩm không 
    public function edit($id)
    {
        $product = Product::find($id);
        if ($product)
        {
            return response()->json([
                'status'=>200,
                'product'=>$product,
            ]);
        }
        else
        {
            return response()->json([
                'status'=>404,
                'message'=>'Không Tìm Thấy Sản Phẩm',
            ]);
        }
    }
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'category_id'=>'required|max:191',
            'slug'=>'required|max:191',
            'name'=>'required|max:191',
	        'meta_title'=>'required|max:191',
            'brand'=>'required|max:20',
            'selling_price'=>'required|max:20',
            'original_price'=>'required|max:20',
            'qty'=>'required|max:4',
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
            $product = Product::find($id);
            if($product)
            {
                //đẩy dữ liệu lên màn hình edit product
                $product->category_id = $request->input('category_id');
                $product->slug = $request->input('slug');
                $product->name = $request->input('name');
                $product->description = $request->input('description');

                $product->meta_title = $request->input('meta_title');
                $product->meta_keyword = $request->input('meta_keyword');
                $product->meta_descrip = $request->input('meta_descrip');

                $product->brand = $request->input('brand');
                $product->selling_price = $request->input('selling_price');
                $product->original_price = $request->input('original_price');
                $product->qty = $request->input('qty');
                //nếu tồn tại file ảnh 
                if($request->hasFile('image'))
                {
                    //tạo biến lấy địa chỉ của ảnh sản phẩm
                    $path = $product->image;
                    //nếu tồn tại ảnh với địa chỉ này 
                    if(File::exists($path))
                    {
                        //xóa file ảnh 
                        File::delete($path);
                    }
                    //dữ liệu ảnh sẽ lưu vô biến file
                    $file = $request->file('image');
                    //biến extension  hiển thị phần mở rộng tệp 
                    $extension = $file->getClientOriginalExtension();
                    $filename = time() .'.'.$extension;
                    //file->move là di chuyển đến thư mục tải lên
                    $file->move('uploads/product/', $filename);
                    //biến $product sẽ nhận file ảnh
                    $product->image = 'uploads/product/'.$filename;
                }
                //làm cho 3 nút checbox
                $product->featured = $request->input('featured');
                $product->popular = $request->input('popular');
                $product->status = $request->input('status');
                $product->update();

                return response()->json([
                    'status'=>200,
                    'message'=>'Sản phẩm được cập nhật thành công',
                ]);
            }
            else
            {
                return response()->json([
                    'status'=>404,
                    'message'=>'Sản phẩm không có',
                ]);
            }
        }
    }

}
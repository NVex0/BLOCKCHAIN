Reentrancy : tấn công Reentrancy (Re-Enter) là lỗ hổng bảo mật xảy ra trong smart contract cho phép các đoạn code hoặc 1 contract bên ngoài không đáng tin cậy tương tác và thực thi bên trong contract đó. Điều này có thể xảy ra khi 1 smart contract gọi tới 1 contract bên ngoài, sau đó contract bên ngoài lại gọi lại contract gốc, gây ra 1 vòng lặp vô hạn (đệ quy) và có khả năng đánh cắp tiền do đó có thể hiểu tại sao tên tấn công lại là Reentrancy - khai thác gửi đệ quy.

Ví dụ:

Contract này mô phỏng 1 ngân hàng có chức năng gửi tiền, rút tiền, xem số dư:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/6bb98d50-d3ba-4271-ba18-2ce4233a482a)

Contract này mô phỏng cho attacker:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/c9486e2d-c5a5-48d4-b9d7-9bef67d218ff)

----

#### Đi vào phương thức attack:

+ Deploy bank - thể hiện là bank đang hoạt động.

+ Dùng 1 ví để nạp vào bank 20 ethers.
  
+ Dùng 1 địa chỉ ví khác, deploy contract Attacker tương tác với Bank.

+ Nạp 1 ether vào bank, ấn attack, khi này attacker sẽ rút sạch 20 ether trong bank kèm 1 ether attacker vừa nạp vào nữa.

#### Cách thức hoạt động của attack này:

> Note: Kể từ phiên bản `0.6.0` của Solidity, fallback function không define bằng `function()` mà chia ra 2 hàm mới là `receive()` và `fallback()`, không có từ khóa "function" đứng trước. Hàm `receive()` được gọi khi 1 contract nhận được ether mà không có thêm input nào khác, còn hàm `fallback()` được gọi khi mà contract nhận được ether kèm 1 lời gọi tới 1 hàm không tồn tại trong contract, tức là giống như xử lý exception, nó sẽ nhảy hết vào fallback, và vì tính chất này, 1 contract chỉ được chứa 1 hàm `fallback()`.

  ![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/0fdf7c5a-2c4e-49c2-b14c-1a1bf33baf38)

  Theo như trên ảnh:

  + 1. Đầu tiên attacker nạp vào 1 ether vào bank.
   
  + 2. Việc nạp 1 ether vào bank là để thỏa mãn requirement của hàm withdrawal (muốn rút thì tối thiểu phải có 1 ether), và sau khi thỏa rồi thì attacker sẽ rút được 1 ether.
   
  + 3. Khi này, ether rút được sẽ trả về contract của attacker - cụ thể là trả vào hàm `receive()` (nếu không có hàm này thì sẽ gọi vào hàm `fallback()`).
   
  + 4. Khi đã trả vào hàm `receive()` này, cuộc tấn công chính thức bắt đầu. Khi này nó sẽ check balance trong Bank, chừng nào còn lớn hơn 1 thì lại gọi về hàm `withdrawal()`, quay lại bước 3, và cứ lặp đi lặp lại bước 3 và 4 tới khi Bank không còn đồng nào.

#### Demo:

[Demo Reentrancy Attack](https://drive.google.com/file/d/1gUakY2Ddq3OtWXNXv85yTLqnFPRJSc9Y/view?usp=sharing)

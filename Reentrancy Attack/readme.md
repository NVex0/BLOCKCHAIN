Reentrancy : tấn công Reentrancy (Re-Enter) là lỗ hổng bảo mật xảy ra trong smart contract cho phép các đoạn code hoặc 1 contract bên ngoài không đáng tin cậy tương tác và thực thi bên trong contract đó. Điều này có thể xảy ra khi 1 smart contract gọi tới 1 contract bên ngoài, sau đó contract bên ngoài lại gọi lại contract gốc, gây ra 1 vòng lặp vô hạn (đệ quy) và có khả năng đánh cắp tiền do đó có thể hiểu tại sao tên tấn công lại là Reentrancy - khai thác gửi đệ quy.

Ví dụ:

Contract này mô phỏng 1 ngân hàng có chức năng gửi tiền, rút tiền, xem số dư:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/6bb98d50-d3ba-4271-ba18-2ce4233a482a)


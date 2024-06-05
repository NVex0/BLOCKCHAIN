OverFlow-UnderFlow Attack: Overflows/underflows là lỗi xảy ra khi kết quả trung gian của một phép tính vượt quá giới hạn của kiểu dữ liệu. Điều này có thể dẫn đến kết quả bị sai lệch hoặc không như mong đợi. Trong Solidity, các kiểu dữ liệu như uint và int có giới hạn số bit cố định (ví dụ như uint8 chỉ có 8 bit). Do đó, nếu phép tính trả về kết quả quá giới hạn đó, overflow/underflow sẽ xảy ra.

Ví dụ contract sau:

![image](https://github.com/NVex0/BLOCKCHAIN/assets/113530029/74a342a6-c5bd-4064-af7d-67a5de058622)

